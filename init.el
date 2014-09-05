;; init.el para esta configuración. Tu Emacs debe ser versión 24.
(package-initialize)
(require 'ob-tangle)
(org-babel-load-file
 (expand-file-name "emacs-init.org"
		   user-emacs-directory))
