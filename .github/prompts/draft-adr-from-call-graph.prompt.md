---
agent: ask
description: Draft an ADR from an observed architectural decision
---
The user has just discovered an architectural pattern in the Syllabus Management System
(e.g., "SYLCOM is positioned as a shared utility but only SYLREG currently calls it — incomplete adoption of an intended centralization pattern"). Draft a MADR-format ADR:

# [Title — past tense, e.g., "Centralize common routines in SYLCOM"]
## Context and Problem Statement
[What forces drove this? Inferred from code structure.]
## Considered Options
* [What they did]
* [Likely alternative they did NOT pick]
## Decision Outcome
Chosen: [...]
### Consequences
* Good: [observable in code]
* Bad: [trade-off accepted]
## Confidence
[High / Medium / Low — based on how clear the rationale is from code alone]

CRITICAL: Don't invent rationale. If unsure, lower confidence and say so.
