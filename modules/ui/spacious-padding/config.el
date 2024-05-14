;;; ui/spacious-padding/config.el -*- lexical-binding: t; -*-

(use-package! spacious-padding
  :unless noninteractive
  :hook (after-init . spacious-padding-mode))
