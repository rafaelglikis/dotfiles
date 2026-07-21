#!/usr/bin/env python3

import json
import re
import sys
from pathlib import Path


STATUSES = {
    "needs-review",
    "needs-info",
    "ready-for-agent",
    "ready-for-human",
    "wontfix",
    "done",
}


def output(result, **values):
    print(json.dumps({"result": result, **values}, separators=(",", ":")))


def scalar(value):
    value = value.strip()
    if len(value) >= 2 and value[0] == value[-1] and value[0] in "\"'":
        return value[1:-1]
    return value


def parse_ticket(path):
    lines = path.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] != "---":
        raise ValueError("missing YAML frontmatter")

    try:
        end = lines.index("---", 1)
    except ValueError as error:
        raise ValueError("unterminated YAML frontmatter") from error

    data = {}
    index = 1
    while index < end:
        line = lines[index]
        if not line.strip() or line.lstrip().startswith("#"):
            index += 1
            continue
        if line.startswith((" ", "\t")) or ":" not in line:
            raise ValueError(f"unsupported frontmatter at line {index + 1}")

        key, value = line.split(":", 1)
        key = key.strip()
        if key in data:
            raise ValueError(f"duplicate field {key!r}")

        if key == "blocked-by":
            value = value.strip()
            if value == "[]":
                data[key] = []
            elif value:
                if not (value.startswith("[") and value.endswith("]")):
                    raise ValueError("blocked-by must be a YAML list")
                content = value[1:-1].strip()
                data[key] = [] if not content else [scalar(item) for item in content.split(",")]
            else:
                blockers = []
                index += 1
                while index < end and lines[index].startswith("  - "):
                    blockers.append(scalar(lines[index][4:]))
                    index += 1
                data[key] = blockers
                continue
        else:
            data[key] = scalar(value)
        index += 1

    required = {"id", "title", "status", "blocked-by"}
    missing = sorted(required - data.keys())
    if missing:
        raise ValueError(f"missing fields: {', '.join(missing)}")
    if not re.fullmatch(r"\d+", data["id"]):
        raise ValueError("id must contain only digits")
    if not data["title"]:
        raise ValueError("title must not be empty")
    if data["status"] not in STATUSES:
        raise ValueError(f"unknown status {data['status']!r}")
    if any(not re.fullmatch(r"\d+", blocker) for blocker in data["blocked-by"]):
        raise ValueError("blocked-by IDs must contain only digits")

    return {**data, "path": str(path)}


def main():
    if len(sys.argv) != 2:
        output("error", errors=["usage: next_ticket.py <feature-or-tickets-directory>"])
        return 2

    supplied = Path(sys.argv[1]).expanduser()
    tickets_dir = supplied if supplied.name == "tickets" else supplied / "tickets"
    if not tickets_dir.is_dir():
        output("error", errors=[f"tickets directory not found: {tickets_dir}"])
        return 2

    paths = sorted(tickets_dir.glob("*.md"))
    if not paths:
        output("error", errors=[f"no Markdown tickets found in {tickets_dir}"])
        return 2

    tickets = []
    errors = []
    for path in paths:
        try:
            tickets.append(parse_ticket(path))
        except (OSError, UnicodeError, ValueError) as error:
            errors.append(f"{path}: {error}")

    by_id = {}
    for ticket in tickets:
        ticket_id = ticket["id"]
        if ticket_id in by_id:
            errors.append(f"duplicate ticket ID {ticket_id!r}: {by_id[ticket_id]['path']} and {ticket['path']}")
        else:
            by_id[ticket_id] = ticket

    for ticket in tickets:
        for blocker in ticket["blocked-by"]:
            if blocker not in by_id:
                errors.append(f"{ticket['path']}: unknown blocker ID {blocker!r}")

    if errors:
        output("error", errors=errors)
        return 2

    if all(ticket["status"] in {"done", "wontfix"} for ticket in tickets):
        output("done")
        return 0

    frontier = [
        ticket
        for ticket in tickets
        if ticket["status"] == "ready-for-agent"
        and all(by_id[blocker]["status"] == "done" for blocker in ticket["blocked-by"])
    ]
    if frontier:
        ticket = min(frontier, key=lambda item: (int(item["id"]), item["id"]))
        output("continue", ticket={key: ticket[key] for key in ("id", "title", "path")})
        return 0

    unfinished = []
    for ticket in sorted(tickets, key=lambda item: (int(item["id"]), item["id"])):
        if ticket["status"] in {"done", "wontfix"}:
            continue
        unfinished.append(
            {
                "id": ticket["id"],
                "title": ticket["title"],
                "status": ticket["status"],
                "unfinished_blockers": [
                    blocker for blocker in ticket["blocked-by"] if by_id[blocker]["status"] != "done"
                ],
            }
        )
    output("blocked", tickets=unfinished)
    return 1


if __name__ == "__main__":
    sys.exit(main())
