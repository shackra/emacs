(if (eq system-type 'gnu/linux)
    (load-file (expand-file-name "security.el" user-emacs-directory)))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(setf package-enable-at-startup nil)
(package-initialize)

(defun shackra/update-one-package (package)
  "Actualiza un paquete PACKAGE"
  (when (package-installed-p package)
    (let* ((newest-pkg (car-safe (cdr (assq package package-archive-contents))))
           (new-ver (and newest-pkg (package-desc-version newest-pkg)))
           (builtin-pkg (cdr (assq package package--builtins)))
           (installed-pkg (car-safe (cdr (assq package package-alist))))
           (old-dir (and installed-pkg (package-desc-dir installed-pkg)))
           (old-ver (or (and installed-pkg (package-desc-version installed-pkg))
                       (and builtin-pkg (package--bi-desc-version builtin-pkg)))))
      (when (and new-ver (version-list-< old-ver new-ver)) 
        ;; Instalamos la nueva versión de org-mode
        (condition-case nil
            ;; en caso de algún error tratando de bajar algún paquete, captura
            ;; el error para que no interfiera con la inicialización de Emacs
            (progn (package-install newest-pkg)
                   (message (format "Paquete «%s» actualizado de la versión %s a la versión %s"
                                    (package-desc-name newest-pkg) old-ver new-ver))))
        (unless old-dir
	  (delete-directory old-dir t))))))

;; repositorios de paquetes
(setf package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))

;; revisamos si no tenemos use-package instalado, porque de ser verdadero esto,
;; lo instalamos
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

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

(defun shackra/org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "emacs-lisp"))))
(setf org-confirm-babel-evaluate #'shackra/org-confirm-babel-evaluate)

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
