;;;; LSP Configuration with Eglot

(with-eval-after-load 'eglot
  
  ;; LSP server configurations
  (add-to-list 'eglot-server-programs
               '(terraform-mode . ("terraform-ls" "serve")))
  (add-to-list 'eglot-server-programs
               '(rust-mode . ("rust-analyzer")))
                        
  (add-to-list 'eglot-server-programs
               '(wdl-mode . ("/opt/homebrew/bin/uv" "run" "wdl-lsp")))

  (setq eglot-autoshutdown t)
  (setq eglot-sync-connect nil)
  (setq eglot-events-buffer-size 0)
  (setq-default eglot-workspace-configuration
                '(:rust-analyzer
                  (:linkedProjects
                   []))))

;;;; Programming Languages

;; Terraform
(use-package terraform-mode
  :ensure t
;;   :mode "\\.tf\\'"
  :hook (terraform-mode . eglot-ensure))

;; Rust
(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :hook (rust-mode . eglot-ensure)
  :init
  (setq rust-mode-treesitter-derive t)
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

;; WDL
(use-package poly-wdl
  :ensure t
  ;; :mode "\\.wdl\\'"
  :hook (wdl-mode . eglot-ensure))

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

;; YAML
(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

;; JSON
(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package dockerfile-mode
  :ensure t
  :mode "\\Dockerfile\\'")

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")
