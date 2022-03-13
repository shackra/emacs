;; -*- no-byte-compile: t; -*-
;;; tree-sitter/packages.el

(when (package! tsc
        :recipe (:host github :repo "emacs-tree-sitter/elisp-tree-sitter"
                 :files
                 ("core/*.el"
                  "core/Cargo.toml"
                  "core/Cargo.lock"
                  "core/src"))
        :disable (not (functionp 'module-load)))

  (package! tree-sitter
    :recipe (:host github :repo "emacs-tree-sitter/elisp-tree-sitter"
             :files ("lisp/*.el"
                     (:exclude "lisp/tree-sitter-tests.el")))
    :disable (not (functionp 'module-load)))

  (package! tree-sitter-langs
    :recipe (:host github :repo "emacs-tree-sitter/tree-sitter-langs"
             :files ("*.el"
                     "queries/"))
    :disable (not (functionp 'module-load))))
