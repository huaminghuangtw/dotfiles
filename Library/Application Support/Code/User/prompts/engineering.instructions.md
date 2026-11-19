---
applyTo: "**"
---

- Before editing, name the module that owns this behavior in one line. If the
  fix lands outside it, move it there or say why not.
- Change the code that produces the artifact, not the artifact. If you bypass a
  generator, name it.
- Fixing the same bug in the same area twice means the design is wrong. Stop,
  say what's structurally broken, and get a decision before the second patch.
- Symptom-level fix: state it as `Debt: <real fix> — <why not now>`.
- More than one file, a new data path, or a bug fixed before → plan first via
  Lean Planner; no edits during planning.
- Say what would break if your assumption is wrong. Never call the work done
  before you can answer that.
- When you load a skill, say so on the line where you name the owning module:
  `Skill: <name>`. If two skills plausibly fit and you loaded neither, name both
  and say why.
