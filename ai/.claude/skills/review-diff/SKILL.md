---
name: review-diff
description: Review all local code changes
---
Review all local changes in this repository as one combined code change.

1. Run `git status --short` to identify staged, unstaged, and untracked files.
2. Inspect both `git diff --no-ext-diff` and `git diff --cached --no-ext-diff`.
3. Read relevant untracked files, because they are not included in either diff.
4. Treat staged, unstaged, and relevant untracked changes as a single combined change set. Staging boundaries are discovery metadata, not review findings.
5. Check the combined code for correctness issues, behavioral regressions, security risks, edge cases, and missing or inadequate tests. Respect the repository's instructions and established patterns.
6. Report findings first, ordered by severity, with precise file and line references. Explain the impact and the concrete fix for each finding.
7. If there are no findings, state that explicitly and mention any residual risks or testing gaps.

Do not report that changes are unstaged, partially staged, or would produce an incomplete commit. Do not recommend `git add`, staging files, or rechecking the cached diff. Only report substantive issues in the combined code change.

Do not modify files. Keep any summary brief and secondary to the findings.
