;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(setf package-enable-at-startup nil)
;; init.el para esta configuración. Tu Emacs debe ser versión 24.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; Para importes librerias que requieren compatibilidad como cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; revisamos si no tenemos use-package instalado, porque de ser verdadero esto,
;; lo instalamos
(when (not (package-installed-p 'use-package))
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(require 'use-package)
(setf use-package-always-ensure t)
(require 'ob-tangle)
;; cuando el archivo org es más reciente que el archivo elisp, el archivo elisp
;; se recrea a partir de los bloques de código en el archivo org. Esto deberia
;; ahorrarme unos segundos cuando Emacs se carga.
(if (file-newer-than-file-p
     (expand-file-name "configuracion.org" user-emacs-directory)
     (expand-file-name "configuracion.el" user-emacs-directory))
    ;; enreda los bloques de código en un archivo elisp
    (org-babel-load-file (expand-file-name "configuracion.org" user-emacs-directory))
  ;; en caso contrario, carga el archivo ya existente :)
  (load-file (expand-file-name "configuracion.el" user-emacs-directory)))
(put 'downcase-region 'disabled nil)
