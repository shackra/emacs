;; -*- no-byte-compile: t; -*-
;;; lang/nginx/packages.el

(package! nginx-mode
  :recipe (:host github :repo "ajc/nginx-mode"
           :files ("*.el"))
  :pin "a2bab83c2eb233d57d76b236e7c141c2ccc97005")
