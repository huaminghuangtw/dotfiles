---
description: "Publish the huam.ing site repo: sync submodules, commit with a generated message, rebase, push"
argument-hint: "Optional: commit message, or a scope like 'components' to steer the generated subject"
agent: "agent"
---

Publish the site repo. The user has already reviewed the work and decided it is ready — your job is the parts they do not want to do: sync submodule pointers, write the commit subject, commit, rebase onto CI's bot commits, push. Never ask for confirmation, never ask them to write the message, never stop to "check" something you can check yourself.

Repo: `~/Sites/huam.ing` (all commands below run from there).

## 1. Preflight

```bash
cd ~/Sites/huam.ing && git status -sb && git rev-parse --abbrev-ref HEAD
```

Stop and report if any of these is true:
- branch is not `main` — say which branch, do not switch or push it.
- `git status` lists unmerged paths (`UU`, `AA`, `DD`) — say which files.
- a rebase or merge is in progress (`.git/rebase-merge`, `.git/rebase-apply`, `.git/MERGE_HEAD` exists).

## 2. Sync submodules from their remotes

One at a time, so a content worktree with uncommitted edits cannot block the rest:

```bash
cd ~/Sites/huam.ing && while IFS= read -r p; do
  branch=$(git -C "$p" rev-parse --abbrev-ref HEAD)
  git -C "$p" fetch --quiet origin &&
    git -C "$p" merge --quiet --ff-only "origin/$branch" || echo "SKIP $p"
done < <(git config -f .gitmodules --get-regexp '^submodule\..*\.path$' | awk '{print $2}')
```

A submodule with uncommitted edits or a detached HEAD fails the merge and is reported as `SKIP`; a skip is not a failure and must not stop the publish. Keep the list of skipped paths for the final report.

## 3. Stage and look at what changed

```bash
cd ~/Sites/huam.ing && git add -A && git diff --cached --stat && git diff --cached --name-status
```

Read the diff (not just the stat) before writing the subject. If nothing is staged, check `git status -sb` for `ahead`: if the branch is ahead, skip to step 5 (push only); if it is not ahead either, report `nothing to publish` and stop.

## 4. Write the subject line yourself

Derive it from the staged diff. Do not invent work that is not in the diff, do not ask the user for it, do not write a conventional-commit body.

- Shape: `<type>: <summary>` or `<type>(<scope>): <summary>`. Types: `feat`, `fix`, `docs`, `refactor`, `perf`, `style`, `chore`.
- Imperative mood, ≤ 72 chars, no trailing period, no quotes.
- A changed `src/content/<name>` whose diff is only `Subproject commit …` lines is a content bump — name the repos, e.g. `chore: bump blog, til`.
- Mixed content bumps plus real code changes: describe the code, then note the bumps, e.g. `feat(subscriptions): group by kind; bump blog, notes`.
- If the argument was supplied, honour it: a bare word like `components` becomes the scope; anything that already looks like a commit subject is used verbatim.

## 5. Commit, sync, push

```bash
cd ~/Sites/huam.ing && git commit -m "<subject>"
```

Then, because `build-check.yml` commits `chore(data): refresh caches` straight to `main`:

```bash
cd ~/Sites/huam.ing && git pull --rebase --autostash origin main
```

If the rebase conflicts: `git rebase --abort`, stop, report which files conflicted. Do not resolve it, do not pick a side, do not retry.

```bash
cd ~/Sites/huam.ing && git push origin main
```

If the push is rejected, do one more `git pull --rebase --autostash origin main` and retry the push once. Still rejected → stop and report.

## 6. Report

Three lines, no prose:

1. the commit subject you used, plus the short SHA;
2. how many files changed, and any submodules you had to skip in step 2;
3. `build-check.yml will build and deploy; watch it with \`gh run list --workflow build-check.yml --limit 1\``.

## Rules

- Never `--force`, never `--no-verify`, never `git commit --amend` an existing commit.
- Never run `npm run fetch`, `npm run build`, or `npm run deploy` — CI owns building and deploying from this push.
- Never touch the vault (`Second-Brain`) or a content repo's own history; this command publishes the site repo only.
- Never add `.env*`, `dist/`, `.astro/`, `.wrangler/`, or `node_modules/` to the index even if `.gitignore` were to lag behind.
