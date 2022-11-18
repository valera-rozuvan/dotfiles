;; Add js2 mode, and make it the default for JS files.

(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode")

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
