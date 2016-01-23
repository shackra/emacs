# La configuración de GNU Emacs de Jorge Araya (Shackra Sislock)

Mi configuración de GNU Emacs, casi siempre le estoy haciendo ajustes. Posiblemente publique una serie de
guías para aquellos que desean usar Emacs pudiendo así ajustarlo a sus necesidades.

## Puede que estés viendo un repositorio espejo

Mi configuración se hospeda en [Bitbucket.org](https://bitbucket.org/shackra/.emacs.d/), la configuración que
ves en [Github.com](https://github.com/shackra/.emacs.d/) no necesariamente estará actualizada con los cambios
más recientes que le haya realizado a la configuración.

## Notas adicionales

Mi configuración esta escrita en un archivo de org-mode, escribir la configuración en un archivo de esos es
algo que los chicos cool hacen hoy día. El archivo `init.el` contiene el siguiente código:


    (if (eq system-type 'gnu/linux)
        (load-file (expand-file-name "security.el" user-emacs-directory)))
    ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
    (setf package-enable-at-startup nil)
    (package-initialize)
    
    ;; repositorios de paquetes
    (setf package-archives '(("melpa" . "https://melpa.org/packages/")
                             ("org" . "http://orgmode.org/elpa/")
                             ("gnu" . "https://elpa.gnu.org/packages/")))
    
    ;; revisamos si no tenemos use-package instalado, porque de ser verdadero esto,
    ;; lo instalamos
    (when (not (package-installed-p 'use-package))
      (progn
        (unless package-archive-contents
          (package-refresh-contents))
        (package-install 'use-package)))
    
    (when (not (package-installed-p 'org))
      (progn
        (unless package-archive-contents
          (package-refresh-contents))
        (package-install 'org)))
    
    (put 'downcase-region 'disabled nil)
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


Entonces el archivo `configuracion.org` es procesado, el código elisp extraído y la configuración es leída por
Emacs. Yo uso el macro [`use-package`](https://github.com/jwiegley/use-package) para mi configuración para mantener el orden y desactivar alguna funcionalidad cuando me parezca necesario, `use-package` evita caer en [*la bancarrota .emacs*](http://emacsblog.org/2007/10/07/declaring-emacs-bankruptcy/) que es cuando tu configuración crece a grandes proporciones y es inmanejable o editable.

En Github es posible ver archivos org-mode *renderizados* de forma correcta, si deseas revisar mi
configuración es mejor que lo hagas [desde la copia espejo](https://github.com/shackra/.emacs.d/blob/master/emacs-init.org).
