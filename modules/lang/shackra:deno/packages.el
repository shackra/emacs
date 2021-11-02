;; -*- no-byte-compile: t; -*-
;;; lang/deno/packages.el

(package! deno-fmt
  :recipe (:host github :repo "rclarey/deno-emacs" :files ("*.el")))
