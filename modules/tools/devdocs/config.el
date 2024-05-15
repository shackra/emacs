;;; tools/devdocs/config.el -*- lexical-binding: t; -*-

(use-package! devdocs
  :init
  (defun shackra/devdocs-lookup (&optional ask-docs)
    (interactive "P")
    (let ((query (thing-at-point 'symbol t)))
      (devdocs-lookup ask-docs query)))

  (when (modulep! :tools devdocs)
    (add-to-list 'display-buffer-alist
                 '("\\*devdocs\\*"
                   display-buffer-in-side-window
                   (side . right)
                   (slot . 3)
                   (window-parameters . ((no-delete-other-windows . t)))
                   (dedicated . t))))

  (global-set-key (kbd "C-h D") 'shackra/devdocs-lookup)
  :config
  (setq-hook! 'go-mode-hook
    devdocs-current-docs
    '("go"
      "sqlite"
      "http"))

  (setq-hook! 'gdscript-mode-hook
    devdocs-current-docs
    '("godot~3.5"))

  (setq-hook! 'emacs-lisp-mode-hook
    devdocs-current-docs
    '("elisp"))

  (setq-hook! 'python-mode-hook
    devdocs-current-docs
    '("python~3.11"
      "python~3.12"
      "sqlite"
      "flask~3.0"
      "http"))

  (setq-hook! 'web-mode-hook
    devdocs-current-docs
    '("react"
      "svelte"
      "javascript"
      "typescript"
      "moment"
      "tailwindcss"
      "html"
      "css"))

  (setq-hook! 'typescript-mode-hook
    devdocs-current-docs
    '("react"
      "svelte"
      "javascript"
      "typescript"
      "moment"
      "tailwindcss"
      "html"
      "css")))
