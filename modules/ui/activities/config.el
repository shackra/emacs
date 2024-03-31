;;; ui/activities/config.el -*- lexical-binding: t; -*-

(defun ap/switch-to-buffer ()
  "Switch to buffer offered from various sources.
If an activity is current, use `activities-switch-buffer';
otherwise use `switch-to-buffer'."
  (interactive)
  (cond ((or (equal '(16) current-prefix-arg)
             (not (activities-current)))
         (call-interactively #'switch-to-buffer))
        (t (call-interactively #'activities-switch-buffer))))

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
   ("C-x C-a l" . activities-list)
   ("C-x b" . ap/switch-to-buffer)))
