Changelog
=========


(unreleased)
------------

New
~~~
- Cambia C-x o como atajo para ace-window. [Jorge Araya Navarro]
- Documenta compilación de Emacs en distros basadas en Debian. [=]
- Agrega soporte para flow. [Jorge Araya Navarro]
- Cambia tema de Emacs a doom-themes spacegrey. [Jorge Araya Navarro]
- Coloca texto de ayuda a leyenda en Latín en dashboard. [Jorge Araya
  Navarro]
- Integra nuevo paquete para hacer anotaciones en código fuente. [=]
- Agrega paquete para editar diagramas escritos en PlantUML. [Jorge
  Araya Navarro]
- Agrega ox-revealjs para presentaciones. [=]
- Implementa comando interactivo para cambiar el conteo de lineas. [=]

  ajusta entre el conteo relativo y el absoluto para que otros puedan leer con facilidad el conteo de
  lineas en el buffer actual
- Habilita paquetes adicionales para Python. [=]

  - pyvenv que maneja entornos virtuales
  - pyenv que integra pyenv para usarlo en Emacs
- Agrega panel de control y actualiza Avy. [Jorge Araya Navarro]
- Habilita interfaz más amigable para ivy y mejor sorteo y filtro.
  [Jorge Araya Navarro]
- Ignora archivo de dap-mode. [Jorge Araya Navarro]
- Integra Debug Adapter Protocol para Go, Python y Javascript. [Jorge
  Araya Navarro]

Changes
~~~~~~~
- Función establece estilo de código C según proyecto. [Jorge Araya
  Navarro]
- Usa msmtp para enviar correo en mu4e. [Jorge Araya Navarro]
- Cambia atajo de teclado para hydra-avy. [Jorge Araya Navarro]
- Actualiza versiones de paquetes. [Jorge Araya Navarro]
- Usa el valor de `user-mail-address` en funciones de mu4e. [Jorge Araya
  Navarro]

  a veces el valor de `msg` puede ser un valor nulo
- Desactiva weechat.el. [Jorge Araya Navarro]

  - https://github.com/the-kenny/weechat.el/issues/77
- Mueve configuración para dap-{firefox,chrome} [Jorge Araya Navarro]

  esta configuración es independiente de cualquier modo mayor usado para trabajar en frontend entonces
  lo mejor y más lógico era moverlo fuera
- Usa js-mode en Emacs 27 o superior. [Jorge Araya Navarro]
- Cambia el nombre de función. [Jorge Araya Navarro]

  describe mejor que hace la función interactiva
- Mueve contenido sobre compilación de Emacs a otro archivo. [=]
- Reemplaza multi-term con aweshell. [=]
- Usa fork para js2-mode. [=]

  otorga soporte para flow
- Cambia ajustes para soportar flow. [=]
- Desactiva las alertas por punto y coma ausentes en js2-mode. [=]
- Obtiene ubicación de PlantUML urgando en /usr/bin/plantuml. [Jorge
  Araya Navarro]
- Cambia modo de ejecución de PlantUML y agrega GraphQL. [Jorge Araya
  Navarro]
- Muestra documentación con lsp-ui-doc. [Jorge Araya Navarro]
- Congela las versiones de paquetes instalados. [Jorge Araya Navarro]
- Habilita Ditaa para generación de diagramas. [Jorge Araya Navarro]
- Activa rjsx-mode según el contenido de archivos JavaScript. [=]

  - https://emacs.stackexchange.com/a/36150/609
  - https://jwiegley.github.io/use-package/keywords/#magic-magic-fallback
- Refactoriza hydra para bookmarks. [Jorge Araya Navarro]
- Desactiva ivy-posframe. [Jorge Araya Navarro]
- Actualiza el commit de varios paquetes. [Jorge Araya Navarro]
- Elimina `require` innecesario. [Jorge Araya Navarro]
- Actualiza todos los paquetes instalados. [Jorge Araya Navarro]
- Ata de vuelta isearch-*ward a C-s y C-r para pdf-view. [=]
- Fuerza blacken a usar un largo de linea de 80 caracteres. [Jorge Araya
  Navarro]
- Elimina realgud por dap-mode. [Jorge Araya Navarro]

Fix
~~~
- Apaga js2-minor-mode y arregla sangrado en js-jsx. [Jorge Araya
  Navarro]
- Inserta ubicación de mu4e en load-path. [=]

  si mu4e existe en el sistema es agregado a load-path y asi me evito una alerta cuando inicio Emacs
  en la PC del trabajo
- Establece una ruta distinta para el .jar de PlantUML. [Jorge Araya
  Navarro]

  esto en caso de que no este instalado donde se espera
- Mueve la ventana de documentación de lsp-ui arriba del buffer. [Jorge
  Araya Navarro]
- Arregla código que filtra y muestra apuntes técnicos. [Jorge Araya
  Navarro]
- Evita referencia a variables antes que sean cargadas. [Jorge Araya
  Navarro]
- Refactoriza configuración de ivy-mode. [Jorge Araya Navarro]
- Suspende emojify-mode en toml-mode y yaml-mode. [Jorge Araya Navarro]
- Inserta función en gancho para dockerfile-mode. [Jorge Araya Navarro]
- Elimina la ubicación del archivo para reveal.js. [Jorge Araya Navarro]

  el paquete se vale de una ubicación raíz para enlazar todos los archivos que el HTML exportado necesita
- Utiliza una URL exacta para reveal.js. [Jorge Araya Navarro]
- Ignora archivos de lsp. [=]
- Apaga sangrado agresivo para Dockerfile. [=]
- Ajustes menores para flycheck y go-mode. [Jorge Araya Navarro]
- Elimina :commands. [Jorge Araya Navarro]
- Deshabilita flycheck para go-mode. [Jorge Araya Navarro]
- Usa global-flycheck en lugar de flycheck-mode regular. [Jorge Araya
  Navarro]
- Borra marcadores dentro de carpeta de Emacs. [Jorge Araya Navarro]
- Activa dashboard correctamente. [Jorge Araya Navarro]
- Evita usar versiones fijas de dependencias para JS. [=]
- Carga extensión solo si mu4e esta disponible. [=]
- Permite que el demonio Emacs inicie con normalidad en Mint 19. [=]

  Mueve varias funciones a `emacs-startup-hook`
- Actualiza mi dirección de correo. [=]
- Lista paquete de Node.JS faltante. [Jorge Araya Navarro]
- Fuerza uso de org-plus-contrib en lugar de org. [Jorge Araya Navarro]

  algunos paquetes que dependen de org y en consecuencia org es descargado en lugar de usar
  org-plus-contrib, este cambio arregla el problema.

  - https://github.com/raxod502/straight.el/issues/352#issuecomment-460069774
- Quita manipulación en el recolector de basura. [Jorge Araya Navarro]
- Realiza ajustes para Emacs 25. [Jorge Araya Navarro]

Other
~~~~~
- Revert "chg: Usa fork para js2-mode" [=]

  This reverts commit e7d6cdec72da918d4b96facaafe00785676617fa.


4.0 (2019-04-20)
----------------

New
~~~
- Usa straight.el en lugar de package.el. [Jorge Araya Navarro]
- Instala paquetes para edición de código en C/C++ [Jorge Araya Navarro]
- Extiende la configuración de Emacs para C/C++ [Jorge Araya Navarro]
- Activa LSP para C y C++ [Jorge Araya Navarro]
- Añade plantilla para documentos de diseño de videojuegos. [Jorge Araya
  Navarro]
- Habilita hydra para smerge. [Jorge Araya Navarro]

  - https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-diff.el#L157
- Instala use-package-hydra. [Jorge Araya Navarro]

  me permite integrar mejor Hydra con la configuración de algunos paquetes
- Instala string-inflection. [Jorge Araya Navarro]
- Lista paquete instalado manualmente. [Jorge Araya Navarro]
- Habilita plantilla para rjsx-mode y material-ui. [Jorge Araya Navarro]
- Migra varios modos mayores a LSP. [Jorge Araya Navarro]

  Los modos afectados son:

  - python-mode
  - rjsx-mode
  - js2-mode
  - js-mode
  - rust-mode
  - go-mode
  - web-mode
  - css-mode
  - html-mode
  - php-mode
  - typescript-mode
  - vue-mode

  - https://github.com/emacs-lsp/lsp-mode/issues/489
  - https://github.com/emacs-lsp/lsp-mode/issues/479
  - https://github.com/emacs-lsp/lsp-mode/issues/335
- Habilita go-mode para programación literaria. [Jorge Araya Navarro]
- Cambia el nombre del archivo de configuración. [Jorge Araya Navarro]

  Mata dos pajaros de un solo tiro.
- Carga la variable de entorno PATH desde la shell. [Jorge Araya
  Navarro]
- Ignora Cask. [Jorge Araya Navarro]
- Agrega nuevos paquetes. [Jorge Araya Navarro]

  Secretaria ahora es descargado de Melpa
- Carga perfil de entorno para zsh. [Jorge Araya Navarro]

  - https://www.gnu.org/software/emacs/manual/html_node/emacs/Interactive-Shell.html
- Instala auto-yasnippet. [Jorge Araya Navarro]

  Ayuda con la escritura repetitiva de lineas
- Activa typescript-mode y rjsx-minor-mode para archivos tsx. [Jorge
  Araya Navarro]
- Añade nuevos paquetes. [Jorge Araya Navarro]
- Habilita comando para filtrar cuaderno de apuntes técnicos. [Jorge
  Araya Navarro]

  - https://www.reddit.com/r/emacs/comments/8wx52n/if_you_have_a_software_engineering_notebook_this/
- Configura Emacs para usar languagetool en Windows 10. [Jorge Araya
  Navarro]
- Habilita corrección gramatical con LanguageTool. [Jorge Araya Navarro]

  - https://www.reddit.com/r/emacs/comments/2zqetc/languagetool_exited_abnormally_with_code_1/ctapph0
- El Infierno se congelo. [Jorge Araya Navarro]
- Instala company childframe. [Jorge Araya Navarro]

  Si Emacs es versión 26, y desactiva `company-quickhelp` para evitar problemas de compatibilidad
- Inserta marcadores para directorios en GNU/Linux. [Jorge Araya
  Navarro]
- Actualiza bookmark+ [Jorge Araya Navarro]
- Actualiza ivy. [Jorge Araya Navarro]

  Ignora más buffers
