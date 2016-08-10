# La configuración de GNU Emacs de Jorge Javier Araya Navarro (Shackra Sislock)

Mi configuración de GNU Emacs, casi siempre le estoy haciendo ajustes. Posiblemente publique una serie de
guías para aquellos que desean usar Emacs pudiendo así ajustarlo a sus necesidades.

## Puede que estés viendo un repositorio espejo

Mi configuración se hospeda en [Bitbucket.org](https://bitbucket.org/shackra/.emacs.d/), la configuración que
ves en [Github.com](https://github.com/shackra/.emacs.d/) no necesariamente estará actualizada con los cambios
más recientes.

## Notas adicionales

Mi configuración esta escrita en un archivo de org-mode, escribir la configuración en un archivo de
esos es algo que los chicos cool hacen hoy día. El archivo [`init.el`](init.el) contiene código elisp para
hacer funcionar ese formato de configuración.

Entonces el archivo `configuracion.org` es procesado, el código elisp extraído y la configuración es leída por
Emacs. Yo uso el macro [`use-package`](https://github.com/jwiegley/use-package) para mantener el orden y desactivar alguna funcionalidad cuando me parezca necesario, `use-package` evita caer en [*la bancarrota .emacs*](http://emacsblog.org/2007/10/07/declaring-emacs-bankruptcy/) que es cuando tu configuración crece a grandes proporciones y es inmanejable o editable.
