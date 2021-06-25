;; -*- no-byte-compile: t; -*-
;;; tree-sitter/packages.el

(package! tree-sitter
  :recipe (:host github :repo "ubolonton/emacs-tree-sitter"
           :files ("lisp/*.el"
                   (:exclude "lisp/tree-sitter-tests.el")))
  :pin "3a600d769bd5da95bf46bec58893934370c6c04f"
  :disable (not (functionp 'module-load)))

(package! tree-sitter-langs
  :recipe (:host github :repo "ubolonton/tree-sitter-langs"
           :files ("*.el"
                   "queries/"))
  :pin "5d362ce98dcf656d7a55fcad6ae21c0a2caca861"
  :disable (not (functionp 'module-load)))

(package! tsc
  :recipe (:host github :repo "ubolonton/emacs-tree-sitter"
           :files
           ("core/*.el"
            "core/Cargo.toml"
            "core/Cargo.lock"
            "core/src"))
  :pin "3a600d769bd5da95bf46bec58893934370c6c04f"
  :disable (not (functionp 'module-load)))
