---
description: Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated to a background agent.
---

Spin up a **background agent** to do the research, so you keep working while it reads.

Before starting, infer the feature slug from the conversation or existing `.scratch` artifacts. If it cannot be inferred confidently, ask the user for the feature slug and wait for their answer.

Its job:

1. Investigate the question against **primary sources** - official docs, source code, specs, first-party APIs - not a secondary write-up of them. Follow every claim back to the source that owns it.
2. Write the findings to a single Markdown file, citing each claim's source.
3. Save it to `.scratch/<feature-slug>/research.md` and report the saved path to the user.

Research question:

$ARGUMENTS
