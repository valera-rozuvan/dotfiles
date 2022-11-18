;; Add cmake-font-lock mode.

(add-to-list 'load-path "~/.emacs.d/vendor/k-cmake-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/cmake-font-lock")

(require 'cmake-mode)
(require 'cmake-font-lock)

;; Enable cmake-font-lock mode.

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
