---
description: "Audit which skills are actually used, and decide what to keep"
argument-hint: "Optional: restrict to skills matching this name"
agent: "agent"
---

Report which skills earned their slot, then act. Ground truth is the session store, not your memory of this conversation.

## Measure

Run this with the session-store SQL tool (`session_store_sql`; `copilot_sessionStoreSql` on the Copilot harness). If the tool is unavailable, say so, name the `github.copilot.chat.localIndex.enabled` setting, and stop.

```sql
SELECT substr(sf.file_path, instr(sf.file_path,'skills/')+7) AS skill,
       count(DISTINCT sf.session_id) AS sessions,
       max(s.updated_at) AS last_seen
FROM session_files sf JOIN sessions s ON s.id = sf.session_id
WHERE sf.file_path LIKE '%/skills/%/SKILL.md'
GROUP BY skill ORDER BY last_seen DESC;
```

Then compare against what is actually installed:

```sh
ls -l ~/.copilot/skills            # symlinks are skills linked out of repos
ls -1d ~/.copilot/skills/*/ | wc -l
find ~/.copilot/skills -maxdepth 1 -type l ! -exec test -e {} \; -print
```

## Decide

- Linked skill, **0 sessions in the last 30 days** → unlink it, or rewrite its description once. Never keep it as decoration.
- Unlinked skill, **≥2 reads** → offer to link it.
- Dangling link → repoint it from the skill's current path in the repo.
- Everything else → leave alone.

## Report

One table: skill | sessions | last seen | verdict (keep / unlink / link / repoint). Then at most three actions, each one command or one file edit. If the query returns no rows, say the store is empty and stop.

## Rules

- Never assert a skill was used without a row above. "We probably used it" is not evidence.
- `sessions` counts distinct sessions, not reads. Five reads inside one session is one data point.
- A read you triggered by naming a path is demand, not automatic selection. Say which one it was when the timestamps make it visible.
- Do not restate the query output as prose. The table is the report.
