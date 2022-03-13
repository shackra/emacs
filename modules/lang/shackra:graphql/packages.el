;; -*- no-byte-compile: t; -*-
;;; lang/shackra:graphql/packages.el
(when (package! request :recipe (:host github :repo "tkf/emacs-request"))
  (package! graphql-mode :recipe (:host github :repo "davazp/graphql-mode")))
