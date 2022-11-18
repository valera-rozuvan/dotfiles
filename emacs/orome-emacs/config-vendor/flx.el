;; Fuzzy matching for Emacs ... a la Sublime Text.

(add-to-list 'load-path "~/.emacs.d/vendor/flx")
(add-to-list 'load-path "~/.emacs.d/vendor/ido-vertical-mode")

(require 'ido)
(require 'ido-vertical-mode)
(require 'flx-ido)

(ido-mode t)
(ido-everywhere t)
(ido-vertical-mode t)
(flx-ido-mode t)

;; Disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
