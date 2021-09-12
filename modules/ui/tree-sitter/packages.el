;; -*- no-byte-compile: t; -*-
;;; tree-sitter/packages.el

(package! tree-sitter
  :recipe (:host github :repo "ubolonton/emacs-tree-sitter"
           :files ("lisp/*.el"
                   (:exclude "lisp/tree-sitter-tests.el")))
  :disable (not (functionp 'module-load)))

(package! tree-sitter-langs
  :recipe (:host github :repo "ubolonton/tree-sitter-langs"
           :files ("*.el"
                   "queries/"))
  :disable (not (functionp 'module-load)))

(package! tsc
  :recipe (:host github :repo "ubolonton/emacs-tree-sitter"
           :files
           ("core/*.el"
            "core/Cargo.toml"
            "core/Cargo.lock"
            "core/src"))
  :disable (not (functionp 'module-load)))
