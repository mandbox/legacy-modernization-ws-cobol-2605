# Agent Instructions for the Syllabus Management System

## WHY
This is a 1990s-era COBOL Syllabus Management System for educational
institutions. It manages course syllabi end-to-end: registration, update,
deletion, query, listing, and report generation.

The original documentation has been **lost**. We are using the
**Code-to-Doc** approach to recover understanding — reading the source,
asking AI coding agents for explanations, and capturing what we learn
back into this repository as living documentation.

When an AI coding agent helps on this codebase, its job is to support
that recovery: explain what the code *actually does*, flag uncertainty
honestly, and help draft documentation that is faithful to the source —
not what a modern equivalent system would do.

## WHAT
- **Tech stack:** GnuCOBOL (gnucobol-compatible dialect), indexed files
  (VSAM-style on disk), no database, no web layer.
- **Modules (8 programs in `src/SYL*.cbl`):** SYLABUS, SYLREG, SYLUPD,
  SYLDEL, SYLQRY, SYLLST, SYLRPT, SYLCOM (shared utility — currently called only by SYLREG).
- **Data files:** `syllabus.dat` (indexed, RECORD KEY `SYL-COURSE-ID`),
  `syllabus_report.txt` (generated report output).
- **Copybooks:** `src/copybooks/SYLFILE.cpy`.

## HOW
- Build:  `make`
- Clean:  `make clean`
- Run:    `make run`
- Test:   *(no automated tests yet — manual menu-driven verification)*

## Hard Rules — Never Break These
1. Do not invent COBOL syntax. GnuCOBOL is strict.
2. Preserve prefix conventions (`WS-`, `LS-`, `FD-`, `SYL-`).
3. When uncertain, say so explicitly: `(uncertain — verify against FILE:line)`.
4. Indexed files use `RECORD KEY`. There is no SQL, no JOINs, no ORM.
5. Generated report output (the multi-page formatted output of `SYLLST` / `SYLRPT`) goes to `syllabus_report.txt`, not stdout. `DISPLAY` for interactive menus, prompts, and error messages is the standard COBOL pattern in this codebase and stays.
6. Cite `FILE:line` for every factual claim about the code.

## COBOL Conventions Used in This Codebase
- `WS-` = `WORKING-STORAGE` variables.
- `WS-LINE-COUNT` = **per-page line counter** inside `WS-PAGE-CONTROL`
  in `SYLLST.cbl` (NOT a file-wide line counter); resets to 0 when it
  reaches `WS-RECORDS-PER-PAGE` (10), triggering a new report page header.
- `LS-` = `LINKAGE SECTION` parameters (passed via `CALL ... USING`).
- `FD ` = `FILE DESCRIPTION`; record fields carry a record-prefix like `SYL-`.
- `88-level` entries are condition-name booleans, not data fields.
- `PERFORM ... THRU` = block invocation, inclusive of end label.
- Programs `CALL` each other by 8-character upper-case name.
- All file I/O is `ORGANIZATION IS INDEXED`, `ACCESS MODE IS DYNAMIC`.

## Domain Vocabulary
- **Syllabus** — a course curriculum record; one per offering.
- **Course** — abstract entity; a syllabus is the per-semester instance.
- **Department** (`SYL-DEPARTMENT-ID`) — academic unit, 4-char code.
- **Teacher** (`SYL-TEACHER-ID`) — single instructor per syllabus.
- **Weekly plan** (`SYL-WEEK-PLAN`) — 15-row repeating group.

## When Asked to Document
- Use **Mermaid** for diagrams.
- Cite `FILE:line` for every claim.
- Treat output as a first draft — flag uncertainty, don't fabricate.
- Match the language of the user's prompt (Japanese or English).

## Tool-Specific Notes
> For Copilot users: prefer `#codebase` for repo-wide questions.
> For other AGENTS.md-aware agents: use your tool's per-paragraph
> explain command before generating new COBOL.
