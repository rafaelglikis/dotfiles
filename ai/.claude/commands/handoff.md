---
description: Compact the current conversation into a handoff document for another agent to pick up.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff document summarising the current conversation so a fresh agent can continue the work. Infer the feature slug from the conversation or existing `.scratch` artifacts. If it cannot be inferred confidently, ask the user for the feature slug and wait for their answer. Save the document to `.scratch/<feature-slug>/handoff.md` and report the saved path to the user.

Include a "suggested skills" section in the document, which suggests skills that the agent should invoke.

Do not duplicate content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs). Reference them by path or URL instead.

Redact any sensitive information, such as API keys, passwords, or personally identifiable information.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the document accordingly.

Next-session focus:

$ARGUMENTS
