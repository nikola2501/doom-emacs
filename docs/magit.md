# Magit — Git inside Emacs

Magit is the Git porcelain bundled with Doom. You drive Git from a status buffer
with single-key commands and **transient menus** (press a key → a popup of
sub-options appears; pick flags, then the action).

> Keys below are inside Magit buffers unless prefixed with `SPC` (Doom leader,
> works from anywhere in normal state). Press **`?`** in any Magit buffer for a
> live cheat sheet.

## Open Magit

| Key | Action |
|-----|--------|
| `SPC g g` | **Magit status** (the main hub) |
| `SPC g b` | Blame current file (who changed each line) |
| `SPC g /` | Magit dispatch (all commands menu) |
| `SPC g L` | Git log |

## The status buffer

| Key | Action |
|-----|--------|
| `TAB` | Expand/collapse a section (see the diff for a file/hunk) |
| `RET` | Visit the file/hunk at point |
| `j` / `k` | Move down/up (evil) |
| `g r` | Refresh the status buffer |
| `q` | Quit / bury the buffer |

## Staging & committing

| Key | Action |
|-----|--------|
| `s` | **Stage** file/hunk at point |
| `u` | **Unstage** file/hunk at point |
| `S` | Stage ALL changes |
| `U` | Unstage everything |
| `x` | **Discard** changes at point (careful — destructive) |
| `c` | Commit menu → then `c` to write the message |
| `c c` | Start a commit (opens message buffer) |
| `C-c C-c` | Finish the commit (in the message buffer) |
| `C-c C-k` | Cancel the commit |
| `c a` | Amend the last commit |

**Typical flow:** `SPC g g` → move to a file → `s` to stage (or `S` for all) →
`c c` → type message → `C-c C-c` → `P u` to push.

## Pushing & pulling

| Key | Action |
|-----|--------|
| `P` | Push menu |
| `P u` | Push to upstream |
| `P p` | Push to `origin/<current-branch>` (pushremote) |
| `F` | Pull menu |
| `F u` | Pull from upstream |
| `f` | Fetch menu (`f a` = fetch all remotes) |

## Branches

| Key | Action |
|-----|--------|
| `b` | Branch menu |
| `b b` | Checkout an existing branch |
| `b c` | Create AND checkout a new branch |
| `b s` | Create a spinoff branch |

## History, diff, stash, rebase

| Key | Action |
|-----|--------|
| `l l` | Log of current branch |
| `l a` | Log of all branches |
| `d d` | Diff menu |
| `z` | Stash menu (`z z` = stash all, `z p` = pop) |
| `r` | Rebase menu (`r i` = interactive rebase) |
| `m` | Merge menu |
| `X` | Reset menu (`X h` = hard reset — destructive) |

## Comparing two branches (PR review)

Classic PR-review flow: fetch a branch, check it out, then compare it against
`main`.

```bash
git fetch origin
git switch the-pr-branch     # or: git checkout the-pr-branch
```

Then in Magit (`SPC g g`), press **`d`** (diff menu) → **`r`** (diff **range**)
and type a range:

| You type | What you see |
|----------|--------------|
| `main..the-pr-branch` | Every commit's changes that are on the branch but not on main |
| `main...the-pr-branch` | **Symmetric diff** — the net changes the branch *introduces* since it diverged from main (usually what a PR review wants) |
| `main..HEAD` | Same, when you've already checked out the branch |

> `..` vs `...`: for review you almost always want **`...`** — it ignores
> changes that landed on `main` in the meantime and shows only what the branch
> adds. If you just want a raw two-branch diff, `..` is fine.

### See the commit list of the branch

`l` (log menu) → `o` (log **other**/range) → type `main..the-pr-branch` to list
just the commits the PR adds. `RET` on any commit shows its diff.

### Side-by-side (Ediff)

For a visual, side-by-side comparison of a file across branches:

- `M-x magit-ediff-compare` → pick revA (`main`) and revB (`the-pr-branch`).
- Or press **`E`** in a Magit buffer for the Ediff menu, then `c` to compare.
- In Ediff: `n`/`p` next/previous difference, `a`/`b` copy A→B / B→A, `q` quit.

### Quick recap for a review

1. `git fetch origin && git switch the-pr-branch`
2. `SPC g g` → `d r` → `main...the-pr-branch` — read the aggregate diff.
3. `l o` → `main..the-pr-branch` — walk commit by commit if you prefer.
4. `E`/`magit-ediff-compare` — side-by-side on any file you want a closer look at.

## Forge — GitHub PRs & issues inside Emacs

Forge (enabled via `(magit +forge)`) syncs a repo's issues and pull requests into
Magit, so you can read, comment, create and review them without leaving Emacs.

### One-time setup: a GitHub token

Forge authenticates with a token stored in **auth-source** (`~/.authinfo.gpg` or
`~/.authinfo`). The `gh` CLI login is separate — Forge needs its own token.

1. Create a token: GitHub → Settings → Developer settings → Personal access
   tokens → **Tokens (classic)** → scope `repo` (plus `read:org` for org repos).
2. Add this line to `~/.authinfo.gpg` (encrypted, preferred) or `~/.authinfo`:
   ```
   machine api.github.com login <your-username>^forge password <TOKEN>
   ```
   The `^forge` suffix on the login is required.
3. Restart Emacs (or `M-x auth-source-forget-all-cached`).

### Add a repo & pull its topics

- In the repo's Magit status (`SPC g g`), run **`M-x forge-add-repository`** once.
- **`M-x forge-pull`** — fetch issues + PRs into the local db. Magit status then
  shows **Pull Requests** and **Issues** sections; `RET` visits one.

### Everyday commands

| Command | Action |
|---------|--------|
| `M-x forge-dispatch` | The Forge menu (everything) |
| `M-x forge-pull` | Sync issues / PRs |
| `M-x forge-list-pullreqs` | List open PRs |
| `M-x forge-checkout-pullreq` | **Check out a PR's branch locally** (for review) |
| `M-x forge-create-pullreq` | Open a PR from the current branch |
| `M-x forge-create-issue` | File an issue |
| `RET` on a PR/issue | Visit it (description, comments) |
| `M-x forge-create-post` | Comment / reply on the visited topic |

> This config uses `(evil +everywhere)`, so Forge's default `@` keybindings are
> off — use the `M-x forge-…` commands (or `M-x forge-dispatch`).

### PR-review combo

1. `M-x forge-pull` → find the PR in Magit status.
2. `M-x forge-checkout-pullreq` → its branch is now local.
3. `SPC g g` → `d r` → `main...HEAD` (see **Comparing two branches** above).
4. Comment / approve / merge from the topic buffer or `M-x forge-dispatch`.

## Interactive rebase (`r i`)

In the rebase todo buffer:

| Key | Action |
|-----|--------|
| `p` | pick | keep the commit |
| `s` | squash into previous |
| `f` | fixup (squash, drop message) |
| `e` | edit (stop to amend) |
| `d` | drop the commit |
| `k` / `j` | move commit up/down |
| `C-c C-c` | start the rebase |

## Resolving merge conflicts

1. `SPC g g` shows "Unmerged" files.
2. `RET` on a conflicted file, or use **Smerge**: `SPC c` menu / `M-x smerge-...`.
3. Common smerge keys: `C-c ^ n/p` next/prev conflict, `C-c ^ u` keep upper,
   `C-c ^ l` keep lower, `C-c ^ a` keep all.
4. Stage resolved files with `s`, then `c c` to commit the merge.

## Tips

- **`$`** opens the Git process log — see the exact commands Magit ran.
- **`.`** on a commit marks it; `x` (in log) can reset to it.
- Everything is discoverable: hit **`?`** and read the menu.