- Mejoras en Weechat. [Jorge Araya Navarro]

  Activa corrección ortográfica en buffers monitorizados, activa `visual-line-mode' y desactiva linum.
- Inserta configuración para Tide al abrir un archivo jsconfig.json.
  [Jorge Araya Navarro]
- Incluye plantilla de configuración para tide. [Jorge Araya Navarro]

  - https://github.com/ananthakumaran/tide#javascript
- Incluye errores informativos en la visualización. [Jorge Araya
  Navarro]
- Añade comandos adicionales. [Jorge Araya Navarro]
- Actualiza el estado vc de los archivos abiertos del proyecto. [Jorge
  Araya Navarro]

  Permite que vc-state se comporte conforme a la realidad de los archivos registrados y pujados al
  repositorio remoto.

  - https://emacs.stackexchange.com/q/35758/690
- Muestra errores y advertencias de Flycheck. [Jorge Araya Navarro]
- Icono de guardado es pintado en verde y el de editado en rojo. [Jorge
  Araya Navarro]

  Permite diferenciar el estado del buffer más pronto a través de los colores de ambos iconos.
- Marca correos como leidos si son borrados o marcados como spam. [Jorge
  Araya Navarro]
- Habilita counsel-term. [Jorge Araya Navarro]

  Facilita navegación de directorios en una shell dentro de Emacs
- El archivo de configuración es visitado a través de una función.
  [Jorge Araya Navarro]
- El correo es visualizado en el navegador web. [Jorge Araya Navarro]
- Habilita org-mode para enlazar email en notmuch. [Jorge Araya Navarro]
- Añade nuevas plantillas de YASnippet. [Jorge Araya Navarro]
- Reemplaza mu4e con notmuch. [Jorge Araya Navarro]

  La versión 1.x de mu4e rompió mi flujo de trabajo

  - https://github.com/djcb/mu/issues/8#issuecomment-370644231
- Establece opciones para mu4e. [Jorge Araya Navarro]
- Indicaciones para instalar otros componentes para Go. [Jorge Araya
  Navarro]
- Agrega plantillas de Yasnippet para systemd-mode. [Jorge Araya
  Navarro]
- Habilita Yasnippet en systemd-mode. [Jorge Araya Navarro]
- Habilita hack en org-mode que mueve etiquetas al final de marco.
  [Jorge Araya Navarro]
- Habilita paquetes para org-mode y ajusta org-projectile. [Jorge Araya
  Navarro]
- Usa el fork de emacs-slack de Malabarba. [Jorge Araya Navarro]

  Upstream tiene muchos problemas para ser útil

Changes
~~~~~~~
- Simplifica sentencia de use-package. [Jorge Araya Navarro]

  lsp-mode ya se hace cargo de algunas cosas por nosotros

  - https://www.reddit.com/r/emacs/comments/audffp/tip_how_to_use_a_stable_and_fast_environment_to/eh87y8s/
- Desactiva algunos paquetes y añade otros. [Jorge Araya Navarro]
- Usa el tema Nimbus. [Jorge Araya Navarro]
- Despliega nada si no hay entorno virtual de Python activado. [Jorge
  Araya Navarro]
- Modifica el mode-line de telephone-line. [Jorge Araya Navarro]

  elimina el borde duro de la derecha y colores innecesarios
- Cambia el hydra para MC por uno mejor. [Jorge Araya Navarro]

  - https://github.com/abo-abo/hydra/wiki/multiple-cursors
- Migra las hydras a :hydra en use-package. [Jorge Araya Navarro]
- Instala Hydra por default. [Jorge Araya Navarro]
- Centra la plegaria. [Jorge Araya Navarro]
- Desactiva find-file y switch-buffer personalizados. [Jorge Araya
  Navarro]
- Aumenta el tamaño de la tipografía. [Jorge Araya Navarro]
- Cambia configuración para mu4e. [Jorge Araya Navarro]
- Ignora buffer relacionado a LSP con Go. [Jorge Araya Navarro]
- Actualiza información y configuración de correo electrónico. [Jorge
  Araya Navarro]
- Ajuste menor para rjsx-mode. [Jorge Araya Navarro]

  flymake ya no es preferido sobre lsp-ui automáticamente.
- Ajusta dinamicamente temporizador de procesamiento en js2-mode. [Jorge
  Araya Navarro]

  Mejora un poco el comportamiento lento en algunos archivos extensos
- Mejoras para go-mode. [Jorge Araya Navarro]
- Cambia el nivel de seguridad de la red a `medium` [Jorge Araya
  Navarro]

  Debería permitir a Emacs arrancar con normalidad y aceptar nuevos certificados SSL de los
  repositorios Elpa.
- Desactiva el conteo de lineas en algunos modos mayores. [Jorge Araya
  Navarro]
- Recorta el nombre de la rama si es muy larga. [Jorge Araya Navarro]

  Mejora la experiencia con ramas con nombres excesivamente largos
- Instala los paquetes de NodeJS sin sudo. [Jorge Araya Navarro]

  el prefijo de nodejs ahora es a nivel de usuario, lo cual hace que sea innecesario invocar npm con sudo.
- Acorta contenido de `init_zsh.sh` [Jorge Araya Navarro]

  Emacs carga el contenido del archivo en la linea de comandos luego de la inicialización
- Elimina submodulo para Secretaria. [Jorge Araya Navarro]

  - 79ffe11
- Actualiza plantilla para jsconfig.json. [Jorge Araya Navarro]
- Activa globalmente whitespace butler de manera global. [Jorge Araya
  Navarro]
- Activa projectile-mode con ganchos de prog-mode y text-mode. [Jorge
  Araya Navarro]
- Desactiva sidelines en lsp-ui. [Jorge Araya Navarro]
- Elimina paquete kill-or-bury y remapea atajo para kill-buffer. [Jorge
  Araya Navarro]

  Me canse del paquete
- Normaliza sangrado en web-mode. [Jorge Araya Navarro]
- Normaliza el sangrado en desarrollo web a 2 espacios en blanco. [Jorge
  Araya Navarro]
- Ignora algunos buffers creados por Magit. [Jorge Araya Navarro]
- Cambia a company-go para el autocompletado. [Jorge Araya Navarro]

  lsp-go falla mucho

  - https://github.com/emacs-lsp/lsp-go/issues/8#issuecomment-423693153
- Instala blacken desde Melpa. [Jorge Araya Navarro]
- Instala blacken. [Jorge Araya Navarro]

  Formatea código Python desde Emacs antes de guardar
- Relega funciones de formateo de código. [Jorge Araya Navarro]

  Para Python se ha sacado algunas funciones de formateo de código fuera de Emacs y relegado a LSP
- Cambios en Eldoc y Slime para Paredit. [Jorge Araya Navarro]
- Ajustes menores para Windows 10. [Jorge Araya Navarro]
- Cambia hydra-win para que use dos columnas. [Jorge Araya Navarro]

  Ajusta mejor al ancho del cuadro
- Activa paredit para otros modos mayores. [Jorge Araya Navarro]
- Elimina prodigy e instala Cask. [Jorge Araya Navarro]
- Ignora buffers de LSP. [Jorge Araya Navarro]
- Genera fragmento de CHANGELOG en formato Commonmark. [Jorge Araya
  Navarro]

  Utilidad para generar un resumen de cambios en un merge request en Gitlab.

  - https://github.com/zonuexe/pandoc.el/blob/198d262d09e30448f1672338b0b5a81cf75e1eaa/pandoc.el#L98
- Implementa función, instala dependencias externas manualmente. [Jorge
  Araya Navarro]
- Controla sangrado en desarrollo web con una sola variable. [Jorge
  Araya Navarro]
- Ajustes para activar la numeración de lineas. [Jorge Araya Navarro]

  Limita la activación a modos derivados de `prog-mode`, también desactiva la numeración para
  `weechat-mode` y para modos derivados de `term-mode`.
- Cambia como se escribe mi apodo. [Jorge Araya Navarro]
- Habilita magit-todos. [Jorge Araya Navarro]
- Establece buffers a ignorar y cambia el prefijo para Projectile.
  [Jorge Araya Navarro]
- Esconde el indicador de linea y activa native-linum. [Jorge Araya
  Navarro]
- Restaura mu4e como cliente de correo. [Jorge Araya Navarro]

  - https://github.com/djcb/mu/issues/8#issuecomment-396649525
- Deja de jugar con el recolector de basura en Windows. [Jorge Araya
  Navarro]
- Actualiza notmuch. [Jorge Araya Navarro]

  El comando de correo borrado no desactiva las etiquetas al invocarse nuevamente
- Actualiza Rust. [Jorge Araya Navarro]
- Utiliza el valor por defecto para sangrar etiquetas en HTML. [Jorge
  Araya Navarro]
- Sortea los simbolos sin convertirlos en cadenas de texto. [Jorge Araya
  Navarro]

  - https://www.reddit.com/r/emacs/comments/8fiukr/so_i_modified_packagesaveselectedpackages_into/dy43ph1/
- Evita colisión de atajos entre rjsx-mode y js2-refactor-mode. [Jorge
  Araya Navarro]
- Cambia el diseño visual de Flycheck en el mode-line. [Jorge Araya
  Navarro]
- Elimina todos los iconos de los estado para Flycheck. [Jorge Araya
  Navarro]

  Elimina distracciones esteticas en el mode-line
- Mueve fragmento de elisp a custom.el. [Jorge Araya Navarro]
- Ajustes para mode-line y Telephone-line. [Jorge Araya Navarro]

  Se ha sacado las cadenas de texto con tipografía de all-the-icons de las areas marcadas con `accent`
  de Telephone-line debido a un bug posiblemente relacionado con las caras `telephone-line-accent-*`

  También se refactorizo código relacionado al establecimiento de la cara para cadenas de texto que
  usan la tipografía de Font Awesome con la nueva función `shackra-faicon-icon`.

  - https://github.com/dbordak/telephone-line/issues/67
- Ajustes varios para Telephone-line. [Jorge Araya Navarro]

  - https://github.com/dbordak/telephone-line/issues/66
- Elimina Tern en favor de Tide. [Jorge Araya Navarro]

  tsserver tiene actualizaciones mas frecuentes que Tern
- Usa prettify-symbols-mode. [Jorge Araya Navarro]
- Simplifica la configuración de tipografias. [Jorge Araya Navarro]
- Agrega opciones para utf-8 como sistema de codificado. [Jorge Araya
  Navarro]
- Ajustes en Org y Python para Windows. [Jorge Araya Navarro]
- Cambia la fuente de Slack a la de upstream. [Jorge Araya Navarro]

  - https://disqus.com/home/discussion/endlessparentheses/keep_your_slack_distractions_under_control_with_emacs/#comment-3701525479
- Mueve variables de smtpmail a la configuración. [Jorge Araya Navarro]
- Evita compilar el archivo de configuración. [Jorge Araya Navarro]

  Asegura que todos los paquetes sean descargados de Elpa.
- Cambia el tema a Monokai y desactiva weechat. [Jorge Araya Navarro]

  - https://github.com/oneKelvinSmith/monokai-emacs/issues/94
- Cambia el tema a Monokai y ajusta el cursor. [Jorge Araya Navarro]
- Mejoras en Traad. [Jorge Araya Navarro]
- Actualiza plantilla de captura. [Jorge Araya Navarro]
- Quita mu4e-alert y camcorder. [Jorge Araya Navarro]
- Actualiza lista de paquetes instalados explicitamente. [Jorge Araya
  Navarro]
- Ajuste menor en comando para invocar interprete de Python. [Jorge
  Araya Navarro]
- Ajustes menores en configuración de tipografias. [Jorge Araya Navarro]
- Actualiza el archivo leame. [Jorge Araya Navarro]
- Separa Alert y Appt. [Jorge Araya Navarro]
- Establece variable a `nil` si no esta definida. [Jorge Araya Navarro]

  Evita que emacs-slack falle mientras carga en Windows
- Ajustes para Python. [Jorge Araya Navarro]
- Dired+ ya no se carga desde Elpa. [Jorge Araya Navarro]

  Esto debido a los ajustes en Melpa sobre archivos inseguros bajados desde la Wiki de Emacs

  https://github.com/melpa/melpa/pull/5008/

Fix
~~~
- Carga hydra-examples. [Jorge Araya Navarro]

  esto habilita funciones que manipulan la astilla de las ventanas en Emacs
- Corrige símbolo para Python en configuración de Blacken. [Jorge Araya
  Navarro]
- Elimina llamada a comando inexistente. [Jorge Araya Navarro]
- Ajusta el mapeo de teclas para kill-buffer y kill-this-buffer. [Jorge
  Araya Navarro]
- Devuelve cadena si msg es nil. [Jorge Araya Navarro]
- Renombra función. [Jorge Araya Navarro]

  algunas funciones de swiper fueron cambiadas de nombre

  - https://github.com/abo-abo/swiper/commit/58bf1b94c8346491b906aa306f5ed734be67310c
  - https://github.com/syl20bnr/spacemacs/issues/11757
- Indica carpeta de basurero por defecto. [Jorge Araya Navarro]
- Indica ubicación temporal de los borradores. [Jorge Araya Navarro]
- Cambia el servidor para ts-ls. [Jorge Araya Navarro]

  Hay un bug con el servidor actual, javascript-typescript-stdio, que releentiza la edición de código
  en rjsx-mode.

  Feliz año nuevo y feliz solemnidad de María madre de Dios :)

  - https://github.com/emacs-lsp/lsp-mode/issues/588
- Establece RET para terminar iedit-mode. [Jorge Araya Navarro]
- Usa símbolo en lugar de variable. [Jorge Araya Navarro]

  - 551ae91
- Importa correctamente el valor de la variable PATH. [Jorge Araya
  Navarro]
- Arregla congelamiento de Emacs usando iedit o mc con lsp-mode. [Jorge
  Araya Navarro]

  Mejora la experiencia de edición de texto cuando lsp-mode esta activado en el buffer actual y se
  recurre a iedit o a multiple-cursors.
- Calla los mensajes de error en lsp-mode. [Jorge Araya Navarro]

  - https://github.com/emacs-lsp/lsp-mode/issues/342
- Projectile recibe correctamente la lista de buffers a ignorar. [Jorge
  Araya Navarro]
- Elimina archivos de paquete clonado desde Git. [Jorge Araya Navarro]
- Elimina plugins de pyls. [Jorge Araya Navarro]
- Instala pyflakes en nuevos entornos virtuales. [Jorge Araya Navarro]
- Añade correctamente función dentro de gancho. [Jorge Araya Navarro]

  Prog-mode no tenia su gancho correctamente establecido con la función que activa el conteo de lineas
- Define función despues de flycheck-mode es activado. [Jorge Araya
  Navarro]

  Flycheck provee `flycheck' y no `flycheck-mode' causando código muerto en la configuración de Emacs
