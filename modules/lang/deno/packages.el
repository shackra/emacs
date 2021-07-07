;; -*- no-byte-compile: t; -*-
;;; lang/deno/packages.el

(package! deno-fmt
  :recipe (:host github :repo "rclarey/deno-emacs" :files ("*.el"))
  :pin "3b193eef576e2c14fdcf350495955e6e8546dddd")
