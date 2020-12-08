;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Anderson S. Vieira"
      user-mail-address "svieira.anderson@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Documentos/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; :completion company
(setq company-idle-delay nil)

;; :ui deft
(setq deft-recursive t
      deft-use-filter-string-for-filename t
      deft-default-extension "org"
      deft-directory (concat org-directory "roam/"))

;; :ui zen
(after! writeroom-mode
  (add-hook 'writeroom-global-effects 'writeroom-set-fullscreen))
(setq +zen-text-scale 1) ;; correctly sets the text scale in zen mode.

;; :checkers spell
(setq ispell-dictionary "pt_BR")

;; :checkers grammmar
(setq langtool-default-language "pt-BR")

;; :lang latex
(setq-hook! 'TeX-mode-hook +spellcheck-immediately nil) ;; stop doom from immediately running a spell check on every tex mode file
(add-hook! 'TeX-mode-hook #'(writeroom-mode abbrev-mode hl-todo-mode))
(setq +latex-viewers '(evince))

;;; :lang org
(remove-hook 'org-mode-hook #'org-superstar-mode)
(setq org-roam-directory (concat org-directory "roam/")
      org-roam-index-file "index.org"
      ;; org-journal-encrypt-journal t
      org-journal-date-prefix "#+TITLE: "
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-dir (concat org-directory "roam/")
      org-journal-date-format "%A, %d %B %Y"
      org-journal-enable-agenda-integration t
      org-noter-notes-search-path '("~/Dropbox/Documentos/org/roam/")
      ;; org-ellipsis " ▼ "
      org-superstar-headline-bullets-list '("#"))

;; :$DOOMDIR/packages.el pkgbuild-mode
 (autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
 (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
                               auto-mode-alist))

(require 'iso-transl)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
