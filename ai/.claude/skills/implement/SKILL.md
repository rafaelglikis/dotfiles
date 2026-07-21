---
name: implement
description: "Implement work from a spec or ticket. Use only when explicitly told to invoke the implement skill."
---

Implement the work described by the user in the spec or tickets.

When given a ticket, read its YAML frontmatter before making changes:

1. Continue only when its status is `ready-for-agent`. If it is `ready-for-human`, `needs-review`, `needs-info`, `wontfix`, or `done`, stop and explain why it cannot be implemented by the agent.
2. Resolve every ID in `blocked-by` against the other ticket files in the same `tickets` directory. Continue only when every blocking ticket has status `done`; otherwise, report the unfinished blockers and stop.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, invoke the `review-diff` skill (`/review-diff` in Claude) to review all uncommitted work. If the current tool cannot invoke the skill, perform the same workflow directly: inspect `git status --short`, staged and unstaged diffs, and relevant untracked files as one combined change set; report and fix substantive findings before continuing.

After the review is clean, change the ticket's status to `done`, include that update in the work, and commit to the current branch.

Work to implement:

$ARGUMENTS
