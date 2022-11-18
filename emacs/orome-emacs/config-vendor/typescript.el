(add-to-list 'load-path "~/.emacs.d/vendor/typescript.el")

(require 'typescript-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
