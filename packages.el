;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! openapi-yaml-mode
  :recipe (:host github :repo "magoyette/openapi-yaml-mode" :files ("openapi-yaml-mode.el"))
  :pin "0e2e9e7772b1b819d9f0033c64f03ad074ac6ffd")

;; TODO: migrar a su propio paquete
(package! svelte-mode :recipe (:host github :repo "leafOfTree/svelte-mode")
  :pin "25d0018036f44ff9bd685a1c9a76d8ba57c1024d")

(package! graphql-mode :recipe (:host github :repo "davazp/graphql-mode")
  :pin "80e9ac8020f7a4a8a963136698eb97a9fca28f7d")

(package! request :recipe (:host github :repo "tkf/emacs-request")
  :pin "3336eaa97de923f74b90dda3e35985e122d40805")

(package! protobuf-mode :recipe (:host github :repo "protocolbuffers/protobuf" :files ("editors/protobuf-mode.el"))
  :pin "c38281dd20e562bac239bc77ab2fa10f71661708")

(package! k8s-mode :recipe (:host github :repo "TxGVNN/emacs-k8s-mode"))

(package! beacon)

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
