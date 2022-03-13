;;; editor/reformat/config.el -*- lexical-binding: t; -*-

(use-package! apheleia
  :commands (apheleia-mode))

(add-hook! '(prog-mode-hook text-mode-hook) #'apheleia-mode)
