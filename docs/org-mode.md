# Org mode — the cheat sheet (and what it even is)

## What is Org mode?

Org is a **plain-text** format (`.org` files) that doubles as an outliner, a
to-do/agenda system, a notebook, and a lightweight document/spreadsheet tool —
all inside Emacs. One `.org` file can be:

- a **folding outline** of nested headings,
- a **task manager** (TODO states, deadlines, a calendar-style agenda),
- a **notebook** with tables, links, images, and runnable code blocks,
- a **document** you export to HTML / PDF / Markdown.

Why people rave about it: it's just text (git-friendly, never locked into an
app), yet you get folding, scheduling, and live code execution for free. Think
"Markdown + a planner + a spreadsheet + Jupyter", all keyboard-driven.

A tiny taste — this is what an `.org` file looks like:

```org
* Project: game        <- a heading (the * is the level)
** DONE Design         <- a completed task
** TODO Write renderer  :code:   <- a task with a :tag:
   DEADLINE: <2026-07-20>
   Some notes here. A [[https://example.com][link]] and a table:
   | Item  | Cost |
   |-------+------|
   | GPU   |  500 |
*** TODO Buffer resize
```

> In Doom, `.org` files open in Org mode automatically. Try `SPC .` and open a
> new `notes.org`.

---

## Headings & outline (folding)

| Key | Action |
|-----|--------|
| `TAB` | Fold/unfold the subtree under the cursor |
| `S-TAB` | Fold/unfold the WHOLE document |
| `M-RET` | New heading at the same level |
| `M-S-RET` | New **TODO** heading |
| `M-<left>` / `M-<right>` | Promote / demote heading (change its level) |
| `M-<up>` / `M-<down>` | Move heading (and its subtree) up / down |
| `SPC m r` | Refile (move a subtree elsewhere) |

Levels are just the number of leading `*`: `*` = H1, `**` = H2, etc.

## TODO tasks

| Key | Action |
|-----|--------|
| `SPC m t` (or `C-c C-t`) | Cycle TODO → DONE → (none) |
| `S-<right>` / `S-<left>` | Next / previous TODO keyword |
| `SPC m d s` (or `C-c C-s`) | **Schedule** (set a start date) |
| `SPC m d d` (or `C-c C-d`) | Set a **DEADLINE** |
| `SPC m p` (or `C-c ,`) | Set priority (`[#A]`/`[#B]`/`[#C]`) |
| `C-c C-c` | Toggle a checkbox / act on thing at point |

Checkboxes:
```org
- [ ] not done
- [X] done
```

## Agenda — your calendar/planner

The agenda gathers TODOs and scheduled items across your org files.

| Key | Action |
|-----|--------|
| `SPC n a` | Open the **agenda** menu |
| `SPC X` | **Capture** a quick note/task (see below) |

In the agenda view: `t` cycle TODO, `d` set deadline, `RET` jump to the entry,
`.` go to today, `q` quit.

## Capture — jot things down fast

`SPC X` (or `M-x org-capture`) pops a small buffer to record a task/note without
leaving what you're doing. Write it, then `C-c C-c` to file it, `C-c C-k` to
cancel. (Templates are configurable; the default drops into your notes file.)

## Tables (the magic part)

Just type `|` and text. Press `TAB` to move between cells — Org **auto-aligns**
the table for you.

| Key | Action |
|-----|--------|
| `TAB` | Next cell (creates rows as needed) |
| `C-c C-c` | Realign the table |
| `M-<left>`/`M-<right>` | Move a column |
| `M-<up>`/`M-<down>` | Move a row |
| `C-c -` | Insert a horizontal separator row |
| `C-c ^` | Sort rows |

Type `|-` then `TAB` to auto-draw a separator. You can even put formulas in
cells (a mini spreadsheet), but that's an advanced topic.

## Links

| Key | Action |
|-----|--------|
| `SPC m l l` (or `C-c C-l`) | Insert / edit a link |
| `RET` on a link | Follow it |

Link syntax: `[[https://url][description]]` or `[[file:notes.org][My notes]]`.

## Source code blocks (Babel — run code in your notes)

````org
#+begin_src python
print("hello from org")
#+end_src
````

| Key | Action |
|-----|--------|
| `C-c C-c` (inside the block) | **Run** the block, insert results below |
| `SPC m '` (or `C-c '`) | Edit the block in its language's mode |
| `TAB` (inside block) | Proper indentation for that language |

## Export

| Key | Action |
|-----|--------|
| `SPC m e` (or `C-c C-e`) | Open the **export** dispatcher |
| then `h h` | Export to HTML (and open) |
| then `m m` | Export to Markdown |
| then `l p` | Export to PDF (needs LaTeX installed) |

## Doom tips

- **`SPC m`** in any org buffer = the Org "local leader" — a which-key menu of
  every org command grouped by topic (`t`=todo, `d`=dates, `l`=links,
  `e`=export, `b`=tables, `s`=subtree…). When in doubt, press `SPC m` and browse.
- **`SPC n`** = Doom's notes menu (agenda, capture, org-roam if enabled).
- Folding, `M-RET`, and `S-<arrows>` are the daily drivers — learn those first.

---
**Start small:** make a `todo.org`, add a couple `* TODO` lines, schedule one
with `SPC m d s`, then open `SPC n a` to see your agenda. That's 80% of the
value on day one.
