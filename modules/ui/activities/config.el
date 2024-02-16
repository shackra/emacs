;;; ui/activities/config.el -*- lexical-binding: t; -*-

(use-package! activities
  :unless noninteractive
  :hook ((doom-init-ui . activities-mode)
         (tab-bar-mode . activities-tabs-mode))
  :init
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)

  :bind
  (("C-x C-a C-n" . activities-new)
   ;; As resuming is expected to be one of the most commonly used
   ;; commands, this binding is one of the easiest to press.
   ("C-x C-a C-a" . activities-resume)
   ("C-x C-a C-s" . activities-suspend)
   ("C-x C-a C-k" . activities-kill)
   ;; This binding mirrors, e.g. "C-x t RET".
   ("C-x C-a RET" . activities-switch)
   ("C-x C-a g" . activities-revert)
   ("C-x C-a l" . activities-list)))
