---
applyTo: "hr-cobol/**"
---
# HR-COBOL Modern Conventions

HR-COBOL is the **modern reference application** in this repository. When working
anywhere under `hr-cobol/`, follow these patterns. Do **not** regress to the
legacy Syllabus style.

## Service Layer Pattern
- Every operation is a **request/response cycle**:
  client populates a `*-req.cpy` structure, CALLs the service program,
  service populates a `*-res.cpy` structure.
- Service programs live under `hr-cobol/src/svc/` (e.g., `EMP-SVC.cbl`,
  `DEPT-SVC.cbl`, `SEQ-SVC.cbl`).
- Data access is isolated to `hr-cobol/src/dao/` — services never open files directly.

## Copybook Conventions
- Request copybooks: `*-req.cpy` (e.g., `emp-req.cpy`, `dept-req.cpy`).
- Response copybooks: `*-res.cpy` (e.g., `emp-res.cpy`, `dept-res.cpy`).
- All status codes come from `hr-cobol/copy/status-codes.cpy`.
  **Never invent new status codes** — extend the registry instead.
- Every persistent record includes `audit.cpy` fields:
  `CREATED-BY`, `UPDATED-BY`, `EFFECTIVE-DATE`.

## Data Model
- **Type-2 effective-dated history** on Person, Address, and Employee records.
  Updates create new rows; never overwrite. Use `EFFECTIVE-DATE` and end-dating semantics.
- Sequence generation is centralized in `SEQ-SVC.cbl` — do not generate IDs inline.

## Hard Constraints
- When generating new code under `hr-cobol/`, **follow the service-layer pattern**;
  do not produce monolithic `SYLABUS.cbl`-style dispatch programs.
- Do not reference Syllabus copybooks (`SYLFILE.cpy`, etc.) from `hr-cobol/`.
- Utility programs go under `hr-cobol/src/util/`; batch programs under `hr-cobol/src/batch/`.
