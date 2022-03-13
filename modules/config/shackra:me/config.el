;;; default/jorge/config.el -*- lexical-binding: t; -*-

(use-package! highlight-escape-sequences :commands (turn-on-hes-mode))
(add-hook! 'prog-mode-hook #'turn-on-hes-mode)

(unless (featurep! :config default +smartparens)
  (add-hook! 'prog-mode-hook #'electric-pair-local-mode)
  (add-hook! 'prog-mode-hook #'turn-off-smartparens-mode))
