;; init.el para esta configuración. Tu Emacs debe ser versión 24.
(package-initialize)
(require 'ob-tangle)
;; cuando el archivo org es más reciente que el archivo elisp, el archivo elisp
;; se recrea a partir de los bloques de código en el archivo org. Esto deberia
;; ahorrarme unos segundos cuando Emacs se carga.
(if (file-newer-than-file-p (expand-file-name "emacs-init.org" user-emacs-directory)
                            (expand-file-name "emacs-init.el" user-emacs-directory))
    ;; enreda los bloques de código en un archivo elisp
    (org-babel-load-file (expand-file-name "emacs-init.org" user-emacs-directory))
  ;; en caso contrario, carga el archivo ya existente :)
  (load-file (expand-file-name "emacs-init.el" user-emacs-directory)))
