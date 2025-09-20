;;; Built-ins

;; Built-in: Which-key
(which-key-mode)
(setq which-key-idle-delay 0.3
      which-key-popup-type 'side-window
      which-key-side-window-location 'bottom
      which-key-side-window-max-height 0.25)

;; TODO: refactor this into use-package config
;; Built-in: Tree-sitter support (built-in since Emacs 29)
(when (and (fboundp 'treesit-available-p)
           (treesit-available-p))
  (setq treesit-language-source-alist
        '((python "https://github.com/tree-sitter/tree-sitter-python")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")
          (hcl "https://github.com/tree-sitter-grammars/tree-sitter-hcl")
          (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown")))
  (setq major-mode-remap-alist
        '((python-mode . python-ts-mode)
          (rust-mode . rust-ts-mode)
          (json-mode . json-ts-mode)
          (yaml-mode . yaml-ts-mode))))
