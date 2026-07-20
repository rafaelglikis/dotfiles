---
description: Resolve an in-progress git merge/rebase conflict.
---

1. **See the current state** of the merge/rebase. Check git history and the conflicting files.

2. **Find the primary sources** for each conflict. Understand deeply why each change was made and what the original intent was. Read the commit messages, check the PRs, and check original issues/tickets.

3. **Resolve each hunk.** Preserve both intents where possible. Where incompatible, pick the one matching the merge's stated goal and note the trade-off. Do **not** invent new behaviour. Always resolve; never `--abort`.

4. Discover the project's **automated checks** and run them - typically typecheck, then tests, then format. Fix anything the merge broke.

5. **Finish the merge/rebase.** Stage only the files resolved as part of the current merge or rebase; do not include unrelated working-tree changes. For a merge, create the merge commit after all conflicts are resolved. For a rebase, do not create a separate commit: run `git rebase --continue`, resolve any subsequent conflicts the same way, and continue until every commit is rebased.
