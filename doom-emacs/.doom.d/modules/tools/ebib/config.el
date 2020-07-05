;;; tools/ebib/config.el -*- lexical-binding: t; -*-

;; Adaptado do .spacemacs

(after! ebib
  (setq ebib-bibtex-dialect 'biblatex
        ebib-bib-search-dirs '("~/LaTeX/and-tese/bib/"
                               "~/LaTeX/biblatex")
        ebib-preload-bib-files '("~/LaTeX/and-tese/bib/bibliografia-tese.bib"
                                 "~/LaTeX/and-tese/bib/zotero-sempre-atualizado.bib")
        ))

(map! ("C-c b" #'ebib)                   ; Abre ebib do menu global
      (:map TeX-mode-map
            ;; :localleader
            :desc "Cita usando Ebib" "C-c l b" #'ebib-insert-citation))

(setq ebib-extra-fields '((BibTeX "crossref" "annote" "abstract" "keywords" "file" "timestamp" "url" "doi")
                            (biblatex "crossref" "annotation" "abstract" "keywords" "file" "timestamp" "url" "doi"))
        ebib-use-timestamp 't
        ebib-timestamp-format (format-time-string "%Y-%m-%d %H:%M:%S %z")
        ebib-file-associations '(("pdf" . "evince") ("ps" . "gv"))
        ebib-citation-commands '((any
                                   (("cite"        "\\cite%<[%A]%>%<[%A]%>{%(%K%,)}")
                                    ("text"        "\\textcite%<[%A]%>%<[%A]%>{%(%K%,)}")
                                    ("cites"       "\\cites%(%<[%A]%>[%A]{%K}%)")
                                    ("textcites"   "\\textcites%(%<[%A]%>[%A]{%K}%)")
                                    ("author"      "\\citeauthor%<[%A]%>{%(%K%,)}")
                                    ("year"        "\\citeyear%<[%A]%>[%A]{%K}")
                                    ("footcite"    "\\footcite%<[%A]%>[%A]{%K}")
                                    ("title"       "\\citetitle%<[%A]%>[%A]{%K}")
                                    ("apud"        "\\apud%(%<[%A]%>[%A]{%K}%)")
                                    ("textapud"    "\\textapud%(%<[%A]%>[%A]{%K}%)")
                                    ;; ("paren"       "\\parencite%<[%A]%>[%A]{%(%K%,)}")
                                    ;; ("possauthor"  "\\possciteauthor%<[%A]%>{%K}")
                                    ;; ("posstext"    "\\posstextcite%<[%A]%>{%K}")
                                    ;; ("posscite"    "\\posscite%<[%A]%>{%K}")
                                    ))
                                  ;; (org-mode
                                   ;; (("ebib"        "[[ebib:%K][%D]]")))
                                  ;; (markdown-mode
                                   ;; (("text"        "@%K%< [%A]%>")
                                    ;; ("paren"       "[%(%<%A %>@%K%<, %A%>%; )]")
                                    ;; ("year"        "[-@%K%< %A%>]")))
                                  ))

;; bibtex.el: tentativa de configurar o gerador de chaves bibtex
(setq  ;; bibtex-autokey-expand-strings t
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


;; Cópia do arquivo original em <https://github.com/patrl/.doom.d/blob/master/modules/tools/ebib/config.el>
;;
;;;;; tools/ebib/config.el -*- lexical-binding: t; -*-

;; (after! ebib
;;   (setq ebib-bibtex-dialect 'biblatex
;;         ebib-preload-bib-files '("/home/patrl/repos/bibliography/elliott_mybib.bib")
;;         ebib-index-mode-map (make-sparse-keymap)
;;         ebib-entry-mode-map (make-sparse-keymap))
;; (map! (:map (ebib-index-mode-map)
;;           :n "k" #'ebib-prev-entry
;;           :n "j" #'ebib-next-entry
;;           :n "l" #'ebib-next-database
;;           :n "h" #'ebib-prev-database
;;           :n "gg" #'ebib-goto-first-entry
;;           :n "G" #'ebib-goto-last-entry
;;           :n "q" #'ebib-quit
;;           :n "/" #'ebib-search
;;           :n "n" #'ebib-search-next
;;           :n "x" #'ebib-delete-entry

;;           :localleader
;;           :n "l" #'ebib-show-log
;;           :n "a" #'ebib-show-annotation
;;           :n "n" #'ebib-open-note
;;           )

;;         (:map (ebib-entry-mode-map)
;;           :n "k" #'ebib-prev-field
;;           :n "j" #'ebib-next-field
;;           :n "RET" #'ebib-edit-field
;;           :n "gg" #'ebib-goto-first-field
;;           :n "G" #'ebib-goto-last-field
;;           :n "q" #'ebib-quit-entry-buffer
;;           :n "y" #'ebib-yank-field-contents)))
