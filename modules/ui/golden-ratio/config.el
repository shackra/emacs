;;; ui/golden-ratio/config.el -*- lexical-binding: t; -*-

(use-package! golden-ratio
  :unless noninteractive
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-exclude-modes '(occur-mode)))
