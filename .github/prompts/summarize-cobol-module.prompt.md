---
agent: ask
description: Generate a per-module summary in COBOL Code-to-Doc format
---
The user has #<filename> referenced a single COBOL module from this Syllabus Management
System repo. Generate a Markdown summary with:

## <ModuleName>
### Purpose
### Public Interface (paragraphs called from outside)
### Internal Paragraphs
### Files Read / Written
### Calls Out To
### Called By (best-effort — search the repo)
### Open Questions

Cite paragraph and copybook names verbatim. Do not invent.

CRITICAL: If you have not actually fetched the file content (via Read/grep tool
calls or because it appears in the chat context), do not list paragraph names
from convention or guesswork. Instead, write
`(file content not loaded — re-invoke with the file open in the editor)`
and stop. Naming conventions like `<MODULE>-<VERB>` are not in this codebase.
