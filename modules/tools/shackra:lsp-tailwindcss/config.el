;;; tools/lsp-tailwindcss/config.el -*- lexical-binding: t; -*-

(use-package! lsp-tailwindcss
  :init (setq lsp-tailwindcss-add-on-mode t)
  :config (add-to-list 'lsp-tailwindcss-major-modes 'typescript-tsx-mode :append)
  :after (lsp-mode))
