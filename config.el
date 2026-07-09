;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Extended" :size 22))
;; Breathing room between lines (fraction of line height). Bump if still cramped.
(setq-default line-spacing 0.25)
;; Zen mode centered on wide monitors (60-col column).
;; Auto-enable everywhere: every code/text buffer (and new ones) starts centered.
;;   - writeroom-maximize-window nil  -> keep window splits (don't delete others)
;;   - writeroom-global-effects nil   -> don't toggle fullscreen/menubar globally
;;   - writeroom-major-modes          -> which buffers get it automatically
(setq writeroom-width 60
      writeroom-maximize-window nil
      writeroom-global-effects nil
      writeroom-major-modes '(prog-mode text-mode conf-mode))
(global-writeroom-mode 1)
;; Don't ask "Really quit Emacs?" on exit
(setq confirm-kill-emacs nil)
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; postavi default Doom temu
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-gruvbox)
;; gruber-darker isn't a built-in Doom theme; make sure its package build dir is
;; on custom-theme-load-path before applying it, otherwise Doom errors with
;; "Unable to find theme file for 'gruber-darker'".
;; Resolve the package build dir relative to the ACTIVE install (portable across
;; machines/OSes and both local Doom dirs) instead of a hardcoded ~/.config/emacs.
(let ((dir (car (file-expand-wildcards
                 (expand-file-name "straight/build-*/gruber-darker-theme"
                                   doom-local-dir)))))
  (when dir (add-to-list 'custom-theme-load-path dir)))

;; Our own themes live in ~/.config/doom/themes/ (e.g. matrix-theme.el).
(add-to-list 'custom-theme-load-path (expand-file-name "themes/" doom-user-dir))

;; (setq doom-theme 'matrix)          ; our green-on-black Matrix theme (themes/matrix-theme.el)
(setq doom-theme 'gruber-darker)   ; Tsoding's theme (gruber-darker-theme pkg)
;; (setq doom-theme 'plain-dark)


;; 1. Initialize environment variables (important for finding gopls/go/rust-analyzer)
;; NOTE: must run eagerly (not via `after!'), because nothing else loads this
;; package. GUI Emacs doesn't inherit the shell PATH, so without this Eglot
;; can't find the language servers (works in the terminal only by accident).
(when (or (display-graphic-p) (daemonp))
  (require 'exec-path-from-shell)
  (setq exec-path-from-shell-check-startup-files nil) ; speed up startup
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs '("PATH" "GOPATH" "GOROOT")))
;; 2. The (go +lsp) module in init.el handles hooks automatically.
;; You can remove the manual go-mode-hook!

;; 3. Auto-start Eglot (clangd) for C/C++ just like Go/Rust do out of the box.
;;    The (cc +lsp) module should do this, but be explicit so it always fires.
(add-hook! '(c-mode-hook c++-mode-hook c-ts-mode-hook c++-ts-mode-hook objc-mode-hook)
           #'eglot-ensure)

;; 4. Kill the grey inlay parameter hints (e.g. `dest:`/`src:`/`n:` before args).
;;    They clutter the buffer and make code feel cramped/noisy.
(after! eglot
  (add-to-list 'eglot-ignored-server-capabilities :inlayHintProvider))

;; --- Odin language support (tree-sitter + ols via Eglot) ------------------
;; odin-ts-mode doesn't register the grammar source or the file extension, so
;; do both here. Grammar is compiled once on first launch (needs git + cc).
(after! treesit
  (add-to-list 'treesit-language-source-alist
               '(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin"))
  (unless (treesit-language-available-p 'odin)
    (ignore-errors (treesit-install-language-grammar 'odin))))

(use-package! odin-ts-mode
  :mode "\\.odin\\'"
  :hook (odin-ts-mode . eglot-ensure)
  :config
  (after! eglot
    ;; ols = Odin Language Server (already installed at /usr/bin/ols)
    (add-to-list 'eglot-server-programs '(odin-ts-mode . ("ols")))))
;; Belt-and-suspenders: register the extension eagerly too, so .odin always
;; opens in odin-ts-mode even if use-package's :mode is deferred.
(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))

;; Auto-compile a missing tree-sitter grammar (C / Rust / Go …) the first time a
;; file opens, without prompting. Needs git + a C compiler (xcode CLI on macOS).
(setq treesit-auto-install-grammar 'always)

;; Format-on-save (apheleia, via `(format +onsave)') also covers Odin: pipe the
;; buffer through `odinfmt -stdin'. Go/Rust/C already work (gofmt/rustfmt/clang-format).
(after! apheleia
  (setf (alist-get 'odinfmt apheleia-formatters) '("odinfmt" "-stdin"))
  (setf (alist-get 'odin-ts-mode apheleia-mode-alist) 'odinfmt))

;; Plain dired like Tsoding's: turn off diredfl's rainbow permission-bit coloring
;; (the garish red/green/brown stripes on the drwxr-xr-x column).
(remove-hook 'dired-mode-hook #'diredfl-mode)

;; --- Harpoon: neovim-style deterministic jump to pinned files (per project) --
;; SPC 1..9 jump to slots (overrides Doom's workspace-switch on those keys).
;; SPC j a add current file, SPC j j open the editable quick menu.
;; NOTE: bind at top level (NOT inside `after! harpoon'), because nothing loads
;; harpoon until a binding is pressed. The commands are autoloaded, so binding
;; them directly is enough — the first press pulls in the package.
(map! :leader
      (:prefix ("j" . "harpoon")
       :desc "Add file"    "a" #'harpoon-add-file
       :desc "Quick menu"  "j" #'harpoon-toggle-quick-menu
       :desc "Toggle file" "f" #'harpoon-toggle-file
       :desc "Clear"       "c" #'harpoon-clear)
      :desc "Harpoon 1" "1" #'harpoon-go-to-1
      :desc "Harpoon 2" "2" #'harpoon-go-to-2
      :desc "Harpoon 3" "3" #'harpoon-go-to-3
      :desc "Harpoon 4" "4" #'harpoon-go-to-4
      :desc "Harpoon 5" "5" #'harpoon-go-to-5
      :desc "Harpoon 6" "6" #'harpoon-go-to-6
      :desc "Harpoon 7" "7" #'harpoon-go-to-7
      :desc "Harpoon 8" "8" #'harpoon-go-to-8
      :desc "Harpoon 9" "9" #'harpoon-go-to-9)
