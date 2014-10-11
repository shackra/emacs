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

    ;; init.el para esta configuración. Tu Emacs debe ser versión 24.
    (package-initialize)
    (require 'ob-tangle)
    (org-babel-load-file
        (expand-file-name "emacs-init.org"
                          user-emacs-directory))
    (put 'upcase-region 'disabled nil)

Entonces el archivo `emacs-init.org` es procesado, el código elisp extraído y la configuración es leída por
Emacs. Mi configuración tienen una lista completa de los paquetes instalados desde ELPA, así que debería
funcionar sin más porque los paquetes que falten serán instalados, evitando que alguna sección de mi
configuración falle por la falta de determinado paquete.

En Github es posible ver archivos org-mode *renderizados* de forma correcta, si deseas revisar mi
configuración es mejor que lo hagas
[desde la copia espejo](https://github.com/shackra/.emacs.d/blob/master/emacs-init.org).