- Elimina paquete inexistente. [Jorge Araya Navarro]
- Resuelve error por codificación inexistente. [Jorge Araya Navarro]

  - https://www.reddit.com/r/emacs/comments/98qq5k/invalid_coding_system_cp65001/e4jye9y/?context=3&utm_content=context&utm_medium=message&utm_source=reddit&utm_name=frontpage
- Elimina TODOs innecesarios de paquetes de terceros. [Jorge Araya
  Navarro]
- Simplifica configuración para mostrar lineas enumeradas. [Jorge Araya
  Navarro]
- Elimina TODOs innecesarios. [Jorge Araya Navarro]
- Elimina llamada a comando inexistente. [Jorge Araya Navarro]
- Ejecuta comando de sincronizado de email. [Jorge Araya Navarro]

  El script pushmail.sh estaba siendo desenredado por org-mode pero no estaba siendo marcado como
  ejecutable, para simplificar las cosas el comando es ejecutado por `start-process` directamente.
- Comando correcto para `isortify-mode` [Jorge Araya Navarro]
- Ignora archivos generados por org2web. [Jorge Araya Navarro]
- Restaura archivos de estilo de mi blog. [Jorge Araya Navarro]
- Incluye información de VCS en el mode-line, de estar disponible.
  [Jorge Araya Navarro]
- Elimina el uso de `custom-file` [Jorge Araya Navarro]

  Evita desorden y la posibilidad de fallos en la configuración, aumenta el control sobre la configuración.

  - https://github.com/dbordak/telephone-line/issues/66
  - https://github.com/felipeochoa/rjsx-mode/issues/68
- Comprobación mejorada de errores graves o triviales. [Jorge Araya
  Navarro]

  Cualquier cosa que no sea `nil` es `t` o "verdadero" en Emacs Lisp. Sumar los números de errores y
  avisos simplifica la lógica en el código para hacer la comprobación logica.

  Este commit arregla el commit 9d070fe9ad1acd41ede0c399342a7f7d8e4d78a8

  - 9d070fe9ad1acd41ede0c399342a7f7d8e4d78a8
- Elimina referencia a variable inexistente. [Jorge Araya Navarro]
- Utiliza los ganchos adecuados para actualizar el estado vc. [Jorge
  Araya Navarro]

  Este es un arreglo del commit c0db8680494d3a6ec5a2acaf2cbb5c6057175e4d
- Arregla revisión errónea de variable. [Jorge Araya Navarro]
- Elimina sentencia condicional innecesaria. [Jorge Araya Navarro]
- Abandona función obsoleta. [Jorge Araya Navarro]
- Desactiva importmagic en Python. [Jorge Araya Navarro]
- Establece tipografía Symbola correctamente en GNU/Linux. [Jorge Araya
  Navarro]
- No cambia el PATH en Windows. [Jorge Araya Navarro]

  Un ajuste para MacOS estaba desconfigurando el valor de la variable PATH.
- Integra dependencia Bookmark+ [Jorge Araya Navarro]

  - https://github.com/melpa/melpa/issues/2342
- Muestra lista de todos los estados de un buffer en el mode-line.
  [Jorge Araya Navarro]
- Carga ace-window adecuadamente. [Jorge Araya Navarro]
- Carga boormark-plus. [Jorge Araya Navarro]
- Hace que el comando sea interactivo. [Jorge Araya Navarro]
- Da prioridad a WGet en Twittering-mode. [Jorge Araya Navarro]
- Usa funciones de fabrica en lugar de terceros. [Jorge Araya Navarro]

  async no parece cargar módulos de terceros, haciendo fallar algunas funciones como `alert` o `notmuch-hello-update`
- Separa el icono de Git del nombre de la rama. [Jorge Araya Navarro]
- Deshabilita paquete por error de inicialización. [Jorge Araya Navarro]

  https://github.com/jonnay/org-beautify-theme/issues/9

  https://github.com/bbatsov/prelude/issues/1093
- Elimina opción innecesaria para sentencia de pkgbuild-mode. [Jorge
  Araya Navarro]
- Fija atajo para ivy-switch-buffer. [Jorge Araya Navarro]

  Ejecuta el autoloads para ivy cuando el atajo es utilizado

Other
~~~~~
- Merge branch 'master' of gitlab.com:shackra/emacs. [Jorge Araya
  Navarro]
- Merge branch 'lsp-mode' into 'master' [Jorge Javier Araya Navarro]

  Habilita Language Server Protocol en Emacs

  See merge request shackra/emacs!3
- Habilita Language Server Protocol en Emacs. [Jorge Javier Araya
  Navarro]
- Merge branch 'mu4e' into 'master' [Jorge Javier Araya Navarro]

  chg: Restaura mu4e como cliente de correo

  See merge request shackra/emacs!2
- Merge branch 'master' of gitlab.com:shackra/emacs. [Jorge Araya
  Navarro]


3.2 (2017-12-23)
----------------

New
~~~
- Implementa funciones para convertir notas al pie y cursiva. [Jorge
  Araya Navarro]

  De Asciidoc a LaTeX

Changes
~~~~~~~
- Sentencias `use-package` envueltas en `with-eval-after-load` [Jorge
  Araya Navarro]

  Simula cargado de dependencias como una expresión lógica `AND`. `:after` hace que un paquete se
  cargue cuando cualquiera de los simbolos que contiene ha sido definido (como una expresión lógica `OR`).

  https://redd.it/7lq1dv

  https://stackoverflow.com/a/21880276/2020214
- Adquiere los credenciales para redmine de `.netrc` [Jorge Araya
  Navarro]
- Renombra funciones personalizados para usar `-` [Jorge Araya Navarro]

  Por convención, los espacio de nombre de las funciones y variables o simbolos se separan con una
  raya (`-`)

Fix
~~~
- Carga Slack y Redmine solo cuando DBus esta disponible en Emacs.
  [Jorge Araya Navarro]


3.1 (2017-12-16)
----------------

New
~~~
- Pega fragmento generado de CHANGELOG al portapales en magit. [Jorge
  Araya Navarro]

  Facilita la creación de fragmentos de CHANGELOG en un rango especificado entre dos commits sin salir
  de magit utilizando gitchangelog, la salida del comando es colocado en el portapapeles del sistema operativo.

  - https://github.com/vaab/gitchangelog
- Convierte tiempo HH:MM bajo el cursor a notacion decimal. [Jorge Araya
  Navarro]

  Ayuda a conocer el equivalente en notacion decimal de cualquier cantidad de horas y minutos en un
  archivo org-mode. Esta información es pegada en el portapapeles del sistema operativo.

  Para org-mode el atajo `C-M-y` es utilizado para la función `shackra/time-at-point-to-hours` que se
  encarga de todo el trabajo.

  - https://stackoverflow.com/a/2178975/2020214
- Registra instalación de Meghanada. [Jorge Araya Navarro]
- Define función para desactivar localmente electric-indent-mode. [Jorge
  Araya Navarro]
- Instala utilidad para interactuar con Redmine. [Jorge Araya Navarro]
- Instala entorno de depuración integrado a Emacs. [Jorge Araya Navarro]

  - https://github.com/realgud/realgud
- Instala modo menor para trabajar con código Java. [Jorge Araya
  Navarro]

  https://github.com/mopemope/meghanada-emacs
- Función para convertir el tiempo en notación decimal. [Jorge Araya
  Navarro]

  Me ayuda a calcular el tiempo invertido en el brete para registrarlo posteriormente en los registros
  de la empresa

  - https://redd.it/7jlh0t
  - https://www.calculatorsoup.com/calculators/time/time-to-decimal-calculator.php
  - https://www.gnu.org/software/emacs/manual/html_node/elisp/String-Basics.html
- Habilita org-download para descarga de imagenes. [Jorge Araya Navarro]

  Para la plantillas de org-mode capture
- Habilita Slack dentro de Emacs. [Jorge Araya Navarro]

  Comunicación con las organizaciones para las cuales trabajo
- Indica el nuevo hogar de la configuración. [Jorge Araya Navarro]
- Separa la configuración de ivy y swiper. [Jorge Araya Navarro]
- Habilita Gimp mode. [Jorge Araya Navarro]

  Lo necesito para editar archivos `.scm` o Script-fu.
- Implementa función para comprobar existe de módulos Python. [Jorge
  Araya Navarro]

  Sirve para utilizar en plantillas de YaSnippet, para ayudar con la comprobación de ciertas
  condiciones que ayuden a disparar la expansión de la plantilla

  https://stackoverflow.com/a/5014917/2020214
- Integra nuevo segmento en el mode-line. [Jorge Araya Navarro]
- Define cara y segmento para el mode-line. [Jorge Araya Navarro]
- Inicializa variable de entorno cuando Emacs ha sido cargado. [Jorge
  Araya Navarro]
- Recarga las plantillas de YaSnippet luego de iniciar Emacs. [Jorge
  Araya Navarro]
- Registra plantillas personalizadas de YaSnippet. [Jorge Araya Navarro]
- Registra el archivo de marcadores en Git. [Jorge Araya Navarro]
- Habilita git-crypt en el repositorio. [Jorge Araya Navarro]
- Añade plantilla en org-mode para anotaciones técnicas. [Jorge Araya
  Navarro]
- Habilita ajustes para `bookmark` y `Bookmark+` [Jorge Araya Navarro]
- Ivy/Counsel ahora manejan las etiquetas de org-mode. [Jorge Araya
  Navarro]
- Mu4e con perfil principal de correo por default. [Jorge Araya Navarro]
- Añade nuevos paquetes instalados explicitamente. [Jorge Araya Navarro]
- Inserta un encabezado al principio de archivos en Python. [Jorge Araya
  Navarro]

Changes
~~~~~~~
- Remapea atajo de `other-window` a `ace-window` [Jorge Araya Navarro]
- Elimina transcription-mode. [Jorge Araya Navarro]

  Paquete ya no forma parte de los submódulos de Git
- Activa la herencia de propiedades. [Jorge Araya Navarro]
- Conserva el atajo para salto de linea de RET. [Jorge Araya Navarro]

  `eletric-indent-mode` se encarga de sangrar correctamente el nuevo salto de linea, de estar activado

  ` (describe-function 'newline) `
- Función para arreglar los imports en Python antes de guardar. [Jorge
  Araya Navarro]
- Mueve la definición de los repositorios Elpa a init.el. [Jorge Araya
  Navarro]
