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
