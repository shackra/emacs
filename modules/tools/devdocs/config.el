;;; tools/devdocs/config.el -*- lexical-binding: t; -*-

(use-package! devdocs
  :unless noninteractive
  :bind ("C-h D" . devdocs-lookup))
