---
name: use-claude-md
description: Use whenever you need to work with a project's CLAUDE.md. Reads CLAUDE.md plus the actual project structure, code, and tech stack, plans in plan mode, asks the user for any extra requirements, merges everything into one improved plan (split across files if useful), then proceeds to implementation.
---

Use this skill whenever work needs to start from a project's `CLAUDE.md`. It
reads `CLAUDE.md` together with the real codebase, plans in plan mode, gathers
any extra requirements from the user, and merges all of it into a single
improved plan before writing any code.

> ⚠️ Start read-only and stay in plan mode. Do **not change any code** until the
> plan is written and the user has approved it.

## Steps

### 1. Locate and read CLAUDE.md
- Look for `CLAUDE.md` in the project root first.
- Also check common locations: `CLAUDE.md`, `.claude/CLAUDE.md`, `docs/CLAUDE.md`,
  and any nested `CLAUDE.md` files for sub-directories relevant to the task.
- Read each one **fully** — these files hold project conventions, commands, and
  constraints that must shape the plan.
- If no `CLAUDE.md` exists: tell the user clearly, offer to bootstrap one with the
  `/init` skill, and ask whether to continue planning without it. Don't guess
  conventions that should come from `CLAUDE.md`.

### 2. Inspect the real project (read-only)
`CLAUDE.md` can be stale or incomplete — always verify against the actual code.
- Map the project structure (top-level dirs, entry points, module layout).
- Identify the **tech stack**: language(s), framework(s), package manager, build
  tooling, test runner, lint/format setup. Read manifests such as
  `package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `composer.json`, etc.
- Read the code areas the upcoming task will touch, and note existing patterns,
  naming conventions, and abstractions to reuse.
- Where the code and `CLAUDE.md` disagree, **trust the code** and flag the
  mismatch to the user.

### 3. Ask the user for extra requirements (before planning)
Before writing the plan, ask the user — in **one** consolidated round — for
anything still missing. Ask only what you genuinely can't infer from `CLAUDE.md`
or the code, e.g.:
- Scope and goal of the upcoming work.
- Constraints, deadlines, or "must / must not" rules.
- Preferences not captured in `CLAUDE.md` (libraries, patterns, file layout).
- How detailed the plan should be and where to save it.

Collect the answers and fold them into the plan together with everything learned
in steps 1–2 — handle it all as one combined input.

### 4. Write or update the plan
Synthesize `CLAUDE.md` guidance + observed code/stack + the user's answers into a
single, improved plan for the upcoming work.
- Save plans under **`.claude/plans/<task-slug>/`** (one folder per task,
  `<task-slug>` is a short kebab-case name for the work). This keeps the repo
  root clean and sits next to `CLAUDE.md`.
- **Check for an existing plan first.** If `.claude/plans/<task-slug>/` already
  exists (or another folder clearly covers this task), **read it fully and update
  it instead of overwriting** — preserve done/in-progress state, fold the new
  requirements in, and record what changed in the Changelog. Only create a fresh
  folder for genuinely new work.
- Use whatever format is most convenient and clear for the work (phases,
  file-by-file change lists), following the **Plan file format** below.
- If the plan is large, **split it across multiple files** inside that folder
  (e.g. `.claude/plans/<task-slug>/00-overview.md` as the index, then
  `01-<area>.md`, `02-<area>.md`, …). For small work a single
  `.claude/plans/<task-slug>/00-overview.md` is enough.
- Make each step concrete and actionable: which files change, in what order, and
  how it stays consistent with the existing stack and conventions.
- Present the plan and get the user's approval before implementing (use
  `ExitPlanMode` if running in plan mode).
- Tell the user the plan path so a fresh conversation can resume it later with the
  `use-plan` skill.

#### Plan file format
Keep plans easy to track and safe to update:
- Write steps as **checkboxes** — `- [ ]` for todo, `- [x]` when done — so
  progress is visible at a glance and updates are a one-character edit.
- End the index file (`00-overview.md`) with a short **Changelog** section, e.g.:

  ```markdown
  ## Changelog
  - 2026-06-22 — initial plan
  - 2026-06-22 — added rate-limit requirement, split into 01-api.md / 02-ui.md
  ```

  Append a one-line entry whenever the plan is meaningfully changed (scope,
  approach, new/removed steps) so the history stays traceable.

### 5. Implement
- Only **after** the plan is approved, leave plan mode and carry out the work,
  following the plan and the conventions from `CLAUDE.md`.
- Keep the plan file(s) updated as you go: tick checkboxes (`- [x]`) as steps
  complete, and append a Changelog line whenever the approach changes — so the
  plan stays a faithful record of the work.

## Rules
- Read-only and in plan mode until the plan is approved.
- Read `CLAUDE.md` fully — never plan from memory of "typical" projects.
- Verify `CLAUDE.md` against the actual code; trust the code on conflicts and
  surface the mismatch.
- Ask for missing requirements in a single round before planning — don't
  drip-feed questions.
- Prefer reusing existing patterns and the established tech stack over
  introducing new ones, unless the user asks otherwise.
