---
applyTo: |
  src/SYL*.cbl
  src/copybooks/SYL*.cpy
  src/copybooks/DEPFILE.cpy
  src/copybooks/TEAFILE.cpy
---
# Syllabus Management System Rules

When reading or generating code in the Syllabus modules, follow these app-specific conventions.

## Architecture
- The 8 modules form a **menu-dispatch architecture**: `SYLABUS.cbl` is the driver
  and directly CALLs `SYLREG`, `SYLUPD`, `SYLDEL`, `SYLQRY`, `SYLLST`, `SYLRPT` (six handlers).
  `SYLCOM` is the shared common module reached **indirectly** via `SYLREG` only
  (`CALL "SYLCOM" USING ... function code "C"` for course-id validation).
- All persistent storage is via `syllabus.dat` (indexed file, RECORD KEY based).
- Reports go to `syllabus_report.txt`.

## Coding Conventions
- Use **88-level condition names** for all boolean checks
  (e.g., `MENU-CHOICE-VALID`, `RECORD-FOUND`). Never compare numeric values inline.
- `WS-LINE-COUNT` is a **per-page line counter** in `WS-PAGE-CONTROL` (`SYLLST.cbl`) — **resets to 0** when it reaches `WS-RECORDS-PER-PAGE` (10) and a new page header is emitted.
- Department codes are **4 characters**, fixed-width.
- Course IDs are **6 characters**, fixed-width (`SYL-COURSE-ID PIC X(6)`: 2 alphabetic prefix + 4 numeric suffix, validated by `SYLCOM` function code `"C"`).
- Copybook names follow the pattern `<DOMAIN>FILE.cpy` (e.g., `SYLFILE.cpy`, `DEPFILE.cpy`).

## Hard Constraints
- **Never suggest SQL** — file access is RECORD KEY based via indexed I/O.
- Never introduce a new copybook without checking `src/copybooks/` first.
- Do not introduce CALL chains deeper than 2 — keep dispatch flat from `SYLABUS`.

## Style
- File errors should propagate via `LIBERROR.cpy`-style status codes; do not invent new ones.
