(if (eq system-type 'gnu/linux)
    (load-file (expand-file-name "security.el" user-emacs-directory)))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(setf package-enable-at-startup nil)
(package-initialize)

(defun shackra/update-one-package (package)
  "Actualiza de manera un paquete PACKAGE"
  (when (package-installed-p package)
    (let* ((newest-pkg (cadr (assq package package-archive-contents)))
           (installed-pkg (cadr (or (assq package package-alist)
                                   (assq package package--builtins)))))
      (when (version-list-<= (package-desc-version newest-pkg) (package-desc-version installed-pkg))
        ;; Instalamos la nueva versión de org-mode
        (package-install newest-pkg)
        (message (format "Paquete «%s» actualizado de la versión %s a la versión %s"
                         (package-desc-name newest-pkg)
                         (car (package-desc-version newest-pkg))
                         (car (package-desc-version installed-pkg))))
        (delete-directory (package-desc-dir installed-pkg) t)))))

;; repositorios de paquetes
(setf package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))

;; revisamos si no tenemos use-package instalado, porque de ser verdadero esto,
;; lo instalamos
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

;; TODO: instalar org en caso de existir alguna actualización
(if (not (package-installed-p 'org))
    (package-install 'org)
  ;; El paquete esta instalado. Actualiza el paquete org-mode.
  (shackra/update-one-package 'org))

;; Arreglo para LaTeX con Emacs en MacOS "El Capitan"
(when (eq system-type 'darwin)
  (setf exec-path (append exec-path '("/Library/TeX/texbin"))))

;; En caso de que /usr/local/bin no este agregado
(when (and (not (member "/usr/local/bin" exec-path)) (or (not (eq system-type 'windows-nt))
                                                    (not (eq system-type 'cygwin))
                                                    (not (eq system-type 'ms-dos))))
  (setf exec-path (append exec-path '("/usr/local/bin")))
  (setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t))

(put 'downcase-region 'disabled nil)
(require 'use-package)
(setf use-package-always-ensure t)

(require 'ob-tangle)
;; cuando el archivo org es más reciente que el archivo elisp, el archivo elisp
;; se recrea a partir de los bloques de código en el archivo org. Esto deberia
;; ahorrarme unos segundos cuando Emacs se carga.
(when (file-newer-than-file-p
       (expand-file-name "configuracion.org" user-emacs-directory)
       (expand-file-name "configuracion.el" user-emacs-directory))
  ;; enreda los bloques de código en un archivo elisp si el archivo ORG es más
  ;; nuevo que el archivo elisp 
  (org-babel-load-file (expand-file-name "configuracion.org" user-emacs-directory))) 

;; finalmente, carga la configuración
(load-file (expand-file-name "configuracion.el" user-emacs-directory))
