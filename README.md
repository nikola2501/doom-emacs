# Doom Emacs config (`~/.config/doom`)

Personal Doom Emacs configuration (`config.el`, `init.el`, `packages.el`).
This is **only the DOOMDIR** — Doom itself is installed separately (see below).

## What's set up

- **LSP via Eglot** with auto-start for: Go (`gopls`), Rust (`rust-analyzer`),
  C/C++ (`clangd`), Odin (`ols`).
- **Odin**: `odin-ts-mode` (tree-sitter) + `ols`. The tree-sitter grammar is
  compiled automatically on first launch (needs `git` + a C compiler).
- `exec-path-from-shell` so the **GUI** app inherits the shell `$PATH`
  (essential on macOS, where GUI apps don't get your shell env).
- **Multiple cursors** (`evil-mc`) under the `gz` prefix — e.g. `gzj` adds a
  cursor on the line below, `gzd` on the next match. See the cheatsheet.

## Fresh setup on a new machine

### 1. Install Emacs + Doom

**macOS:**
```bash
brew install emacs-plus            # or: brew install --cask emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```
Add `~/.config/emacs/bin` to your `PATH`.

> Note: on Linux this machine the active Doom install is `~/.emacs.d`. Emacs
> uses `~/.emacs.d` if it exists, otherwise `~/.config/emacs`. Pick ONE — having
> both causes `doom sync` to target the wrong install (packages won't load).

### 2. Get this config
```bash
git clone https://github.com/nikola2501/doom-emacs.git ~/.config/doom
```

### 3. Install external tools the config expects

**macOS (Homebrew):**
```bash
brew install gopls                 # Go LSP  (also: brew install go)
brew install llvm                  # provides clangd for C/C++
brew install odin ols              # Odin compiler + language server
rustup component add rust-analyzer # Rust LSP (needs rustup)
brew install --cask font-iosevka   # editor font (or any you like)
```

**Arch/CachyOS (pacman):**
```bash
sudo pacman -S gopls clang odin ttc-iosevka
rustup component add rust-analyzer
# ols (Odin language server): from AUR or build from source
```

### 4. Sync and launch
```bash
doom sync      # run the `doom` from whichever install you chose in step 1
```
Then start the GUI Emacs. First launch compiles the Odin tree-sitter grammar
(needs `git` + `cc`; on macOS run `xcode-select --install` if missing).

## Docs

- [`docs/emacs-cheatsheet.md`](docs/emacs-cheatsheet.md) — Doom + evil keybindings (leader `SPC`, LSP, windows, search).
- [`docs/magit.md`](docs/magit.md) — using Magit (Git inside Emacs).
- [`docs/org-mode.md`](docs/org-mode.md) — what Org mode is + a practical cheat sheet.
- [`docs/compile-mode.md`](docs/compile-mode.md) — running builds and jumping to errors.
- [`docs/file-management.md`](docs/file-management.md) — Dired & Treemacs (list/create/rename/delete).

## Notes

- After changing `packages.el`, run `doom sync` and **fully restart** Emacs
  (a `SPC h r r` reload does NOT load newly installed packages).
- **Modeline shows a box with a hex code (tofu) instead of a file-type icon?**
  The icon fonts aren't installed. `doom-modeline` uses `nerd-icons`, which
  wants **"Symbols Nerd Font Mono"** (v3) — note the `Mono` and `v3`: a plain
  "Symbols Nerd Font" or an older v2 lacks the Material-Design glyphs (e.g.
  `U+F0C13`). Fix from inside Emacs:
  ```
  M-x nerd-icons-install-fonts
  ```
  Then `fc-cache -f` runs automatically; **fully restart** Emacs.
