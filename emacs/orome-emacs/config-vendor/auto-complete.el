;; Add auto-complete mode.

(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(add-to-list 'load-path "~/.emacs.d/vendor/popup-el")

(require 'auto-complete-config)

;; Enable auto-complete mode.
(ac-config-default)
(global-auto-complete-mode t)

;; Set some defaults.
(setq ac-auto-start 0)         ;; 2
(setq ac-delay 0)              ;; 0.1
(setq ac-auto-show-menu 0)     ;; 0.8
(setq ac-quick-help-delay 0.1) ;; 1.5

;; bindings
(ac-set-trigger-key "TAB")

;; Now configure the sources for autocompletion...
(setq ac-modes
    '(
        lisp-interaction-mode
        emacs-lisp-mode
        clojure-mode
        scheme-mode
        lisp-mode
        redshank-mode
        c-mode
        cc-mode
        c++-mode
        java-mode
        jde-mode
        perl-mode
        cperl-mode
        python-mode
        ruby-mode
        scala-mode
        ecmascript-mode
        javascript-mode
        js-mode
        js2-mode
        php-mode
        emms-tag-editor-mode
        asm-mode
        makefile-mode
        sh-mode
        fortran-mode
        f90-mode
        ada-mode
        xml-mode
        sgml-mode
        css-mode
        less-css-mode
        ocaml-mode
        tuareg-mode
        haskell-mode
        org-mode
        latex-mode
        text-mode
        eshell-mode
        erlang-mode
        erlang-shell-mode
    )
)

(setq-default ac-sources
    '(
        ac-source-filename
        ac-source-words-in-buffer
        ;; ac-source-files-in-current-dir
        ;; ac-source-words-in-all-buffer
        ;; ac-source-words-in-same-mode-buffers
        ;; ac-source-yasnippet
        ;; ac-source-abbrev ac-source-dictionary
        ;; ac-source-gtags ac-source-imenu
        ;; ac-source-semantic ac-source-eclim
        ;; ac-source-features ac-source-functions
        ;; ac-source-symbols ac-source-variables
        ;; ac-source-rcodetools
        ;; ac-source-ispell
    )
)
