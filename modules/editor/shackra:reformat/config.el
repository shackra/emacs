;;; editor/reformat/config.el -*- lexical-binding: t; -*-

(use-package! apheleia
  :config
  (add-hook! '(prog-mode-hook text-mode-hook) #'apheleia-mode))
