---
name: explore-repo
description: "Check out a repository under ~/dev/scratch and investigate whether its code, skills, or patterns can help with a stated goal."
disable-model-invocation: true
---

# Explore Repo

Investigate a repository as a source of reusable ideas for the user's stated goal. Do not modify the repository.

Repository and question:

$ARGUMENTS

## Process

1. Extract the repository URL and investigation question from the input. If either is missing, ask for it and wait.
2. Ensure `~/dev/scratch` exists. Derive the checkout directory from the repository name.
3. If the checkout does not exist, clone the repository there. If it already exists and is a Git repository with the same origin, update it with a fast-forward-only pull. If the path exists but is not the expected repository, stop and report the conflict; do not overwrite it.
4. Read the repository instructions before exploring. Search broadly for code, skills, documentation, scripts, and architectural patterns relevant to the question.
5. Read the strongest candidates in full and trace their supporting files when needed. Distinguish direct implementations from merely related terminology.
6. Report:
   - The checkout path
   - Relevant findings with precise file references
   - What can be reused or adapted
   - Important limitations or gaps
   - A concrete recommendation for the user's goal

Prefer evidence from the checked-out repository over assumptions. Do not implement the recommendation unless the user separately asks you to.
