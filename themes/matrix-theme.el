;;; matrix-theme.el --- green-on-black Matrix theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; A simple, punchy theme in the spirit of gruber-darker: pure black background,
;; white text, neon-green keywords, bright-blue comments, and the green family
;; (instead of gruber's yellow) for functions, strings, constants and numbers.
;;
;; Plain `deftheme' (like gruber-darker), so it just loads — no doom-themes deps.

(deftheme matrix "Green-on-black Matrix theme.")

(let ((bg        "#000000")   ; pure black
      (bg-alt    "#0a0a0a")
      (fg        "#f0f0f0")   ; white text / variables
      (fg-dim    "#c8c8c8")
      (neon      "#00ff41")   ; drecavo zelena — keywords, cursor
      (green     "#4cff67")   ; functions
      (green-lo  "#9eff5e")   ; strings (was yellow in gruber)
      (green-c   "#38ff9b")   ; builtins / teal-green
      (green-pl  "#b8ffb8")   ; types (pale green)
      (blue      "#2ea6ff")   ; drecavo plavi — comments
      (blue-dim  "#1f6fb2")   ; comment delimiters / docs
      (red       "#ff4444")   ; errors / warnings
      (region    "#0f3d17")   ; dark green selection
      (hl        "#0b160b")   ; current-line highlight
      (ml-bg     "#0f2a12")   ; mode-line background
      (ln        "#1f5f2a")   ; line numbers (dim green)
      (grey      "#3a3a3a"))

  (custom-theme-set-faces
   'matrix

   ;; --- base UI ---
   `(default                       ((t (:background ,bg :foreground ,fg))))
   `(cursor                        ((t (:background ,neon))))
   `(region                        ((t (:background ,region :extend t))))
   `(highlight                     ((t (:background ,region))))
   `(hl-line                       ((t (:background ,hl :extend t))))
   `(fringe                        ((t (:background ,bg :foreground ,grey))))
   `(vertical-border               ((t (:foreground ,grey))))
   `(minibuffer-prompt             ((t (:foreground ,neon :weight bold))))
   `(link                          ((t (:foreground ,blue :underline t))))
   `(show-paren-match              ((t (:background ,neon :foreground ,bg :weight bold))))
   `(show-paren-mismatch           ((t (:background ,red :foreground ,bg))))
   `(trailing-whitespace           ((t (:background ,red))))
   `(shadow                        ((t (:foreground ,grey))))

   ;; --- line numbers ---
   `(line-number                   ((t (:background ,bg :foreground ,ln))))
   `(line-number-current-line      ((t (:background ,hl :foreground ,neon :weight bold))))

   ;; --- mode line ---
   `(mode-line                     ((t (:background ,ml-bg :foreground ,neon))))
   `(mode-line-inactive            ((t (:background ,bg-alt :foreground ,grey))))
   `(mode-line-emphasis            ((t (:foreground ,green :weight bold))))

   ;; --- syntax (font-lock; also used by tree-sitter modes) ---
   `(font-lock-keyword-face            ((t (:foreground ,neon :weight bold))))
   `(font-lock-builtin-face            ((t (:foreground ,green-c))))
   `(font-lock-function-name-face      ((t (:foreground ,green :weight bold))))
   `(font-lock-function-call-face      ((t (:foreground ,green))))
   `(font-lock-variable-name-face      ((t (:foreground ,fg))))
   `(font-lock-variable-use-face       ((t (:foreground ,fg))))
   `(font-lock-string-face             ((t (:foreground ,green-lo))))
   `(font-lock-doc-face                ((t (:foreground ,blue-dim :slant italic))))
   `(font-lock-comment-face            ((t (:foreground ,blue :slant italic))))
   `(font-lock-comment-delimiter-face  ((t (:foreground ,blue-dim))))
   `(font-lock-constant-face           ((t (:foreground ,green))))
   `(font-lock-number-face             ((t (:foreground ,green))))
   `(font-lock-type-face               ((t (:foreground ,green-pl))))
   `(font-lock-preprocessor-face       ((t (:foreground ,green-c))))
   `(font-lock-operator-face           ((t (:foreground ,fg-dim))))
   `(font-lock-punctuation-face        ((t (:foreground ,fg-dim))))
   `(font-lock-property-name-face      ((t (:foreground ,fg))))
   `(font-lock-property-use-face       ((t (:foreground ,fg))))
   `(font-lock-negation-char-face      ((t (:foreground ,red))))
   `(font-lock-warning-face            ((t (:foreground ,red :weight bold))))

   ;; --- search ---
   `(isearch                       ((t (:background ,neon :foreground ,bg :weight bold))))
   `(lazy-highlight                ((t (:background ,region :foreground ,fg))))
   `(isearch-fail                  ((t (:background ,red :foreground ,bg))))

   ;; --- diagnostics / errors ---
   `(error                         ((t (:foreground ,red :weight bold))))
   `(warning                       ((t (:foreground ,green-lo :weight bold))))
   `(success                       ((t (:foreground ,neon :weight bold))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'matrix)
;;; matrix-theme.el ends here
