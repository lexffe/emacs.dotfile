;;;; UI Enhancements

;; Theme
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  ; (doom-themes-treemacs-theme "doom-atom")
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)

  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 3)
  (doom-modeline-lsp t)
  (doom-modeline-github nil)
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project))

;; Icons
(use-package nerd-icons
  :ensure t)

;; Better scrollbar
(use-package mlscroll
  :ensure t
  :config
  ; (setq mlscroll-shortfun-min-width 11)
  (mlscroll-mode 1))

;; Expand region
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; Move text
(use-package move-text
  :ensure t
  :bind (("M-<up>" . move-text-up)
         ("M-<down>" . move-text-down)))