- Telephone-line utiliza cara distinta. [Jorge Araya Navarro]
- Utiliza cara personalizada para mostrar entorno virtual Python. [Jorge
  Araya Navarro]
- Elimina modulo. [Jorge Araya Navarro]
- Elimina algunos modulos innecesarios y actualiza otros. [Jorge Araya
  Navarro]
- Remapea los atajos de un comando por otro. [Jorge Araya Navarro]

  Evita que cometa errores en caso de utilizar un atajo diferente al que asigne para el otro comando
- Ajusta la configuración de las plantillas de captura org-mode. [Jorge
  Araya Navarro]

  Elimina plantillas redundantes, cambia la letra de atajo para la bitácora de pendientes (o backlog
  en inglés)
- Ajustes menores para org-mode. [Jorge Araya Navarro]

  Cuando se hace un refile ahora los ítem pueden guardarse a nivel de archivo. Se cambia el nivel de
  profundidad de los archivos `notas.org` y `quizas.org` y se quita el atajo a `org-iswitchb` de C-x
  b. Las notas ahora se hacen al archivo `notas.org` por defecto.

Fix
~~~
- Establece atajo para comando personalizado dentro de org-mode. [Jorge
  Araya Navarro]

  `org-mode-map` no es definido hasta que se ejecuta el bloque `(use-package org)`. Antes se estaba
  definiendo el atajo priori a la evaluación de org-mode.
- Remapea combinación para cambiar buffer a comando personalizado.
  [Jorge Araya Navarro]
- Deshabilita paquetes para Slack y refactoracion de JavaScript. [Jorge
  Araya Navarro]
- Deshabilita gimp-mode. [Jorge Araya Navarro]

  Falla por dependencias sin actualizar
- Evita fallo si nombre de buffer no tiene extensión. [Jorge Araya
  Navarro]
- Desactiva sangrado automatico de aggresive-indent-mode. [Jorge Araya
  Navarro]
- Elimina abuso del comando use-package. [Jorge Araya Navarro]

  Evita que bugs sean introducidos al intentar usar use-package para trozos de codigo elisp que no
  provienen de paquetes
- Utiliza un sistema de notificacion diferente en Windows. [Jorge Araya
  Navarro]

  En Windows no existe D-Bus
- Establece correctamente directorio de plantillas. [Jorge Araya
  Navarro]
- Elimina de Git plantillas de fabrica de YaSnippet. [Jorge Araya
  Navarro]

  Estas son instaladas cuando se instala YaSnippet por lo que es innecesario registrarlas en Git

Other
~~~~~
- Merge branch 'master' of gitlab.com:shackra/emacs. [Jorge Araya
  Navarro]
- Add 1 git-crypt collaborator. [Jorge Araya Navarro]

  New collaborators:

  	39A264EE Jorge Javier Araya Navarro <jorge@esavara.cr>


3.0 (2017-09-26)
----------------

New
~~~
- Instala tern-mode de manera explicita, cambia el mapa de teclas.
  [Jorge Araya Navarro]

  A nivel global M-. estaba fallando debido a la configuración anterior que era incorrecta
- Actualiza preparativos para package.el. [Jorge Araya Navarro]

  https://github.com/s-kostyaev/.emacs.d/blob/5c872864533749879fc7d1008a29fc68833ee04c/init.el#L10
- Añade paquetes para trabajar con Docker. [Jorge Araya Navarro]
- Cambia las opciones de recoleccion de basura. [Jorge Araya Navarro]

  En Windows esto hace que Emacs responda con mayor velocidad a los caracteres que se escriben y
  aparezcan en la pantalla.
- Añade paquetes para editar Angular2. [Jorge Araya Navarro]

  https://afsmnghr.github.io/emacs/angular/
- Formatea los titulos de las tablas sin enlaces o palabras TODO. [Jorge
  Araya Navarro]

  Permite que los titulos de las cabeceras sean más legibles

  https://emacs.stackexchange.com/a/9508/690

Changes
~~~~~~~
- Cambia la definición del hydra para el sangrado en Python. [Jorge
  Araya Navarro]

  Cualquier tecla debería sacarnos del hydra, si la región estuviera activa (`use-region-p` evalúa a
  `t`) necesitabamos desmar la region para evitar que ella fuera reemplazada por la tecla presionada
  para salir.
- Elimina redundancia. [Jorge Araya Navarro]
- Muestra el titulo de los nuevos correos entrantes. [Jorge Araya
  Navarro]
- Normaliza la configuración de python-mode. [Jorge Araya Navarro]
- Normaliza la configuración para editar LaTeX. [Jorge Araya Navarro]
- No utiliza use-package para paquetes que no proveen `provide` [Jorge
  Araya Navarro]

  use-package no funcionaba correctamente, si el paquete no tiene `(provide 'foo)` entonces no vale la
  pena usar el macro use-package
- Cambia el icono para cambios no registrados en VC. [Jorge Araya
  Navarro]

  El icono de "buffer modificado" era exactamente igual
- Actualiza el icono de Git en el modeline. [Jorge Araya Navarro]

  Parecía no estar centrado, lo cual me estaba irritando
- Cambia el idioma del aviso en configuracion.el. [Jorge Araya Navarro]
- Actualiza la versión de secretaria.el. [Jorge Araya Navarro]
- Deshabilita golden-ratio. [Jorge Araya Navarro]
- Mueve variable fuera de custom.el. [Jorge Araya Navarro]

  `bmkp-last-as-first-bookmark-file` por alguna razon siempre esta cambiando.
- Utiliza :if en lugar de :disabled. [Jorge Araya Navarro]

  :disabled en use-package ignora el valor que tiene a la derecha

  https://github.com/jwiegley/use-package/issues/387
  https://github.com/jwiegley/use-package/issues/496#issuecomment-330006149
- Cambio a `add-to-list` [Jorge Araya Navarro]

  Evita duplicacion de elementos en la lista de la variable ivy-ignore-buffers
- Elimina snippets. [Jorge Araya Navarro]
- Cambia `:if` a `:disabled` [Jorge Araya Navarro]

  Evita que secciones de configuracion sean activadas del todo
- Ajusta la configuración para editar JavaScript. [Jorge Araya Navarro]

  https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
  https://emacs.cafe/emacs/javascript/setup/2017/05/09/emacs-setup-javascript-2.html
- Deshabilita prodigy. [Jorge Araya Navarro]

  imapnotify esta siendo ejecutado desde systemd

Fix
~~~
- Arregla el verdadero nombre del paquete auto-revert-mode. [Jorge Araya
  Navarro]
- Evita que el byte-compiler dé errores. [Jorge Araya Navarro]

  Estos dos paquetes son "ficticios", sus archivos no existen y no pueden ser leidos por el byte-compiler
- Evita entrada duplicada ingrese en org-capture-template. [Jorge Araya
  Navarro]

  org-projectile se configura diferente desde las nuevas versiones.


2.4.1 (2017-08-27)
------------------

New
~~~
- Agrega mu4e-alert. [Jorge Araya Navarro]

  Notificación de nuevo email, gracias a goimapnotify
- Añade kotlin-mode. [Jorge Araya Navarro]
- Cambia python-imapnotify por goimapnotify. [Jorge Araya Navarro]

  https://gitlab.com/shackra/goimapnotify
  https://github.com/a-sk/python-imapnotify/
- Añade macro de teclado que desenreda sentencias use-package. [Jorge
  Araya Navarro]

Changes
~~~~~~~
- Desenreda sentencias use-package. [Jorge Araya Navarro]

  La configuración es más fácil de leer pues no hay sentencias use-package anidadas


2.4.0 (2017-08-16)
------------------

New
~~~
- Añade paquete chronos. [Jorge Araya Navarro]

  Necesito un cronometro para medir el tiempo de ciertas actividades (como al cocinar)
- Mejora las sugerencias para corrección ortográfica. [Jorge Araya
  Navarro]

  Palabras escritas en TipadoDeCamello aparecían en las sugerencias lo que dificulta la corrección
  ortográfica en inglés.
- Añade snippet para usar en mi currículum. [Jorge Araya Navarro]
- Gherkin-mode para editar escenarios en BDD. [Jorge Araya Navarro]
- Reemplaza la plantilla de Git por defecto con un snippet. [Jorge Araya
  Navarro]

  Agiliza el flujo de trabajo con Git dentro de Emacs usando Magit
- Actualiza el modulo schrute-mode. [Jorge Araya Navarro]

Changes
~~~~~~~
- Ajustes en la configuración de python-mode. [Jorge Araya Navarro]
- Cambia el icono de Git en el mode-line. [Jorge Araya Navarro]

  El icono por default era muy feo
- Desactiva el gancho que modifica el buffer COMMIT_EDITMSG. [Jorge
  Araya Navarro]

  El flujo de trabajo no es ideal, no funciona bien con `commit --amend`
- Remueve codigo y actualiza mi correo electronico. [Jorge Araya
  Navarro]

  org-trello estaba dando fallos por su definición de variables en custom.el, además, he cambiado de
  email
- Actualiza configuración de org-mode. [Jorge Araya Navarro]

  Mejora el "agenda views" de org-mode para mostrar tareas programadas para el día de hoy, la semana o
  el mes. Por defecto las anotaciones se harán en el archivo diario.org. Al ingresar una nueva tarea
  "Fechas" se hace bajo una entrada llamada "Fechas" dentro de "cosas por hacer.org" para facilitar la
  búsqueda de tareas para el día en orgzly.

  https://emacs.stackexchange.com/questions/15309/is-there-a-way-to-show-an-agenda-with-just-a-time-grid
  https://emacs.stackexchange.com/questions/29831/hide-scheduled-items-in-org-agenda-until-they-are-past-their-scheduled-date-and
- Email es descargado con imapnotify. [Jorge Araya Navarro]
- Elimina el retraso para cargar expand-region. [Jorge Araya Navarro]
- Funciones shackra/super-* ahora son `(interactive)` [Jorge Araya
  Navarro]

  Esto evita problemas con schrute-mode
- Modifica la configuración de Schrute-mode. [Jorge Araya Navarro]
- Refactoriza Python y Flycheck. [Jorge Araya Navarro]
- Elimina hydras de hydra-mc Estos hydras eran innecesarios pues los
  comandos asociados a ellos no se repetirán más de una vez. [Jorge
  Araya Navarro]
- Cambia el alto del mode-line. [Jorge Araya Navarro]
- Añade indium para Javascript. [Jorge Araya Navarro]
- Mueve cambio en variable a :config. [Jorge Araya Navarro]

Fix
~~~
- Activa `anaconda-mode` al iniciar `python-mode` [Jorge Araya Navarro]

  Por alguna estupida razón anaconda no estaba configurado para iniciar cuando se editan archivos Python
- Actualiza configuración de `org-webpage` y `org-projectile` [Jorge
  Araya Navarro]

  `org-webpage` tenia fallos de dependencias. `org-projectile` había cambiado el nombre de varios de
  sus funciones
- Evita que los paquetes sean inicializados automáticamente. [Jorge
  Araya Navarro]

  Algunos paquetes aparecían como no disponibles a pesar de figurar en el `load-path`
- Arregla la configuración de mensajes para commits. [Jorge Araya
  Navarro]

  Yasnippets estaba causando un fallo que no permitía finalizar la configuración del buffer para los
  mensajes de commit en commits de Git
- Quita la canonización de nombres en mu4e. [Jorge Araya Navarro]

  Los cambios anteriores hacen que el autocompletado para el campo "To:" no funcione
- Actualiza definición de fragmentos para telephone-line. [Jorge Araya
  Navarro]
- Org no rompe las lineas en títulos o elementos con M-RET. [Jorge Araya
  Navarro]
