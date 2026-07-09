# File management — Dired & Treemacs

Two tools:

- **Dired** — a full file-manager *buffer* (list, mark, rename, copy, delete,
  bulk-edit). The powerful one.
- **Treemacs** — a *sidebar* project tree (like NERDTree/VS Code explorer).

---

## Dired

### Open it

| Key | Action |
|-----|--------|
| `SPC o -` | Open Dired in the **current file's directory** (`dired-jump`) |
| `SPC f d` | Pick a directory and open it in Dired |
| `M-x dired` / `C-x d` | Open Dired for any path |

### Move around

| Key | Action |
|-----|--------|
| `j` / `k` | Down / up |
| `RET` | Open file or enter directory |
| `^` | Go **up** one directory |
| `q` | Quit the Dired buffer |
| `g r` | Refresh the listing |
| `(` | Toggle details (hide/show permissions, size, date) |

### Create

| Key | Action |
|-----|--------|
| `+` | **Create a directory** |
| `M-x dired-create-empty-file` | Create a new empty **file** |
| `SPC .` | (Anywhere) find/create a file by typing a new name, then save |

### Rename, copy, delete

| Key | Action |
|-----|--------|
| `R` | **Rename / move** the file (give a new name, or a path to move it) |
| `C` | **Copy** the file |
| `D` | **Delete** immediately (file at point, or all marked) |
| `d` | *Flag* for deletion (just marks it with `D`) |
| `x` | Execute the flagged deletions |

### Marking — for bulk operations

Mark several files, then `R` / `C` / `D` act on **all** of them.

| Key | Action |
|-----|--------|
| `m` | Mark file at point |
| `u` | Unmark |
| `U` | Unmark everything |
| `t` | Toggle all marks |
| `% m` | Mark by regexp |
| `* .` | Mark all files with a given extension |

### Bulk rename like a text editor (wdired) — the killer feature

| Key | Action |
|-----|--------|
| `C-c C-e` | Turn the Dired buffer **editable** (wdired) — edit filenames inline |
| `C-c C-c` | Apply your edits (perform the renames) |
| `C-c C-k` | Cancel |

In wdired you edit names like normal text: search & replace, multiple cursors,
evil motions — then commit. Perfect for renaming many files at once.

### Other handy keys

| Key | Action |
|-----|--------|
| `!` | Run a shell command on the file(s) |
| `&` | Run an **async** shell command |
| `S` | Make a symlink |
| `Z` | Compress / uncompress |
| `w` | Copy the filename(s) to the kill-ring |

---

## Treemacs (sidebar tree)

| Key | Action |
|-----|--------|
| `SPC o p` | Toggle the project sidebar |

Inside the Treemacs window:

| Key | Action |
|-----|--------|
| `j` / `k` | Move down / up |
| `RET` / `TAB` | Open file / expand-collapse folder |
| `c f` | **Create file** |
| `c d` | **Create directory** |
| `R` | **Rename** node |
| `d` | **Delete** node |
| `m` | Move node |
| `y` | Copy node |
| `?` | Help (all Treemacs keys) |
| `q` | Close the sidebar |

---

## Which to use?

- Quick browse / project overview → **Treemacs** (`SPC o p`).
- Real file operations, especially bulk rename/delete → **Dired** (`SPC o -`),
  and `C-c C-e` (wdired) when renaming many files.
