;;; ui/coverage/config.el -*- lexical-binding: t; -*-

(use-package! cov
  :unless noninteractive
  :init
  (setq-default cov-covarage-mode t)
  :hook ((python-mode . cov-mode)
         (c++-mode . cov-mode)
         (c-mode . cov-mode)
         (java-mode . cov-mode)
         (emacs-lisp . cov-mode)))
