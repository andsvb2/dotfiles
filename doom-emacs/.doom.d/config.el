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
(setq doom-theme 'doom-one)

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

;; :ui deft
(setq deft-recursive t
      deft-use-filter-string-for-filename t
      deft-default-extension "org"
      deft-directory (concat org-directory "roam/"))

;; :ui zen
(after! writeroom-mode
  (add-hook 'writeroom-global-effects 'writeroom-set-fullscreen))

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

;; bibtex.el: tentativa de configurar o gerador de chaves bibtex
(setq! ;; bibtex-autokey-expand-strings t
       bibtex-autokey-names-stretch 1
       bibtex-autokey-name-case-convert-function (quote capitalize)
       bibtex-autokey-additional-names "EtAl"
       bibtex-autokey-year-length 4
       bibtex-autokey-titleword-ignore (quote ("O" "Da" "Do" "Dos"))
       bibtex-autokey-titlewords 3
       bibtex-autokey-titleword-length (quote infty)
       bibtex-autokey-titleword-case-convert-function (quote capitalize)
       bibtex-autokey-titleword-separator ""
       bibtex-autokey-name-year-separator ":"
       ;; bibtex-autokey-year-title-separator ":"
       )
