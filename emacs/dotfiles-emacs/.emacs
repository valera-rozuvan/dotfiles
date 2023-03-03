(custom-set-variables
  '(desktop-save-mode t)
  '(tab-stop-list (number-sequence 2 120 2))
  '(scroll-bar-mode nil)
)

(custom-set-faces

)

(set-frame-font "IBM Plex Mono 13")
(add-to-list
  'default-frame-alist
  '(font . "IBM Plex Mono 13")
)

(setq initial-scratch-message "")

(add-to-list 'default-frame-alist '(height . 26))
(add-to-list 'default-frame-alist '(width . 121))

(setq line-number-mode t)
(setq column-number-mode t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq backup-directory-alist
  `((".*" . ,temporary-file-directory))
)
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t))
)

(global-linum-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

(setq
  display-time-interval 1
  display-time-format "[%d %b %Y, %H:%M:%S]"
)
(display-time-mode t)

(set-face-attribute 'region nil :background "#d3d8e0")

(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

(setq gc-cons-threshold 20000000)

(global-visual-line-mode t)

(setq Buffer-menu-sort-column 5)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun open-bookmarks-now nil
  "open bookmarks"
  (interactive)
  (find-file-existing "~/org-m/bookmarks/daily-bookmarks.org"))

(global-set-key '[(f1)] 'dired)
(global-set-key '[(f2)] 'eshell)
(global-set-key '[(f3)] 'buffer-menu)
(global-set-key '[(f4)] 'recentf-open-files)

(global-set-key '[(f5)] 'revert-buffer-no-confirm)
(global-set-key '[(f6)] 'create-scratch-buffer)

(global-set-key '[(f7)] 'open-bookmarks-now)

(global-set-key '[(f10)] 'delete-frame)
(global-set-key '[(f11)] 'delete-other-windows)
(global-set-key (kbd "<C-f11>") 'toggle-frame-fullscreen)
(global-set-key '[(f12)] 'visual-line-mode)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; the end .
