;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arguably, all of the below settings are debatable, and very personal.
;; So, take with a grain of salt, and feel free to modify anything to your liking.
;; Tested on GNU Emacs version 30.1 (Debian Linux version 13.5).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some sane defaults for the editor (and editor UI). I like it minimal.

;; Turn off the bell noise completely (no sound, and no flash).
(setq ring-bell-function 'ignore)

;; Remove the top menu (File, Edit, etc.).
(menu-bar-mode -1)

;; Remove the icon toolbar.
(tool-bar-mode -1)

;; Remove the scroll bar.
(scroll-bar-mode -1)

;; Set the left fringe margin to 24 pixels, and the right fringe margin to 16 pixels.
(set-fringe-mode '(24 . 16))

;; Skip the startup splash screen.
(setq inhibit-startup-screen t)

;; Show the line number.
(line-number-mode 1)

;; Show the column number.
(column-number-mode 1)

;; Auto delete trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line numbering. I like it to be relative.

(setq display-line-numbers-type 'relative)
(setq display-line-numbers-current-absolute nil)
(global-display-line-numbers-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make it so that in occur and grep (rgrep) modes we have auto-follow ON.

(add-hook 'occur-mode-hook
	  (lambda () next-error-follow-minor-mode 1))
(add-hook 'grep-mode-hook
	  (lambda () next-error-follow-minor-mode 1))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The goal of this section is to prevent Emacs from writing backup/lock/meta files.

;; Tell Emacs to not create the foo~ files.
(setq make-backup-files nil)

;; Also skip the .#foo files.
(setq create-lockfiles nil)

;; Don't save command/minibuffer history.
(savehist-mode -1)

;; Don't use cursor-position memory.
(save-place-mode -1)

;; We do not want the recent-files list saved.
(recentf-mode -1)

;; No auto-save-list directory.
(setq auto-save-list-file-prefix nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some safety measures; in case autosaves/backups files ARE generated.
;;
;; What does this mean in reality? If you modify the above configs to
;; actually allow for autosaves and backups, then we explicitly tell
;; Emacs where to place those.
;;
;; Linux can (and does) clear the '/tmp' (temporary-file-directory) directory
;; on a reboot; so make sure we have the auto-save directory setup for Emacs to use
;;
;; NOTE: Backup files are created internally with a flag to create any
;; parent dirs if needed; so we don't need to create the base backup directory.

(make-directory (expand-file-name "emacs-autosaves/" temporary-file-directory) t)
(setq backup-directory-alist
      `((".*" . ,(expand-file-name "emacs-backups" temporary-file-directory))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "emacs-autosaves/" temporary-file-directory) t)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom color themes. Retrieved from:
;;   https://github.com/emacs-jp/replace-colorthemes

;; Tell Emacs where to look for custom theme files.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Load the theme. Several are available, uncomment the one you want to use.
(load-theme 'railscast t)
;; (load-theme 'calm-forest t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EOF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
