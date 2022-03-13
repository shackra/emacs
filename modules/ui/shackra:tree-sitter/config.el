;;; tree-sitter/config.el -*- lexical-binding: t; -*-

(use-package! tree-sitter-langs :defer)
(use-package! tree-sitter-debug :defer)
(use-package! tree-sitter-query :defer)
(use-package! tree-sitter
  :commands (tree-sitter-mode turn-on-tree-sitter-mode)
  :config
  (add-hook! 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(add-hook! (prog-mode text-mode) #'turn-on-tree-sitter-mode)
