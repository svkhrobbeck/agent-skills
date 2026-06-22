---
name: use-handoff
description: Use when continuing work from an existing HANDOFF.md; restore a fresh-context conversation from the handoff document. The inverse of the "handoff" skill — that one writes, this one reads and resumes. Use when the user says /use-handoff [path] or "continue from the handoff".
---

Read an existing HANDOFF.md document and continue its work in a fresh-context
conversation. This is the inverse of the "handoff" skill: that one **writes** the
context, this skill **reads and restores** it.

> ⚠️ Start with a read-only analysis. Do **not change any code** until the
> context is fully restored and the user confirms. Strictly obey any warning in
> the document (e.g. "do not write code until asked").

## Steps

### 1. Locate HANDOFF.md
- If a file path is given as an argument (e.g. `/use-handoff ./HANDOFF.md` or
  `/use-handoff docs/HANDOFF.md`), use **that one**.
- Otherwise look for `HANDOFF.md` in the project root.
- If not found, check common names too (`HANDOFF.md`, `HANDOFF.MD`, `handoff.md`,
  `docs/HANDOFF.md`).
- If still not found: **do not write code, do not guess.** Tell the user clearly:
  "HANDOFF.md not found. Please provide its path, or create one first with the
  `handoff` skill." — and stop.

### 2. Read the document fully
- Read HANDOFF.md from start to finish (not partially).
- Extract the key sections: **Goal**, **Current Progress**, **What Worked**,
  **What Didn't Work**, **Next Steps**, **File map / critical files**, and any
  **warnings/notes**.

### 3. Check the code state (read-only)
- The document may be **stale** — compare its claims against the current code.
- Read the key files mentioned in the "File map" / critical files.
- Confirm that functions/files/flags mentioned in the document **still exist**
  (they may have been renamed or reverted).
- If useful, check recent changes with `git log` / `git status` — know what
  changed after the document was written. **Read only, no edits.**

### 4. Give a short summary
Convey the following to the user concisely and clearly:
- **Goal** — what we're trying to achieve (1-2 sentences).
- **Current state** — what's done, what works; if you find a **mismatch**
  between the document and the code, flag it separately ("the doc says X, but the
  code shows Y").
- **Next Steps** — a clear, actionable list (from the document, but adjusted to
  the current code state).
- **Warnings** — repeat any ⚠️ condition from the document (e.g. "do not write
  code until asked").
- End by asking: **"Which step should we start with?"** — do not proceed without
  confirmation.

### 5. Continue the work
- Only **after** the user confirms, work through the Next Steps.
- Do **not repeat** the "What Didn't Work" approaches.
- Carry out the planned work.

### 6. Keep HANDOFF.md updated
- When something significant changes during the work (a step finishes, a new
  diagnosis, an approach changes), keep HANDOFF.md updated — or offer to update
  it with the `handoff` skill at the end, so the next conversation can also
  restore cleanly.

## Rules
- Read-only first: don't change code until the context is restored and the user
  confirms.
- If HANDOFF.md doesn't exist or no path is given — don't work, give a clear
  message.
- Don't trust the document blindly: always compare against the code.
