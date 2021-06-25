;;; default/jorge/config.el -*- lexical-binding: t; -*-

(when (featurep! :config default +jorge)
  (after! highlight-escape-sequences
    (add-hook! 'prog-mode-hook #'turn-on-hes-mode))

  (unless (featurep! :config default +smartparens)
    (add-hook! 'prog-mode-hook #'electric-pair-local-mode)
    (add-hook! 'prog-mode-hook #'turn-off-smartparens-mode))

  (after! uniquify
    (setq uniquify-buffer-name-style 'forward)))
