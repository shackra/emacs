;;; tree-sitter/config.el -*- lexical-binding: t; -*-

(use-package! tree-sitter-langs)
(use-package! tree-sitter-debug)
(use-package! tree-sitter-query)
(use-package! tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook! 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
