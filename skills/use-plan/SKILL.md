---
name: use-plan
description: Use when continuing work from a plan written by the use-claude-md skill (under .claude/plans/). Reads the plan, checks it against the current code, and resumes implementation in a fresh-context conversation. The inverse of use-claude-md — that one writes the plan, this one reads and executes it. Use when the user says /use-plan [path] or "continue from the plan".
---

Read a plan produced by the `use-claude-md` skill and continue implementing it in
a fresh-context conversation. This is the inverse of `use-claude-md`: that skill
**writes** the plan, this one **reads and executes** it.

> ⚠️ Start read-only. Do **not change any code** until the plan is restored and
> the user confirms where to start.

## Steps

### 1. Locate the plan
- If a path is given as an argument (e.g. `/use-plan .claude/plans/auth/` or
  `/use-plan .claude/plans/auth/00-overview.md`), use **that one**.
- Otherwise look under **`.claude/plans/`**:
  - If there is a single task folder, use it.
  - If there are several, list them and ask the user which to resume.
- Also check legacy locations if nothing is found (`docs/plan/`, `PLAN.md` in
  root).
- If still not found: **do not write code, do not guess.** Tell the user:
  "No plan found. Provide its path, or create one first with the `use-claude-md`
  skill." — and stop.

### 2. Read the plan fully
- Read the index first (`00-overview.md`), then every linked plan file in the
  folder — not partially.
- Extract: the **goal**, the **steps / phases**, the **file-by-file changes**,
  any **constraints**, and which steps are already marked done.

### 3. Check the code state (read-only)
- The plan may be **stale** — compare its claims against the current code.
- Read the key files the plan will touch; confirm files/functions/flags it
  mentions still exist (they may have been renamed, reverted, or already changed).
- Also read the project's `CLAUDE.md` so you follow the same conventions the plan
  was written against.
- If useful, check `git log` / `git status` to see what changed after the plan
  was written. **Read only, no edits.**

### 4. Give a short summary
Convey to the user concisely:
- **Goal** — what the plan is trying to achieve (1–2 sentences).
- **Current state** — which steps are done; if the plan and the code **disagree**,
  flag it separately ("the plan says X, but the code shows Y").
- **Remaining steps** — a clear, actionable list, adjusted to the current code.
- **Warnings** — any constraint or ⚠️ note from the plan.
- End by asking: **"Which step should we start with?"** — don't proceed without
  confirmation.

### 5. Continue the work
- Only **after** the user confirms, implement the remaining steps in order.
- Follow the conventions from `CLAUDE.md` and the existing tech stack.

### 6. Keep the plan updated
- As steps complete, tick their checkboxes (`- [x]`); when the approach or scope
  changes, append a one-line entry to the **Changelog** in `00-overview.md`.
- This keeps the plan a faithful record so the next conversation can resume
  cleanly too.

## Rules
- Read-only first: don't change code until the plan is restored and the user
  confirms.
- If no plan exists or no path is given — don't work, give a clear message.
- Don't trust the plan blindly: always compare against the code, and trust the
  code on conflicts.