- Corrige los atajos para iedit-mode. [Jorge Araya Navarro]
- Agrega paquetes y cambia atajos para python-mode. [Jorge Araya
  Navarro]

  Se re-habilita TRAAD, se incluye una utilidad que agrega platillas de documentación de Sphinx a
  funciones y clases, se modifica la hydra hydra-py para sangrar bloques de código Python. También
  se desactiva el sangrado agresivo con `aggressive-indent-mode`. Finalmente se asocian atajos del
  teclado con funciones de anaconda-mode.
- Resuelve varios problemas de dependencias entre paquetes. [Jorge Araya
  Navarro]
- Corrige error para cambiar de buffer con C-u mi/switch-buffer. [Jorge
  Araya Navarro]
- Añade .tar.7z a la lista de formatos para compresión. [Jorge Araya
  Navarro]

Other
~~~~~
- Desactiva `schrute-mode` y demanda `undo-tree` [Jorge Araya Navarro]
- Schrute-mode como modulo del repositorio. [Jorge Araya Navarro]
- Corrige error lógico para activación del paquete emojify. [Jorge Araya
  Navarro]
- Actualiza la lista de paquetes instalados. [Jorge Araya Navarro]
- Añade webpaste Utilidad para pegar contenido a pastebin sin salir de
  Emacs. [Jorge Araya Navarro]
- Reemplaza visual-regexp por PCRE2EL Quiero usar la sintaxis pcre en
  Emacs sin tener que añadir nuevos comandos y reemplazar atajos de
  teclado. [Jorge Araya Navarro]
- Dired: Añade atajos de teclado para compara y comprimir archivos.
  [Jorge Araya Navarro]
- Refactoriza configuración de prog-mode. [Jorge Araya Navarro]
- Apaga auto-fill-mode en modos mayores basados en text-mode. [Jorge
  Araya Navarro]
- Hace que Schrute-mode se active a dos repeticiones (1+ la siguiente)
  [Jorge Araya Navarro]
- Extiende la lista de paquetes instalados manualmente. [Jorge Araya
  Navarro]
- Agrega Yasnippet a la lista de backends de Company Esto sucede siempre
  que Emacs ha finalizado su inicio. [Jorge Araya Navarro]
- Activa highlight-indent-guides sólo para python-mode. [Jorge Araya
  Navarro]
- Agrega paquete golden-ratio-scroll-screen. [Jorge Araya Navarro]
- Elimina llamada a auto-fill. [Jorge Araya Navarro]
- Refactoriza la configuración de JS2 y Stylus-mode. [Jorge Araya
  Navarro]
- Deshabilita `gotype` de la configuración para Gometalinter. [Jorge
  Araya Navarro]
- Refactoriza configuración de LaTeX, web-mode, TRAAD, Rust y PHP-mode.
  [Jorge Araya Navarro]
- Refactoriza configuración de org-mode. [Jorge Araya Navarro]
- Agrega paquete iedit. [Jorge Araya Navarro]
- Refactoriza interfaz para imenu a ivy, desenreda imenu+ [Jorge Araya
  Navarro]
- Agrega buffers de Weechat a la lista para matar. [Jorge Araya Navarro]
- Separa configuración relaciona a Git de Magit. [Jorge Araya Navarro]
- Refactoriza interfaz de projectile a ivy Helm no se usará más, es
  innecesario preservar las sentencias condicionales relacionadas a
  Helm. [Jorge Araya Navarro]
- Refactoriza configuración relacionada a Company. [Jorge Araya Navarro]
- Actualiza el comando para visitar archivos y cambiar buffers El uso de
  Hydra fue un total fracaso pues no es tan intuitivo como yo pensaba.
  [Jorge Araya Navarro]
- Añade nuevos paquetes a la lista de paquetes seleccionados. [Jorge
  Araya Navarro]
- Reduce a 2 las repeticiones para activar comando alternativos schrute-
  mode es más efectivo si se reducen las repeticiones de 2 a 3 para
  activar comandos alternativos. [Jorge Araya Navarro]
- Estiliza la configuración de Go y añade gometalinter `use-package`
  admite otras formas de definición de jerarquías entre paquetes de
  Emacs. Usar `:after` en lugar de anidar sentencias `use-package`
  dentro de otras hace que la configuración sea más legible. [Jorge
  Araya Navarro]
- Deshabilita ciertos comportamientos en Emacs No guarda archivos al
  perder Emacs el foco. undo-tree no guarda una copia del historial de
  cambios a un archivo, todo debido a un error. https://redd.it/5pa5jb.
  [Jorge Araya Navarro]
- Corrige pequeños detalles en el archivo org. [Jorge Araya Navarro]


2.2.4 (2017-01-08)
------------------
- Actualiza la configuración Necesitaba comentar los atajos de teclado y
  remover fragmentos de la configuración obsoletos. [Jorge Araya
  Navarro]
- Guarda cambios en archivos cuando Emacs pierde el foco. [Jorge Araya
  Navarro]
- Cambia la introducción. [Jorge Araya Navarro]
- Quita fragmentos inservibles. [Jorge Araya Navarro]
- Ignora archivos comprimidos de undo-tree. [Jorge Araya Navarro]
- Nuevos cambios menores. [Jorge Araya Navarro]
- Mejora la lógica de salto de ventanas El código anterior era estúpido,
  además, ace-window ya manejaba lo que yo trataba de hacer
  anteriormente. [Jorge Araya Navarro]
- Habilita programación para Typescript. [Jorge Araya Navarro]
- Actualiza lista de paquetes instalados explicitamente. [Jorge Araya
  Navarro]
- Instala paquete para controlar Chrome en Emacs Para desarrollo web en
  Chrome desde Emacs. [Jorge Araya Navarro]
- Arregla función en gancho after-save-hook con comprobación de puerto
  mozcontroller fallaba si Firefox no estaba corriendo y MozController
  no tenia el puerto 4242 abierto, lo cual hacia engorroso el proceso de
  desarrollo mostrando buffers de error en Emacs. Comprobamos si el
  puerto esta abierto con una nueva función. [Jorge Araya Navarro]
- Actualiza paquetes instalados explícitamente. activación de comandos.
  [Jorge Araya Navarro]
- Refrescara Firefox cuando un buffer es guardado Agiliza la
  visualización de cambios desde Firefox/Iceweasel en la pagina web o
  plantilla que se esta trabajando sin necesidad de dejar Emacs gracias
  a moz-controller. [Jorge Araya Navarro]
- Actualiza configuración de Schrute y Mu4e. [Jorge Araya Navarro]
- Activa schrute-mode Necesito agilizar mi uso de Emacs mientras me
  deshago de mis malos hábitos. Hice este paquete para ello y creo que
  ya es hora de activarlo en mi configuración. [Jorge Araya Navarro]
- Org-mu4e reparado. [Jorge Araya Navarro]
- Arreglo menor con activación de tipografía. [Jorge Araya Navarro]

  También se bajo el nivel de seguridad SSL de 'paranoid a 'high.
- Función para visitar una noticia dentro de elfeed con eww. [Jorge
  Araya Navarro]
- Modificando configuración para Weechat. [Jorge Araya Navarro]
- Arreglos y actualizaciones menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Ajuste en undo-tree y descubrimiento de Proced. [Jorge Araya Navarro]
- Re-activando nlinum luego de mucho tiempo. [Jorge Araya Navarro]


2.2.3 (2016-10-02)
------------------
- Paquetes extras. [Jorge Araya Navarro]

  * move-text
  * company-statistics


2.2.2 (2016-09-29)
------------------
- Haciendo más veloz el enredado de bloques de código elisp. [Jorge
  Araya Navarro]


2.2.1 (2016-09-28)
------------------
- Projectile y Magit. [Jorge Araya Navarro]

  Dada la integración de Projectile y Magit, se elimina el binding F12 y
  se usara C-c p v para ejecutar Magit-status.
- Migrando enredado de bloques de código. [Jorge Araya Navarro]

  Gracias a Holger Schurig https://bitbucket.org/holgerschurig/emacsconf

  El bug donde isearch-* se ataba a la combinación C-s/C-r en lugar de
  Swiper, era provocado por better-defaults, iniciando better-defaults
  antes de Swiper arregla el problema.


2.2 (2016-09-28)
----------------
- Shackra/other-window toma en cuenta golden-ratio. [Jorge Araya
  Navarro]

  Desactiva el modo menor y balancea las ventanas antes de llamar a
  `ace-window`.

  También se borró la comprobación de edades en los archivos
  configuracion.(el|org) para eliminar un bug que evita que Emacs evalué
  completamente configuracion.el.
- Cambiando el cursor de ventana como un pro. [Jorge Araya Navarro]


2.1 (2016-09-26)
----------------
- Swiper ahora si es fijado a C-s. [Jorge Araya Navarro]

  Todos los bindings de Swiper ahora son fijados por Emacs. Parece que el
  problema era que no estaba leyendo la configuración completa.
- Moviendo llamadas anidadas de use-package a :config. [Jorge Araya
  Navarro]
- Usando Bootstrap 4 para la plantilla del blog. [Jorge Araya Navarro]
- Eliminando buffers virtuales de Ivy. [Jorge Araya Navarro]
- Ajustes menores. [Jorge Araya Navarro]


2.0 (2016-09-17)
----------------
- Corrección menor, gracias a Daviel Bordak. [Jorge Araya Navarro]
- Mode-line más informativo, mejores hydra-mc-* [Jorge Araya Navarro]
- Engordando las nalgas del mode-line, toma 2. [Jorge Araya Navarro]
- Revert "Engordando las nalgas de mi mode-line ( ͡° ͜ʖ ͡°)" [Jorge
  Araya Navarro]

  This reverts commit b4a617942b6d9f57bc3ab76117a812c4d2161187.
- Engordando las nalgas de mi mode-line ( ͡° ͜ʖ ͡°) [Jorge Araya
  Navarro]
- Correcciones menores. [Jorge Araya Navarro]
- Migración de Helm a ivy. [Jorge Araya Navarro]
- Función `el-pocket-add-url-at-point` [Jorge Araya Navarro]
- El-pocket para añadir más fácilmente urls a Pocket. [Jorge Araya
  Navarro]


1.8.7 (2016-08-21)
------------------
- Integrando Go Guru a Emacs. [Jorge Araya Navarro]
- Tema cambiado a Zenburn. [Jorge Araya Navarro]


1.8.6 (2016-08-13)
------------------
- Ajuste en la plantilla descargas.mustache. [Jorge Araya Navarro]
- Ignorando carpeta emojis. [Jorge Araya Navarro]
- Modificando archivo léame y la configuración. [Jorge Araya Navarro]

  Cada modo mayor que usa company para auto-completado ahora hace la
  variable `company-backends` local al buffer para su modificación.
- Cambios menores. [Jorge Araya Navarro]
- Nunca preguntar al ejecutar código elisp. [Jorge Araya Navarro]
- Mejoras en tema del blog. [Jorge Araya Navarro]
- Etiqueta para marcar secciones desactivadas. [Jorge Araya Navarro]
- Actualizando comando de compilación para Go. [Jorge Araya Navarro]


1.8.5 (2016-07-23)
------------------
- Circe y Shackle. [Jorge Araya Navarro]
- Arreglando nombre erróneo de archivo. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Actualizacion de submodulo font-man. [Jorge Araya Navarro]
- Adición de mi propio paquete Font-man. [Jorge Araya Navarro]
- `web-mode` es el modo mayor para editar html y plantillas html. [Jorge
  Araya Navarro]
- Una hydra de multiple-cursors debe ser azul. [Jorge Araya Navarro]
- Agregando SLIME. [Jorge Araya Navarro]

  Estoy leyendo Land Of Lisp, entonces me gustaría realizar todos los
  ejercicios del libro dentro de Emacs en lugar de la terminal.
- Org-refile varios archivos y plantilla para Elisp. [Jorge Araya
  Navarro]
- Material-light como tema de día. [Jorge Araya Navarro]

  Color del titulo de los documentos org-mode corregido para mejorar visibilidad
