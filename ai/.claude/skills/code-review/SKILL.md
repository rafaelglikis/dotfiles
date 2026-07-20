---
name: code-review
description: "Review changes since a fixed point (commit, branch, tag, or merge-base) along two axes - Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/PRD asked for?). Runs both reviews in parallel subagents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to review since X."
---

# Code Review

Review the committed and local changes between a fixed point the user supplies and the current working tree along two axes:

- **Standards** - does the code conform to this repo's documented coding standards?
- **Spec** - does the code faithfully implement the originating issue, PRD, or spec?

Run both axes as **parallel subagents** so they do not pollute each other's context, then aggregate their findings.

Review input:

$ARGUMENTS

## Process

### 1. Pin the fixed point

Whatever the user said is the fixed point - a commit SHA, branch name, tag, `main`, `HEAD~5`, etc. If they did not specify one, ask for it.

Capture the committed diff with `git diff <fixed-point>...HEAD` (three-dot, so the comparison is against the merge-base). Also capture staged changes with `git diff --cached --no-ext-diff`, unstaged changes with `git diff --no-ext-diff`, relevant untracked files from `git status --short`, and the commit list with `git log <fixed-point>..HEAD --oneline`. Treat these as one combined change set without reporting staging boundaries as findings.

Before going further, confirm the fixed point resolves with `git rev-parse <fixed-point>` and the combined change set is non-empty. A bad ref or empty change set should fail here, not inside two parallel subagents.

### 2. Identify the spec source

Look for the originating spec in this order:

1. Issue references in the commit messages (`#123`, `Closes #45`, GitLab `!67`, etc.) - use the repository remote to identify the tracker, then fetch the issue or PR body and comments with its first-party CLI or API when available. If the tracker cannot be accessed, continue to the next source instead of failing.
2. A path the user passed as an argument.
3. A PRD/spec file under `docs/`, `specs/`, or `.scratch/` matching the branch name or feature.
4. If nothing is found, ask the user where the spec is. If they say there is not one, the **Spec** subagent will skip and report "no spec available".

### 3. Identify the standards sources

Find anything in the repo that documents how code should be written, such as `CODING_STANDARDS.md` or `CONTRIBUTING.md`.

On top of whatever the repo documents, the Standards axis always carries the **smell baseline** below - a fixed set of Fowler code smells (*Refactoring*, ch. 3) that applies even when a repo documents nothing. Two rules bind it:

- **The repo overrides.** A documented repo standard always wins; where it endorses something the baseline would flag, suppress the smell.
- **Always a judgement call.** Each smell is a labelled heuristic ("possible Feature Envy"), never a hard violation. Like any standard here, skip anything tooling already enforces.

Each smell reads *what it is* -> *how to fix*. Match it against the diff:

- **Mysterious Name** - a function, variable, or type whose name does not reveal what it does or holds. -> Rename it; if no honest name comes, the design is murky.
- **Duplicated Code** - the same logic shape appears in more than one hunk or file in the change. -> Extract the shared shape and call it from both.
- **Feature Envy** - a method that reaches into another object's data more than its own. -> Move the method onto the data it envies.
- **Data Clumps** - the same few fields or params keep travelling together (a type wanting to be born). -> Bundle them into one type and pass that.
- **Primitive Obsession** - a primitive or string standing in for a domain concept that deserves its own type. -> Give the concept its own small type.
- **Repeated Switches** - the same `switch`/`if` cascade on the same type recurs across the change. -> Replace it with polymorphism, or one map both sites share.
- **Shotgun Surgery** - one logical change forces scattered edits across many files in the diff. -> Gather what changes together into one module.
- **Divergent Change** - one file or module is edited for several unrelated reasons. -> Split so each module changes for one reason.
- **Speculative Generality** - abstraction, parameters, or hooks added for needs the spec does not have. -> Delete it; inline back until a real need appears.
- **Message Chains** - long `a.b().c().d()` navigation the caller should not depend on. -> Hide the walk behind one method on the first object.
- **Middle Man** - a class or function that mostly delegates onward. -> Cut it and call the real target directly.
- **Refused Bequest** - a subclass or implementer that ignores or overrides most of what it inherits. -> Drop the inheritance and use composition.

### 4. Spawn both subagents in parallel

Launch two general-purpose subagents concurrently in a single tool-call message, using the available agent/task tool. Use Claude's `general-purpose` subagent or OpenCode's `general` subagent as appropriate.

**Standards subagent prompt** - include:

- The commands and files that make up the combined change set, plus the commit list.
- The list of standards-source files found in step 3, plus the smell baseline from step 3 pasted in full. The subagent has no other access to it.
- The brief: "Report, per file/hunk where relevant: (a) every place the diff violates a documented standard, citing the standard file and rule; and (b) any baseline smell you spot, naming it and quoting the hunk. Distinguish hard violations from judgement calls. Documented-standard breaches can be hard, but baseline smells are always judgement calls, and a documented repo standard overrides the baseline. Skip anything tooling enforces. Stay under 400 words."

**Spec subagent prompt** - include:

- The commands and files that make up the combined change set, plus the commit list.
- The path or fetched contents of the spec.
- The brief: "Report: (a) requirements the spec asked for that are missing or partial; (b) behaviour in the diff that was not asked for (scope creep); and (c) requirements that look implemented but where the implementation looks wrong. Quote the spec line for each finding. Stay under 400 words."

If the spec is missing, skip the Spec subagent and note this in the final report.

### 5. Aggregate

Present the two reports under `## Standards` and `## Spec` headings, verbatim or lightly cleaned. Do **not** merge or rerank findings - the two axes are deliberately separate.

End with a one-line summary: total findings per axis and the worst issue within each axis, if any. Do not pick a single winner across axes.

## Why two axes

A change can pass one axis and fail the other:

- Code that follows every standard but implements the wrong thing -> **Standards pass, Spec fail.**
- Code that does exactly what the issue asked but breaks the project's conventions -> **Spec pass, Standards fail.**

Reporting them separately stops one axis from masking the other.
