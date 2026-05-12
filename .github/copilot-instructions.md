# Copilot Instructions for the Syllabus Management System

## WHY
This is a 1990s-era COBOL Syllabus Management System for educational
institutions. It manages course syllabi end-to-end: registration, update,
deletion, query, listing, and report generation.

The original documentation has been **lost**. We are using the
**Code-to-Doc** approach to recover understanding — reading the source,
asking Copilot for explanations, and capturing what we learn back into
this repository as living documentation.

When you (Copilot) help on this codebase, your job is to support that
recovery: explain what the code *actually does*, flag uncertainty
honestly, and help draft documentation that is faithful to the source —
not what a modern equivalent system would do.

## WHAT
- **Tech stack:** GnuCOBOL (gnucobol-compatible dialect), indexed files
  (VSAM-style on disk), no database, no web layer.
- **Modules (8 programs in `src/SYL*.cbl`):**
  - `SYLABUS` — main menu / dispatcher; `CALL`s the others
  - `SYLREG`  — register a new syllabus
  - `SYLUPD`  — update an existing syllabus
  - `SYLDEL`  — delete a syllabus
  - `SYLQRY`  — query / lookup a single syllabus
  - `SYLLST`  — list all syllabi
  - `SYLRPT`  — generate the printed report
  - `SYLCOM`  — shared utility (validation, date handling, error formatting); currently called only by `SYLREG` (function code 'C' for course-id validation). Positioned as a shared resource, but only one caller has adopted it so far.
- **Data files:**
  - `syllabus.dat`        — main indexed data file, RECORD KEY is `SYL-COURSE-ID`
  - `syllabus_report.txt` — generated report output
- **Copybooks:** `src/copybooks/SYLFILE.cpy` defines the syllabus record
  (course ID, name, dept, teacher, semester, credits, description,
  objectives, 15-week plan).

## HOW
- Build:  `make`
- Clean:  `make clean`
- Run:    `make run`
- Test:   *(no automated tests yet — manual menu-driven verification)*

> Note: the build may currently fail. That is part of what we are
> investigating with Code-to-Doc — do not "fix" it silently; surface it.

## Hard Rules — Never Break These
1. **Do not invent COBOL syntax.** GnuCOBOL is strict. If you are not
   sure a construct compiles, say so.
2. **Preserve prefix conventions** in any suggestion (`WS-`, `LS-`,
   `FD-`, `SYL-`). Do **not** "modernize" or rename them.
3. **When uncertain about a paragraph's purpose, say so explicitly:**
   `(uncertain — verify against source at FILE:line)`.
4. **Indexed file access uses `RECORD KEY`.** Do not suggest SQL,
   relational JOINs, or ORM patterns — there is no database here.
5. **Generated report output (the multi-page formatted output of `SYLLST` / `SYLRPT`) goes to `syllabus_report.txt`, not stdout.** `DISPLAY` for interactive menus, prompts, and error messages is the standard COBOL pattern in this codebase and stays.
6. **Cite file:line for every factual claim** about the code.

## COBOL Conventions Used in This Codebase
- **`WS-` prefix** = `WORKING-STORAGE SECTION` variables
  (e.g. `WS-USER-CHOICE`, `WS-EXIT-FLAG`, `WS-MENU-ITEMS`).
- **`WS-LINE-COUNT`** = **per-page line counter** inside `WS-PAGE-CONTROL`
  in `SYLLST.cbl` (NOT a file-wide line counter). Resets to 0 when it
  reaches `WS-RECORDS-PER-PAGE` (10), triggering a new report page header.
- **`LS-` prefix** = `LINKAGE SECTION` variables — parameters passed
  between programs via `CALL ... USING` (e.g. `LS-FUNCTION-CODE`,
  `LS-RETURN-CODE` in `SYLCOM`).
- **`FD ` records** = `FILE DESCRIPTION` entries; field names typically
  carry a record-specific prefix like `SYL-` (`SYL-COURSE-ID`,
  `SYL-COURSE-NAME`, `SYL-WEEK-PLAN`).
- **`88-level entries`** are condition names (boolean flags), not data
  fields. `88 WS-EXIT VALUE 9.` means "the flag is true when the parent
  variable holds 9".
- **`PERFORM ... THRU`** = block invocation; executes paragraphs from
  the start label *through* the end label, inclusive.
- **Programs `CALL` each other by name**, 8-character upper-case (e.g.
  `CALL "SYLCOM"`).
- **All file I/O uses indexed access** (`ORGANIZATION IS INDEXED`,
  `ACCESS MODE IS DYNAMIC`). No sequential-only files in this app.

## Domain Vocabulary
- **Syllabus** — a course curriculum record; one per offering.
- **Course** — the abstract entity; a syllabus is the specific instance
  for a given semester.
- **Department** (`SYL-DEPARTMENT-ID`) — academic unit, 4-char code.
- **Teacher** (`SYL-TEACHER-ID`) — single instructor per syllabus.
- **Weekly plan** (`SYL-WEEK-PLAN`) — 15-row repeating group;
  one entry per teaching week.

## When Asked to Document
- Use **Mermaid** for any diagrams (sequence, flow, ER).
- Cite specific `FILE:line` for every claim.
- Treat output as a **first draft** — flag uncertainty rather than
  fabricating confident-sounding details.
- Prefer Japanese or English to match the language of the user's prompt.
- Default skeleton: **Overview → Inputs → Outputs → Side effects →
  Open questions** (this is the seed of the `/document-paragraph`
  prompt we'll extract in Phase 5).
  