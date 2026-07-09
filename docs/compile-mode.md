# Compilation mode — build & jump to errors

`compile` runs **any shell command** (make, cargo, go build, a test script…) and
captures its output in a `*compilation*` buffer where every error becomes a
clickable link you can jump to in the source.

## Start a compile

| Key | Action |
|-----|--------|
| `SPC c c` | **Compile** — prompts for a command (e.g. `make`, `cargo build`, `go test ./...`) |
| `SPC p c` | **Compile in project** — runs from the project root, remembers the command per project |
| `SPC c C` | **Recompile** — re-run the last command (also `M-x recompile`) |
| `M-x kill-compilation` | Stop a running compile |

The command is remembered, so the usual loop is: `SPC p c` once → then hammer
`SPC c C` (recompile) after every edit.

## Jump to errors

The magic: `next-error` navigation jumps straight to `file:line` of each error
and highlights it — **from any buffer**, you don't have to be in the output.

| Key | Action |
|-----|--------|
| `M-g n` (or `M-g M-n`) | Jump to **next** error (opens the file at that line) |
| `M-g p` (or `M-g M-p`) | Jump to **previous** error |
| `C-x \`` | Next error (classic binding) |

Inside the `*compilation*` buffer itself:

| Key | Action |
|-----|--------|
| `RET` | Visit the error/file under the cursor |
| `j` / `k` | Move down/up (then `RET` to visit) |
| `g r` | Recompile (re-run) |
| `q` | Bury the compilation buffer |

> Tip: `M-x next-error-follow-minor-mode` inside the buffer makes it auto-jump to
> the source as you move the cursor over each error line.

## Good to know

- **Error formats are auto-detected** for common toolchains: gcc/clang, rustc/
  cargo, go, python tracebacks, grep, etc. Your C (`clangd`/gcc) and Odin/Go/Rust
  builds "just work" — filenames and line numbers become jump targets.
- Output is **ANSI-colored** and scrolls as it runs.
- The first error is often jumped to automatically; if not, `M-g n` gets you there.
- **Project search reuses this**: `SPC s p` (grep across project) opens a results
  buffer where the same `M-g n` / `RET` navigation works.
- A compile that exits non-zero shows the count and the buffer stays red; success
  turns it green.

## Typical workflows

**This repo's game (Makefile):**
```
SPC p c   ->  make            # first time, type the command
SPC c C   ->  recompile       # after each edit
M-g n / M-g p                 # walk the errors, land on each in the source
```

**Rust / Go / Odin:** `SPC c c` → `cargo build` / `go build ./...` /
`odin build .` — then `M-g n` through any errors.
