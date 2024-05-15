;;; tools/devdocs/config.el -*- lexical-binding: t; -*-

(use-package! devdocs
  :unless noninteractive
  :bind ("C-h D" . shackra/devdocs-lookup)
  :init
  (add-to-list 'display-buffer-alist
               '("\\*devdocs\\*"
                 display-buffer-in-side-window
                 (side . right)
                 (slot . 3)
                 (window-parameters . ((no-delete-other-windows . t)))
                 (dedicated . t)))

  (defun shackra/devdocs-lookup (&optional ask-docs)
    "Light wrapper around `devdocs-lookup` which pre-populates the function input with thing at point"
    (interactive "P")
    (let ((query (thing-at-point 'symbol t)))
      (devdocs-lookup ask-docs query)))
  :config
  (setq-hook! 'go-mode
    devdocs-current-docs
    '("go"
      "sqlite"
      "http"))
  (setq-hook! 'gdscript-mode
    devdocs-current-docs
    '("godot~3.5"))
  (setq-hook! 'emacs-lisp-mode
    devdocs-current-docs
    '("elisp"))
  (setq-hook! 'python-mode
    devdocs-current-docs
    '("python~3.11"
      "python~3.12"
      "sqlite"
      "flask~3.0"
      "http"))
  (setq-hook! 'web-mode
    devdocs-current-docs
    '("react"
      "svelte"
      "javascript"
      "typescript"
      "moment"
      "tailwindcss"
      "html"
      "css"))
  (setq-hook! 'typescript-mode
    devdocs-current-docs
    '("react"
      "svelte"
      "javascript"
      "typescript"
      "moment"
      "tailwindcss"
      "html"
      "css")))
