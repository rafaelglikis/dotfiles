---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, invoke the `review-diff` skill (`/review-diff` in Claude) to review all uncommitted work. If the current tool cannot invoke the skill, perform the same workflow directly: inspect `git status --short`, staged and unstaged diffs, and relevant untracked files as one combined change set; report and fix substantive findings before continuing.

After the review is clean, commit your work to the current branch.

Work to implement:

$ARGUMENTS
