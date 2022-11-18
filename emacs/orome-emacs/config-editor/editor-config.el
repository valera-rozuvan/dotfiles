;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Configure the theme and the font size.
;;

(load-theme 'adwaita t)

(add-to-list 'default-frame-alist '(height . 26))
(add-to-list 'default-frame-alist '(width . 121))

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use the Inconsolata font. Make sure that you have the "Inconsolata" font
;; installed. On Debian-like distros you can do:
;;
;;     sudo apt-get install ttf-inconsolata
;;
;; On Windows, download the font, and install it.
;;

(set-default-font "Inconsolata-14")
(add-to-list
    'default-frame-alist
    '(font . "Inconsolata-14")
)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Make sure that the current position (line and column number) of the
;; cursor is shown.
;;

(setq line-number-mode t)
(setq column-number-mode t)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Disable the start-up splash screen.
;;

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Disabling the Menu Bar, and Toolbar
;;

(menu-bar-mode -1)
(tool-bar-mode -1)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Disable auto-save and auto-backup files.
;;

(setq auto-save-default nil)
(setq make-backup-files nil)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Store all backup and autosave files in the tmp dir.
;;

(setq backup-directory-alist
    `((".*" . ,temporary-file-directory))
)
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t))
)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Let's configure whitespace-mode to highlight several things:
;;
;;   - part of lines that go beyond the 120 characters mark
;;   - other things
;;

(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 120)
(global-whitespace-mode 1)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; We want line numbering in all buffers (everywhere).
;;

(global-linum-mode 1)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Let's make the actual textarea of any window (frame) centered.
;; Taken from:
;;     http://emacs-doctor.com/emacs-strip-tease.html
;;

;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
    "Minor mode to use big fringe in the current buffer."
    :init-value nil
    :global t
    :variable bzg-big-fringe-mode
    :group 'editing-basics
    (if (not bzg-big-fringe-mode)
        (set-fringe-style nil)
        (set-fringe-mode
            (/ (- (frame-pixel-width) (* 100 (frame-char-width))) 2)
        )
    )
)

;; By default, we do not want to activate this mode.
(bzg-big-fringe-mode 0)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; On save, remove trailing whitespace from all lines.
;;

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Always replace tabs with spaces.
;;

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable the display of date and time in mode line.
;;

(setq
    display-time-day-and-date t
    display-time-24hr-format t
)
(display-time-mode t)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; http://www.emacswiki.org/emacs/DiredFindFileOtherFrame
;; Here’s a small function to open files in new frame from dired. This was
;; requested on the EmacsChannel.
;;

(defun dired-find-file-other-frame ()
    "In Dired, visit this file or directory in another window."
    (interactive)
    (find-file-other-frame (dired-get-file-for-visit))
)

(eval-after-load "dired"
    '(define-key dired-mode-map "F" 'dired-find-file-other-frame)
)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; I want to be able to quickly view open buffers with ibuffer. I want to see
;; this information in a new frame.
;;

(defun ibuffer-in-new-frame ()
    "Open a new frame with ibuffer running"
    (interactive)
    (let (
            (frame (make-frame))
            (scratch-name "*temp*")
        )
        (select-frame-set-input-focus frame)
        (unless (get-buffer scratch-name)
            (with-current-buffer (get-buffer-create scratch-name)
                (text-mode)
            )
        )
        (switch-to-buffer scratch-name 'norecord)
        (call-interactively 'ibuffer)
    )
)

(global-set-key (kbd "C-x C-b") 'ibuffer-in-new-frame)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Open a new frame with a *scratch* buffer. To be used as a temporary scratch
;; pad.
;;

(defun new-frame-with-scratch ()
    "Open a new frame with scratch buffer selected"
    (interactive)
    (let (
            (frame (make-frame))
            (scratch-name "*temp*")
        )
        (select-frame-set-input-focus frame)
        (unless (get-buffer scratch-name)
            (with-current-buffer (get-buffer-create scratch-name)
                (text-mode)
            )
        )
        (switch-to-buffer scratch-name 'norecord)
    )
)

(global-set-key (kbd "C-9") 'new-frame-with-scratch)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; I want to disable electric indent mode for all major modes.
;;

(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; find-func.el --- find the definition of the Emacs Lisp function near point.
;;

(require 'find-func)

;; Define some shortcut key bindings. Specifically `Ctrl-x + F` (note the
;; capital "F").
(find-function-setup-keys)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; http://stackoverflow.com/questions/1836925/emacs-find-name-dired-how-to-change-default-directory
;; Regarding case insensitivity, you can customize the variable
;; find-name-arg to be the case insensitive version:
;;

(setq find-name-arg "-iname")

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Garbage collector configuration.
;;
;; By default Emacs will initiate GC every 0.76 MB allocated
;; (gc-cons-threshold == 800000). If we increase this to 20 MB
;; (gc-cons-threshold == 20000000) we get a better result.
;;

(setq gc-cons-threshold 20000000)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Modify the default grep command template.
;;

(setq grep-command "grep -i -r -nH -e ")

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Nice keybindings for grep and find commands.
;;

(defvar grep-and-find-map (make-sparse-keymap))
(define-key global-map "\C-xf" grep-and-find-map)
(define-key global-map "\C-xfg" 'find-grep-dired)
(define-key global-map "\C-xff" 'find-name-dired)
(define-key global-map "\C-xg" 'grep)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Replace all freakin' ^M chars in the current buffer. Map C-c m to replacing
;; all the ^M characters.
;;
;; Idea from: https://josephhall.org/nqb2/index.php/replace_ctrlms
;;

(fset 'replace-ctrlms
    [?\M-< ?\M-x ?r ?e ?p ?l ?a tab ?s ?t ?r tab return ?\C-q ?\C-m return ?\C-q ?\C-j return])
(define-key global-map "\C-cm" 'replace-ctrlms)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
