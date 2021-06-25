;; -*- no-byte-compile: t; -*-
;;; lang/rego/packages.el

(package! rego-mode
  :recipe (:host github :repo "psibi/rego-mode")
  :pin "be110e6cef5d34eef0529a8739c68e619cf15310"
  :disable (not (featurep! :lang rego)))
