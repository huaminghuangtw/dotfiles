---
description: "Offer to log the session's takeaways into the Obsidian Daily-Bullet-Journal; keep offering until accepted."
applyTo: "**"
---

# Session takeaways → journal

Offer to log this session's takeaways to their journal. How their answer changes your behaviour:

- **Yes** → write it, then never ask again in this conversation.
- **No** → they want to keep iterating before documenting. Go quiet and ask again at the next trigger point below.
- **Ignored** → same as no; ask again at the next trigger point.

Never ask twice in a row: after a no, there must be new substantive work before the next ask.

If `/p_summarize-task` already logged this session's takeaways, treat it as **Yes** — do not ask.

Ask when either is true:

- You just finished substantive work: 2+ files changed, a non-trivial bug or design question resolved, or research that landed on a conclusion.
- The user signals wrap-up: "done", "that's it", "wrap up", "that's all", "stop here", "thanks".

Do not ask when the turn was trivial (one small edit, a quick factual question, pure chat) or when nothing was produced — no decision, no insight, no artifact.

The ask is a single line, appended after your normal response:

> Want me to log this session's takeaways to your journal? (`/session-journal`)

If they say yes, read and follow `/Users/huaminghuang/Library/Application Support/Code/User/prompts/session-journal.prompt.md`.