- Tema claro para usar durante el día. [Jorge Araya Navarro]
- Nuevo paquete git-gutter-fringe. [Jorge Araya Navarro]
- Mejora en hydra-win. [Jorge Araya Navarro]

  - Cambio de teclas asociadas a comandos para mover el cursor o cambiar
    las dimensiones de ventana.
  - División de ventanas con 2 (horizontal) y 3 (vertical).
  - Borrado de espacios en blanco al final de las lineas en todo el
    archivo.


1.8.4 (2016-06-20)
------------------
- De 5 a 4 columnas para mejor visibilidad. [Jorge Araya Navarro]
- Arreglo menor. [Jorge Araya Navarro]
- Refactorizaciones y nuevas extensiones. [Jorge Araya Navarro]

  - Hydras para multiple-cursors refactorizados.
  - Nuevos bindings para vimish-folds.
  - org-projectile para anotar lista de tareas pendientes por proyectos.
  - correcciones menores para `bind-keys` en multiple-cursors y
    vimish-fold.
  - UI para MPD, Mingus.


1.8.3 (2016-06-18)
------------------
- Arreglos en función para actualizar un paquete. [Jorge Araya Navarro]

  Gracias a nispio por su ayuda http://emacs.stackexchange.com/a/24038/690
- Corrección gramatical y borrado de "TODO" [Jorge Araya Navarro]


1.8.2 (2016-06-16)
------------------
- Función para actualizar paquetes. [Jorge Araya Navarro]

  Siempre que exista una nueva versión de un paquete
  `SHACKRA/UPDATE-ONE-PACKAGE` instala la nueva actualización y borra la
  versión antigua.
- Feeds para elfeed. [Jorge Araya Navarro]
- Lector RSS. [Jorge Araya Navarro]
- Soporte para desarrollar app para Android. [Jorge Araya Navarro]


1.8.1 (2016-06-09)
------------------
- `goimports` para formatear código Go. [Jorge Araya Navarro]
- Merge branch 'master' of bitbucket.org:shackra/.emacs.d. [Jorge Araya
  Navarro]
- Reparando python-mode. [Jorge Araya Navarro]


1.8 (2016-05-31)
----------------
- Reparando python-mode. [Jorge Araya Navarro]
- Quitando definición de variables de entorno. [Jorge Araya Navarro]
- Usar Monoisome como tipografía. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Mejoras menores. [Jorge Araya Navarro]
- Elisp para hacer Emacsclient un git mergetool. [Jorge Araya Navarro]
- Pequeños ajustes. [Jorge Araya Navarro]


1.7.5 (2016-05-10)
------------------
- Escondiendo undo-tree del mode-line. [Jorge Araya Navarro]
- Varios ajustes. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]

  Activar golden-ratio de manera automática
- Nuevos paquetes útiles. [Jorge Araya Navarro]

  Se instalan AURel y golden-ratio
- Mejoras en la Hydra para multiple-cursors. [Jorge Araya Navarro]
- Duh. [Jorge Araya Navarro]
- Cambio menor. [Jorge Araya Navarro]
- Mejoras para pony-mode. [Jorge Araya Navarro]
- Activando `skewer` cuando `web-mode` se activa. [Jorge Araya Navarro]

  web-mode no hereda los ganchos asignados a sgml-mode.
- Nuevo nombre de buffer para kill-or-bury-alive. [Jorge Araya Navarro]


1.7.4 (2016-04-09)
------------------
- Ajustes en el mode-line y cambio de tema de día. [Jorge Araya Navarro]
- Mostrar borradores. [Jorge Araya Navarro]
- Ajustes en mu4e. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]


1.7.3 (2016-03-20)
------------------
- Mejor definición para comando `compile` en go-mode. [Jorge Araya
  Navarro]

  El comando para `compile` se establece de manera inteligente según el
  contenido del archivo `.go`, el programa escrito en Golang será
  ejecutado por compile siempre y cuando al principio del archivo exista
  la cadena `package main`.
- Eliminando GitFlow y modificando Golang. [Jorge Araya Navarro]
- Merge branch 'develop' [Jorge Araya Navarro]
- Merge tag '1.7.2' into develop. [Jorge Araya Navarro]

  Tomando en serio la edición de código Lisp
- Ox-reveal. [Jorge Araya Navarro]


1.7.2 (2016-03-05)
------------------
- Merge branch 'release/1.7.2' [Jorge Araya Navarro]
- ParEdit y Multiple-cursors con Hydra. [Jorge Araya Navarro]
- Merge tag '1.7.1' into develop. [Jorge Araya Navarro]

  Cambios menores


1.7.1 (2016-03-05)
------------------
- Merge branch 'release/1.7.1' [Jorge Araya Navarro]
- Cambios menores en mu4e. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Añadiendo js2-mode y otros juguetes. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.7' [Jorge Araya Navarro]
- Golang y Bookmark+ [Jorge Araya Navarro]

  extensiones para programar Golang en Emacs. Marcadores con Bookmark+,
  una hydra fue creada para hacer más practico el uso de Bookmark+
- Merge branch 'arreglo-1.6.2' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.6.1' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.6.2' [Jorge Araya Navarro]
- La función devuelve el valor correcto. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.6.1' [Jorge Araya Navarro]
- Actualizando secretaria. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.6' [Jorge Araya Navarro]
- Fixes bug #5. [Jorge Araya Navarro]

  Con esto no debería existir más problemas en Mac OS u otros sistemas que
  no definan la variable de entorno $LANG
