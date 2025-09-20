;;; Emacs internals

;; Up the GC
(setq gc-cons-threshold (* 128 1024 1024))

;; Silence native comp
(setq native-comp-async-report-warnings-errors nil
      native-comp-deferred-compilation t)

; macOS specific
; (when (eq system-type 'darwin)
;  (add-to-list 'exec-path "/opt/homebrew/bin/")
;  (setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH"))))

;;; Personalisation

(set-frame-font "IBM Plex Mono 14" nil t)
(setq-default line-spacing 0.1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(column-number-mode 1)
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq require-final-newline t
      load-prefer-newer t
      ring-bell-function 'ignore
      kill-buffer-delete-auto-save-files t)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

;; File handling
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
      auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      create-lockfiles nil)

;; Create directories if they don't exist
(dolist (dir '("backups" "auto-saves"))
  (let ((path (expand-file-name dir user-emacs-directory)))
    (unless (file-exists-p path)
      (make-directory path t))))

;;; Built-ins
(load "~/.config/emacs/built-in.el")

;;; Package Manager
(load "~/.config/emacs/elpaca-init.el")

;;; Packages

(load "~/.config/emacs/ide.el")
(load "~/.config/emacs/language.el")

;;; UI
(load "~/.config/emacs/ui.el")

(provide 'init)