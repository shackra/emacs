;;; tools/devdocs/config.el -*- lexical-binding: t; -*-

(use-package! devdocs
  :unless noninteractive
  :bind ("C-h D" . shackra/devdocs-lookup)
  :init
  (defun shackra/devdocs-lookup (&optional ask-docs)
    "Light wrapper around `devdocs-lookup` which pre-populates the function input with thing at point"
    (interactive "P")
    (let ((query (thing-at-point 'symbol t)))
      (devdocs-lookup ask-docs query))))
