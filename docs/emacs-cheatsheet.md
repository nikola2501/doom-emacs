# Doom Emacs cheat sheet

Tailored to **this config**: Doom + `evil` (Vim keys), `SPC` as the leader key.
Notation: `SPC f f` = press Space, then f, then f. `C-x` = Ctrl+x, `M-x` = Alt+x.

> Lost? Press **`SPC`** and wait — Doom shows a live menu (which-key) of what each
> next key does. This is the fastest way to discover commands.

## The absolute essentials

| Key | Action |
|-----|--------|
| `SPC` | Leader — opens the command menu |
| `SPC :` | `M-x` — run any command by name |
| `SPC .` | Find file (from current dir) |
| `SPC f f` | Find file (browse) |
| `SPC f r` | Recent files |
| `SPC f s` | Save file |
| `SPC q q` | Quit Emacs |
| `SPC q r` | Restart Emacs (and restore) |
| `SPC h r r` | Reload Doom config (does NOT load newly-installed packages) |
| `ESC` / `C-g` | Cancel / quit the current prompt or command |

## Modes (evil / Vim)

| Key | Action |
|-----|--------|
| `i` / `a` | Insert before / after cursor |
| `ESC` | Back to Normal mode |
| `v` / `V` / `C-v` | Visual / visual-line / visual-block select |
| `:` | Ex command (`:w` save, `:q` close, `:wq`) |
| `u` / `C-r` | Undo / redo |

## Moving around

| Key | Action |
|-----|--------|
| `h j k l` | Left / down / up / right |
| `w` / `b` | Next / previous word |
| `0` / `$` | Start / end of line |
| `gg` / `G` | Top / bottom of file |
| `C-u` / `C-d` | Half page up / down |
| `%` | Jump to matching bracket |
| `SPC s s` | Search in buffer (jump to any occurrence) |
| `/` | Vim search; `n`/`N` next/prev |
| `g d` | Go to definition (LSP) |
| `g D` | Find references (LSP) |
| `C-o` / `C-i` | Jump back / forward in history |

## Files, buffers, windows

| Key | Action |
|-----|--------|
| `SPC b b` | Switch buffer |
| `SPC ,` | Switch buffer (workspace) |
| `SPC b k` | Kill (close) buffer |
| `SPC b d` | Kill buffer |
| `SPC TAB` | Workspaces (tabs) menu |
| `SPC w v` / `SPC w s` | Split window vertical / horizontal |
| `SPC w w` | Cycle windows |
| `SPC w h/j/k/l` | Move to window left/down/up/right |
| `SPC w d` | Close window |
| `SPC w m m` | Maximize current window |

## Projects & search

| Key | Action |
|-----|--------|
| `SPC p p` | Switch project |
| `SPC p f` | Find file in project |
| `SPC SPC` | Find file in project (quick) |
| `SPC p a` | Add project to known list |
| `SPC s p` | Search (grep) across project |
| `SPC s b` | Search current buffer |
| `SPC s i` | Jump to symbol/heading (imenu) |

## Editing

| Key | Action |
|-----|--------|
| `g c c` | Comment/uncomment line |
| `g c` (visual) | Comment/uncomment selection |
| `SPC i s` | Insert snippet |
| `S-<tab>` | Cycle folding |
| `z a` | Toggle fold |
| `>>` / `<<` | Indent / dedent line |
| `.` | Repeat last change |

## Code / LSP (Eglot) — Go, Rust, C/C++, Odin

| Key | Action |
|-----|--------|
| `g d` | Go to definition |
| `g D` | Find references |
| `K` | Hover docs for symbol under cursor |
| `SPC c a` | Code action (quick fixes, imports) |
| `SPC c r` | Rename symbol |
| `SPC c f` | Format buffer/region |
| `SPC c d` | Jump to definition |
| `SPC c D` | Jump to references |
| `SPC c x` | List errors/diagnostics |
| `] d` / `[ d` | Next / previous diagnostic |
| `M-x eglot` | Manually start the language server |
| `M-x eglot-reconnect` | Restart the server (e.g. after new deps) |

## Git (Magit)

| Key | Action |
|-----|--------|
| `SPC g g` | Magit status (see `docs/magit.md`) |
| `SPC g b` | Git blame |
| `SPC g L` | Git log |

## Help / discoverability

| Key | Action |
|-----|--------|
| `SPC h` | Help menu |
| `SPC h f` | Describe function |
| `SPC h v` | Describe variable |
| `SPC h k` | Describe key (press a keybinding to learn it) |
| `SPC h b b` | Search all keybindings |
| `SPC h d h` | Doom documentation / manuals |

## Handy odds & ends

| Key | Action |
|-----|--------|
| `SPC o p` | Toggle file tree (project sidebar) |
| `SPC o t` | Open terminal (vterm/eshell) |
| `SPC t` | Toggles menu (line numbers, wrap, etc.) |
| `SPC RET` | Bookmarks |
| `M-x doom/reload-font` | Reapply font after editing `config.el` |

---
**Rule of thumb:** you rarely need to memorize. Press `SPC` (or `SPC h`) and let
which-key show you the way.