- Usando ultima versión de mi paquete Secretaria.el. [Jorge Araya
  Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.3' into develop. [Jorge Araya Navarro]
- Uso correcto del commando Yasnippet. [Jorge Araya Navarro]
- Añadiendo mi propio paquete, pero como desactivado. [Jorge Araya
  Navarro]
- Agregando mi paquete `secretaria` [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.2' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.1' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.3' [Jorge Araya Navarro]
- Mejoras para org y helm. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.2' [Jorge Araya Navarro]
- LaTeX en MacOS desde Emacs y otras mejoras. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.5.1' [Jorge Araya Navarro]
- Arreglos para MacOS y diseño paginas web. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.5' [Jorge Araya Navarro]
- Activación de imenu. Actualización para mu4e. [Jorge Araya Navarro]

  Además, nueva plantilla de captura para org-mode donde se agrega un
  enlace guardado con `C-c C-l` al cuerpo del texto de la tarea.
- Actualizando configuración mu4e. [Jorge Araya Navarro]

  Las credenciales ahora son cargadas por medio del paquete `secreto`
  aprovechando la nueva característica `mu4e-context` que trae la ultima
  versión de mu.
- Eliminando el paquete profile. [Jorge Araya Navarro]
- Añadiendo un paquete elisp de mi propia cosecha. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.4.1' into develop. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.4' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-1.4.1' [Jorge Araya Navarro]
- Arreglo en comprobación de existencia de fuentes. [Jorge Araya
  Navarro]

  Usando un algoritmo que no falla cuando Emacs corre como demonio
- Merge branch 'publicacion-1.4' [Jorge Araya Navarro]
- Comprobando existencia de tipografías antes de uso. [Jorge Araya
  Navarro]
- Actualizado el archivo léame. [Jorge Araya Navarro]
- GNU ELPA especificado por default. [Jorge Araya Navarro]
- Quitando submodulo EGO. [Jorge Araya Navarro]
- Desactivando sensitive. [Jorge Araya Navarro]
- Remediando nuevo comportamiento de Helm. [Jorge Araya Navarro]

  Aun queda cambiar todos los comandos `find-*`
- Trozo de texto plantilla para latex-mode. [Jorge Araya Navarro]
- Cambios menores twittering-mode. [Jorge Araya Navarro]

  Gracias a Aaron Harris ( http://emacs.stackexchange.com/a/19086/690 )
  Ahora puedo hacer que mi comando `shackra/tt-fav-rett` no necesite
  confirmación de mi parte para retweetear y marcar como favorito algún tweet
- Merge branch 'arreglo-python-keybinding-traad' into develop. [Jorge
  Araya Navarro]
- Merge branch 'arreglo-provide-traad-globalrevert' into develop. [Jorge
  Araya Navarro]
- Merge branch 'develop' of bitbucket.org:shackra/.emacs.d into develop.
  [Jorge Araya Navarro]
- Merge branch 'publicacion-1.3' into develop. [Jorge Araya Navarro]
- Merge branch 'arreglo-python-keybinding-traad' [Jorge Araya Navarro]
- Hydra-traad sólo para Python-mode. [Jorge Araya Navarro]
- Merge branch 'arreglo-provide-traad-globalrevert' [Jorge Araya
  Navarro]
- Arreglos importantes. [Jorge Araya Navarro]

  Sentencias elisp que faltaban fueron agregadas para que `use-package` no
  fallara al cargar auto-revert-mode y traad-projectile. Se borró una
  doble declaración de la variable `mu4e-update-interval` que me estaba
  trolleando.
- Merge branch 'publicacion-1.3' [Jorge Araya Navarro]
- Hydra para Traad. [Jorge Araya Navarro]

  También mu4e se inicia de manera automática en el fondo
- Restauración de ventanas al entrar a mu4e. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.2' [Jorge Araya Navarro]
- Traad: refactorización de código Python con rope. [Jorge Araya
  Navarro]

  Referencias a ropemacs fueron borradas de la configuración. YASnippet
  ahora se inicia per buffer. `M-y` es el atajo de teclado para
  `helm-show-kill-ring`. Las secuencias de escape dentro de cadenas de
  texto tienen un color más vistoso. `global-auto-revert-mode` es
  encendido de manera automática.
- Arreglos en el tema del blog. [Jorge Araya Navarro]
- Usando un nombre menos problematico. [Jorge Araya Navarro]
- Corrección menor. [Jorge Araya Navarro]
- Plantillas del blog modificadas. [Jorge Araya Navarro]
- Mustache-mode instalado. [Jorge Araya Navarro]
- Org-webpage reemplaza a EGO. [Jorge Araya Navarro]
- Mejoras en shackra/ispell-switch. [Jorge Araya Navarro]
- Funcionalidad implementada. [Jorge Araya Navarro]
- Merge branch 'arreglo-helm-projectile' into develop. [Jorge Araya
  Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores en twittering-mode. [Jorge Araya Navarro]
- Arreglo menor. [Jorge Araya Navarro]
- Merge branch 'caracteristica-rust' into develop. [Jorge Araya Navarro]
- Kill-or-bury-alive mata buffers con rust-mode. [Jorge Araya Navarro]

  No pareciera estar heredando del modo mayor `prog-mode` por lo que se
  tuvo que especificar explícitamente en
  `kill-or-bury-alive-must-die-list` para que los buffers que visitan
  archivos rust sean cerrados al presionar C-x k.

  Enlaces abreviados para el sitio de torrents Kickass Torrent definidos,
  ahora un enlace para buscar una película en KAT es tan simple como
  escribir `[[katpelicula:Inside Out][Buscar la pelicula Inside Out en
  KAT]]`, entre otros cambios menores.
- Agregando soporte para Rust. [Jorge Araya Navarro]

  Y cambios convenientes para org-mode
- Arreglo en appt y adición de Sese. [Jorge Araya Navarro]

  La función usada para avisar de citas fue arreglado, ahora appt no
  tendrá problemas de funcionamiento.

  Simple Emacs-based Subtitle Editor fue agregado.
- Restaurando el tamaño para Symbola. [Jorge Araya Navarro]

  Algunos caracteres que se renderizan con la tipografía Symbola puede que
  se vean muy pequeños. Su tamaño ha sido aumentado para corregir este
  posible defecto.
- Cambios en la configuración de kill-or-bury-alive. [Jorge Araya
  Navarro]

  Todos los buffers de modos mayores de programación y edición de texto
  son matados gracias a los cambios en el código del paquete
  kill-or-bury-alive.
- Merge branch 'caracteristica-python3' into develop. [Jorge Araya
  Navarro]
- Requiriendo `visual-regexp-steroids` [Jorge Araya Navarro]

  Por alguna extraña razón hay que usar `require` con
  `visual-regexp-steroids` porque de otra manera no se activan las
  funcionalidades proporcionadas por el paquete.
- Documentación con eldoc-mode. [Jorge Araya Navarro]

  eldoc-mode es activado en python-mode para mostrar la firma de las
  funciones u otra documentación. Desactivado `:tangle` para un bloque de
  codigo elisp en la configuración.
- Corrección menor. [Jorge Araya Navarro]
- Merge branch 'arreglo-helm-projectile' [Jorge Araya Navarro]
- `helm-projectile` incluido en la configuración. [Jorge Araya Navarro]

  Por alguna extraña razón estaba esperando que
  `helm-projectile-find-file` funcionara adecuadamente sin tener el
  paquete `helm-projectile` instalado
- Merge branch 'publicacion-1.1' [Jorge Araya Navarro]
- Arreglo de las notificaciones de la agenda. [Jorge Araya Navarro]
- Cambiando de tipografía (Monoid) [Jorge Araya Navarro]
- Verificación correcta de certificados SSL. [Jorge Araya Navarro]
- Arreglos menores para multi-term. [Jorge Araya Navarro]
- Mejoras en multi-term para ser más productivo. [Jorge Araya Navarro]
- Nuevos paquetes añadidos. [Jorge Araya Navarro]

  `systemd` para editar archivos .service de systemd y
  `kill-or-bury-alive` para matar esos molestos buffers o enterrarlos
  según se necesite
- Pequeños cambios en hydra-win. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Habilitando winner-mode. [Jorge Araya Navarro]
- Arreglo rápido. [Jorge Araya Navarro]
- Merge branch 'caracteristica-seguridad' into develop. [Jorge Araya
  Navarro]
- SSL correctamente configurado, AFAIK. [Jorge Araya Navarro]

  fixes #4

  Sin embargo, las peticiones a sitios web que tienen certificados auto
  firmados **no** fallan como se (supone?) falló con los certificados para
  el sitio web equivocado.
- Configurado. [Jorge Araya Navarro]

  Sin embargo, según las pruebas algo no se hizo bien. Una pregunta en
  Stackexchange de Emacs fue abierta para recibir asistencia
  http://emacs.stackexchange.com/q/18079/690
- Eliminando archivo innecesario. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.0' into develop. [Jorge Araya Navarro]
- Merge branch 'publicacion-1.0' [Jorge Araya Navarro]

  Mi primer versión "estable" de mi configuración de Emacs \o/
- Aumentando el nivel del índice de contenido. [Jorge Araya Navarro]
- Re-organización del archivo de configuración. [Jorge Araya Navarro]
- Merge branch 'publicacion-master' [Jorge Araya Navarro]
- Arreglos rápidos y desactivación de Jabber.el. [Jorge Araya Navarro]
- Más modos mayores y menores. [Jorge Araya Navarro]

  comentada la linea en Jabber.el referente a la variable `fsm-debug` para
  diagnosticar lo que este evitando que Jabber.el cargue de manera correcta.
- Cambios menores en org-capture. [Jorge Araya Navarro]
- Código Python y shell ejecutable en org-babel. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Alias para tumblesocks y twittering-mode. [Jorge Araya Navarro]
- Twittering-mode - Twitter. Tumblesocks - Tumblr. [Jorge Araya Navarro]

  Redes sociales desde Emacs
- Cambios en las plantillas para org-capture. [Jorge Araya Navarro]
- Actualizando el código de EGO. [Jorge Araya Navarro]
- Migrando de org-page a EGO. [Jorge Araya Navarro]
- Generar estatico de sitios web agregado. [Jorge Araya Navarro]
- Correcciones para dired. [Jorge Araya Navarro]

  Los directorios son agrupados en la parte de arriba del buffer.
- Mejoras para dired-mode. [Jorge Araya Navarro]
- Hydra para avy. vimish-fold agregado. [Jorge Araya Navarro]
- Cambios en hydra-win y correcciones menores. [Jorge Araya Navarro]

  el hydra para dividir y moverse entre ventanas ahora usa las teclas WASD
  e IJKL para re-dimensionar las ventanas y cambiar el foco de
  ventana (respectivamente).

  El problema de la macro `use-package` que no ataba la combinación de
  teclas C-M-, con el comando `comment-dwim` para Python-mode debería
  estar resuelto ahora usando la función `(bind-key)`.
- Ycmd. [Jorge Araya Navarro]
- Modo para editar archivos PKGBUILD añadido. [Jorge Araya Navarro]
- Ignorando otros buffers (magit y anaconda) [Jorge Araya Navarro]
- Varios paquetes extras para Git. [Jorge Araya Navarro]

  Ya que voy a estar trabajando en grupo en
  https://github.com/Team-VerseBot pienso que es hora de ponerme serio con
  algunos paquetes que extienden magit.

  También he incluido algunos paquetes para Mercurial, como hgignore-mode
  que es un modo mayor para editar archivos .hgignore.
- Hydra-win se ejecuta luego de dividir ventanas. [Jorge Araya Navarro]
- Migrando de Jedi a Anaconda. [Jorge Araya Navarro]

  Jedi comenzó a dar problemas porque no abría su propio proceso inferior
  de Python con el cual se supone que debe sacar los candidatos para el auto-completado.
- Corrigiendo error de logica. [Jorge Araya Navarro]
- Mejoras en multi-term y migración de Pymacs. [Jorge Araya Navarro]
- Desapareciendo projectile del mode-line. [Jorge Araya Navarro]
- I-search es reemplazado por swiper. [Jorge Araya Navarro]

  ¡Zorro, no te lo lleves!
- Implementando el uso de hydra. [Jorge Araya Navarro]

  Haciendo combinaciones de teclas fáciles de repetir usando hydra, hay un
  hydra para `multiple-cursors`, otro para `python-mode` (para el
  sangrado de bloques de código) y otro para manejar ventanas dentro
  de un marco de Emacs (para ver un demo grabado por el creador de hydra,
  ir a https://youtu.be/_qZliI1BKzI ).
- FlyCheck estaba colado en custom.el. [Jorge Araya Navarro]
- Actualizando el archivo léame. [Jorge Araya Navarro]
- Varias migraciones importantes. [Jorge Araya Navarro]

  Creo que a partir de aquí podemos fusionar con la rama master y usar
  esta configuración. Otras cosas que quizás yo necesite las puedo agregar
  después
- Problema con text-mode arreglado. [Jorge Araya Navarro]
- Migrado telephone-line y sane defaults. [Jorge Araya Navarro]
- Jedi y company{-jedi} migrado. [Jorge Araya Navarro]
- Migrado org-mode y visual-fill-column. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Varias secciones migradas, incluyendo helm. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Otro paquete borrado. [Jorge Araya Navarro]
- Eliminando un paquete. [Jorge Araya Navarro]
- Correcciones menores. [Jorge Araya Navarro]
- Fragmento faltante en telephone-line. [Jorge Araya Navarro]

  Ahora los modos menores se muestran en el mode-line
- Modificado el mode-line de telephone-line. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Agrengando telephone-line, pero desactivado. [Jorge Araya Navarro]
- Cambiando la shell para multi-term. [Jorge Araya Navarro]
- Borrando CEDET, agregando profile como submodulo. [Jorge Araya
  Navarro]
- Agregando `shrink-whitespace` [Jorge Araya Navarro]
- Secciones recuperadas de la configuración. [Jorge Araya Navarro]

  Por alguna extraña razón, estaban borradas algunas partes de la
  configuración, quizás se perdieron cuando cambiaba la jerarquía de los
  títulos en el archivo de configuración.

  La configuración esta un poco más documentada y limpia. Todo esta bien,
  por el momento.
- Modificando los caracteres del mode-line. [Jorge Araya Navarro]

  También he realizado algo de limpieza, algunos fragmentos de código
  fueron movidos a otros sitios. Aunque aun falta modificar/aumentar la
  documentación en algunas áreas (donde haga falta, claro)
- Eliminando discover-my-majors. [Jorge Araya Navarro]

  Eso ya esta cubierto por helm-descbinds (C-h b)
- Agregando más paquetes útiles y cambios menores. [Jorge Araya Navarro]
- Configuración para Langtool desactivada. [Jorge Araya Navarro]
- Añadiendo alias para algunos comandos. [Jorge Araya Navarro]
- Re-habilitando Jabber. [Jorge Araya Navarro]
- Super mejoras para mu4e. [Jorge Araya Navarro]
- Cambios para mu4e. [Jorge Araya Navarro]
- Agregando submódulo multimu4e. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambiando comando de mu4e para recoger el correo. [Jorge Araya
  Navarro]
- Mejoras en dired. [Jorge Araya Navarro]
- Cambio en Dired. [Jorge Araya Navarro]

  Por defecto usara el mismo buffer para diferentes directorios. En estos
  casos nunca usar RET para ir a otra carpeta si se tienen archivos
  marcados, en su lugar usar C-x d
- Eliminando adoc-mode, arreglando langtool. [Jorge Araya Navarro]
- Eliminando temporalmente python-mode.el. [Jorge Araya Navarro]

  Debido a este error https://github.com/company-mode/company-mode/issues/377
- Fm-bookmarks instalado. [Jorge Araya Navarro]
- Modificaciones menores. [Jorge Araya Navarro]
- AUCTeX para la edición de documentos LaTeX. [Jorge Araya Navarro]

  Con su respectiva configuración ideal
- Cambios menores. [Jorge Araya Navarro]
- Borrando restos de anaconda-mode. [Jorge Araya Navarro]
- Reemplazando anaconda-mode con jedi.el. [Jorge Araya Navarro]
- Actualizando la configuración y la lista de paquetes instalados.
  [Jorge Araya Navarro]
- Ignora los errores al tratar de establecer una tipografía que no
  existe en el sistema. [Jorge Araya Navarro]
- Acomodando la configuración de el Python-mode de F. Gallina. [Jorge
  Araya Navarro]
- Imenu+ removido: afecta el correcto funcionamiento de helm-imenu.
  [Jorge Araya Navarro]
- Modificaciones menores en la configuración. [Jorge Araya Navarro]
- Las etiquetas script van antes de la etiqueta de cierre de body.
  [Jorge Araya Navarro]
- Agregando Google Analytics a la plantilla, también Sharethis. [Jorge
  Araya Navarro]
- Eliminando el fondo de las palabras clave TODO de org-mode. [Jorge
  Araya Navarro]
- Tema cambiado por emacs-material-theme. [Jorge Araya Navarro]
- Desactivando company-quickhelp temporalmente. [Jorge Araya Navarro]
- Algunos ganchos ahora contienen funciones declaradas en lugar de
  funciones anónimas con lambdas. [Jorge Araya Navarro]
- Algunos paquetes no están ya disponibles en los repositorios activados
  de Melpa, por lo que la lista de paquetes fue regenerada sin ellos.
  [Jorge Araya Navarro]
- Tratando de evitar que sh-mode rompa las lineas al llegar al extremo
  derecho del documento. [Jorge Araya Navarro]
- Listando nuevos paquetes instalados. [Jorge Araya Navarro]
- Company ahora usa racer para auto completar código en Rust. Company
  tiene muchas adiciones como estadisticas y popups con documentación.
  [Jorge Araya Navarro]
- Usando (format-spec) en lugar de (format) al colocar el nombre del
  proyecto dentro de la licencia GPLv3. [Jorge Araya Navarro]
- Acción para ver correos HTML en el navegador agregada a mu4e. [Jorge
  Araya Navarro]
- Corrigiendo error en la configuración luego de borrar eyebrowse.
  [Jorge Araya Navarro]
- Algunos paquetes borrados con package-safe-delete y eliminados de la
  configuración de Emacs. [Jorge Araya Navarro]
- Definición personalizada para python-mode para header2.el. [Jorge
  Araya Navarro]
- Agregando paquetes header2 y helm-flycheck. [Jorge Araya Navarro]
- Melpa estable ahora es nuestro único repositorio de paquetes de Emacs.
  El archivo de configuración ahora se llama `configuracion.org` [Jorge
  Araya Navarro]
- Removido Melpa por contener paquetes desactualizados. [Jorge Araya
  Navarro]
- Agregando archivo para ignorar. [Jorge Araya Navarro]
- Arreglando nombre de argumento. [Jorge Araya Navarro]
- Cambiando el nombre de la aplicación que hace la llamada de aviso; de
  "emacs" a "Emacs: Org" [Jorge Araya Navarro]
- Configurando "appointments" con org-mode. [Jorge Araya Navarro]
- Agregando un atajo de teclado para elfeed. [Jorge Araya Navarro]
- Avy-jump y elfeed instalados. [Jorge Araya Navarro]
- Asignando un atajo de teclado al comando twittering-favorite. [Jorge
  Araya Navarro]
- Eliminado el paquete ledger-mode. [Jorge Araya Navarro]
- Configuración de teclas para algunos modos menores, activación de
  modos menores, cambios en la configuración de Helm, nlinum y hlinum
  ahora son activados en todos los modos mayores que tengan relación a
  la programación, otros cambios menores. [Jorge Araya Navarro]
- Desactivados powerline y smart-modeline. [Jorge Araya Navarro]
- Configuración de py-autopep8 actualizada. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Twittering-mode y sx.el agregados a Emacs. [Jorge Araya Navarro]
- Ignorando archivos en ~/.emacs.d/.sx. [Jorge Araya Navarro]
- Estableciendo el apodo por defecto para los chats grupales en jabber.
  [Jorge Araya Navarro]
- Nueva cuenta de Jabber. [Jorge Araya Navarro]
- Creando atajos a "maildirs" [Jorge Araya Navarro]
- Archivo cifrado fue borrado. [Jorge Araya Navarro]
- Olvidé borrar el archivo cifrado con credenciales para mediawiki.el
  lolfail. [Jorge Araya Navarro]
- Borrando archivos cifrados con GPG. [Jorge Araya Navarro]
- Las credenciales para conectarse a Jabber ahora son obtenidas del
  llavero por los medios que Emacs ofrece. [Jorge Araya Navarro]
- Find-file-sudo ha sido corregido para invocarse solo cuando el archivo
  existe, y no pueda ser modificado por el usuario actual. [Jorge Araya
  Navarro]
- Agregando favicon. [Jorge Araya Navarro]
- Formateo con CSS para la clase "figure" generado por org-mode para
  imagenes con descripción. [Jorge Araya Navarro]
- Activando winner-mode. [Jorge Araya Navarro]
- Cambios en los colores de los estados TODO. [Jorge Araya Navarro]
- El historial de archivos es guardado cuando un frame de Emacs es
  cerrado. [Jorge Araya Navarro]
- Activando de vuelta powerline-mode. [Jorge Araya Navarro]
- Desactivando powerline por error (ver https://github.com/jonathanchu
  /emacs-powerline/issues/31 ) [Jorge Araya Navarro]
- Cambiando opciones para tema de actual. [Jorge Araya Navarro]
- Activación de nuevo tema, mejoras en el script de Python que genera la
  lista de paquetes instalados. [Jorge Araya Navarro]
- Unkillable-scratch fue instalado y activado en la configuración.
  [Jorge Araya Navarro]
- Cambios menores. [Jorge Araya Navarro]
- Nuevas funciones para generar mi blog fueron agregadas. [Jorge Araya
  Navarro]
- Tema del blog agregado. [Jorge Araya Navarro]
- Helm-mini debe ser usado en lugar de switch-to-buffer. [Jorge Araya
  Navarro]
- Deshabilitando dos módulos de org-mode. [Jorge Araya Navarro]
- Otra carpeta más filtrada de la lista de paquetes a instalar. [Jorge
  Araya Navarro]
- Carpetas que no pertenecen a ningún paquete de MELPA son ignorados de
  la lista de paquetes a instalar. [Jorge Araya Navarro]
- La fecha de modificación de los archivos org y elisp son verificados
  para indicarle a Emacs qué hacer si uno es más nuevo que otro o el
  otro no existe. [Jorge Araya Navarro]
- Error en script de Python corregido, algunos paquetes no tienen una
  raya seguidos luego por su versión. [Jorge Araya Navarro]
- Al intentar abrir un archivo cuyo dueño es el super-usuario, Emacs
  trata de abrirlo inmediatamente como root. [Jorge Araya Navarro]
- Lua-mode agregado, tema para org-mode removido. [Jorge Araya Navarro]
- Js2-mode es usado para editar archivos JavaScript. [Jorge Araya
  Navarro]
- Funciones para visitar archivos y cambiar de buffer personalizadas
  fueron agregadas. [Jorge Araya Navarro]
- Cambiar el tema de powerline cada vez que una consola era creada
  dentro de emacs fue una mala idea. [Jorge Araya Navarro]
- Limpiando el código de configuración para jabber.el. [Jorge Araya
  Navarro]
- Undo-tree esta activado de manera global de forma automática. [Jorge
  Araya Navarro]
- Rainbow-mode se activa automáticamente para todos los modos de
  programación. [Jorge Araya Navarro]
- Cuando un emulador de terminal es creado dentro de emacs, el tema de
  powerline cambia a algo más sencillo. [Jorge Araya Navarro]
- Algunos cambios no muy importantes. [Jorge Araya Navarro]
- Nuevos paquetes instalados! [Jorge Araya Navarro]
- Adoc-mode. [Jorge Araya Navarro]
- El comando `mu4e` a sido asociado a la tecla <f7> [Jorge Araya
  Navarro]
- Borrado paquete innecesario que se puede instalar desde ELPA. [Jorge
  Araya Navarro]
- Cambios en web-mode para hacer la experiencia de diseño web en emacs
  mas amena. [Jorge Araya Navarro]
- Actualizada la lista de paquetes instalados en Emacs. [shackra]
- Electric-pair-mode esta mejor que autopair-mode, entonces se puede
  hacer el cambio. [shackra]
- Actualizado la configuración de helm-mode. [shackra]
- Activando org-habit por medio de los cambios a org-modules. [shackra]
- Requiriendo org-habit. [shackra]
- Arreglando error con la tecla RET que se usa para desactivar iedit
  cuando se esta usando iedit-mode. [shackra]
- Las cuentas de correo para mu4e así como las credenciales para usar
  con mediawiki.el se cargan solamente si Emacs corre como demonio (esto
  debería hacer el arranque de Emacs más rápido si no se inicia como
  demonio) [shackra]
- Agregando el paquete iedit, cambiando el comportamiento de iedit.
  Ignorar errores al momento de cargar archivos GPG que contienen
  configuración alguna. [shackra]
- Lista de paquetes instalados en Emacs, actualizada. [shackra]
- Jabber.el ahora usa libnotify para las notificaciones. [shackra]
- Habilitando `sh` para org-babel. [shackra]
- Cambios menores. [shackra]
- Cambios en uno de los ganchos de jabber.el. [shackra]
- No abre la agenda luego de iniciar emacs. [shackra]
- Corrigiendo error con la ubicación del tema jazz. [shackra]
- Lista de paquetes actualizada. [shackra]
- Nuevo tema "Jazz" es puesto en uso. [shackra]
- Actualizando configuración a pedido de Tu Do (
  http://emacs.stackexchange.com/questions/3724/how-to-make-helm-stop-
  when-tramp-asks-me-for-my-password?noredirect=1#comment5499_3724  )
  [shackra]
- Ignorando un buffer que no puedo desactivar. [shackra]
- Integrando ace-window en la configuración. [shackra]
- Archivo olvidado. [shackra]
- Requiriendo wikimedia, cambiando a https algunos sitios Mediawiki,
  actualizando la lista de paquetes. [shackra]
- Configuración para sitios Mediawiki, arreglos en langtool. [shackra]
- Error con flymake y eldoc en elpy-mode solucionado. [shackra]
- Desactivando temporalmente el gancho para las notificaciones de
  jabber. [shackra]
- Corrigiendo fallos en la configuración. [shackra]
- Cambiando el método de notificación para notify.el. [shackra]
- Varios arreglos en la configuración. [shackra]
- Org-mode capture con una opción más para escribir anotaciones.
  [shackra]
- Ignorando carpetas que creadas por jabber.el. [shackra]
- Visual-line-mode se usa en lugar de auto-fill. Algunas partes de la
  configuración han sido puestas en revision. [shackra]
- Eliminando una fuente de paquetes. [shackra]
- Jabber.el funciona adecuadamente. [shackra]
- Borrado submodulo ELIM. [shackra]
- Agregando submodulo ELIM. [shackra]
- Asignando la nueva función a una combinación de teclas. [shackra]
- Función para insertar combinación de teclas entre etiquetas <kbd>
  [shackra]
- Restituyendo el gancho para org-mode. [shackra]
- El archivo bookmarks no deberia ser manejado por Git. [shackra]
- Limpiando el desastre. [shackra]
- Uniendo dos cambios distintos cambios. [shackra]
- Flyspell ahora ignora algunas partes de org-mode! [shackra]
- Auto-fill-mode desactivado en org y muse. [shackra]
- Agregando una archivo léame. [shackra]
- Pelicuas -> Películas, duh. [shackra]
- Las teclas para las plantillas de org-mode capture no pueden ser
  dobles (si se piensan usar desde el menu que ofrece C-c c) [shackra]
- Se implementaron nuevas plantillas de captura de anotaciones para org-
  mode. [shackra]
- Problema con org-capture resuelto! [shackra]
- Cambios en mu4e. [shackra]
- Un comando más inteligente para retornar al inicio de la linea!
  [shackra]
- Agregando history a la lista de archivos/carpetas ignorados. [shackra]
- Cambiando la lista en cabeceras. [shackra]
- Extendiendo dired. [shackra]
- Habilitando Python en Babel. [shackra]
- Agregando undo-tree, cambiando la configuración y uniendo varias
  partes de la configuración en un sólo bloque de código fuente.
  [shackra]
- Cambios en org-mode. [shackra]
- Cambios en la configuración del modo python. [shackra]
- Cambios en la configuración. [shackra]
- Corrigiendo fallos introducidos en la configuración de org-page.
  [shackra]
- Cambios en la configuración. [shackra]
- Se usa use-package para asegurarse que los paquetes estan instalados
  en la carpeta elpa del usuario. [shackra]
- Fragmento de código Python que genera código Elisp y se encarga de
  instala paquetes faltantes. fix bug #1. [shackra]
- Org-page agregado a la configuración. [shackra]
- Cambios en org-mode y cambio de tema. [shackra]
- Initial-buffer-choice no hace lo que se pensaba que hacía. [shackra]
- Agregando archivos para ignorar. [shackra]
- El buffer por defecto sera la agenda de Org-mode. [shackra]
- Afinando detalles en la configuración así como también corrigiendo
  errores. [shackra]
- Cambios en la configuración. [shackra]
- Cambios varios en la configuración! [shackra]
- Agregado soporte para golang y rustlang. [shackra]
- El archivo custom.el carga antes, todo funciona ahora. [shackra]
- Nuevas opciones personalizadas en la configuración. [shackra]
- Movida la definición del archivo customize. [shackra]
- Eliminando momentaneamente el paquete auto-indent-mode que esta
  causando fallos en python-mode. [shackra]
- Acciones para hacer cuando se salva un archivo. [shackra]
- Aumentando la profundidad de índices que en imenu cuando se usa con
  org-mode. [shackra]
- Corrigiendo un error en org-mode que evitaba que el modo se activara
  correctamente. [shackra]
- Cambios menores en la configuración. [shackra]
- Submodulo actualizado. [shackra]
- Primer commit de mi nueva configuración de GNU Emacs. [shackra]


