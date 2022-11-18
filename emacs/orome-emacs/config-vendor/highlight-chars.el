;; Enable highlight-chars mode.

(add-to-list 'load-path "~/.emacs.d/vendor/highlight-chars")

(require 'highlight-chars)

(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
