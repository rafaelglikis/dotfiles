---
description: Review uncommitted changes before committing
---
Review all uncommitted changes in this repository before I commit them.

1. Run `git status --short` to identify staged, unstaged, and untracked files.
2. Inspect both `git diff --no-ext-diff` and `git diff --cached --no-ext-diff`.
3. Read relevant untracked files, because they are not included in either diff.
4. Check for correctness issues, behavioral regressions, security risks, edge cases, and missing or inadequate tests. Respect the repository's instructions and established patterns.
5. Report findings first, ordered by severity, with precise file and line references. Explain the impact and the concrete fix for each finding.
6. If there are no findings, state that explicitly and mention any residual risks or testing gaps.

Do not modify files. Keep any summary brief and secondary to the findings.
