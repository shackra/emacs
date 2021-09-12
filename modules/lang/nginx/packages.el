;; -*- no-byte-compile: t; -*-
;;; lang/nginx/packages.el

(package! nginx-mode
  :recipe (:host github :repo "ajc/nginx-mode"
           :files ("*.el")))
