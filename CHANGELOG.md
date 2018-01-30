# Changelog


## (unreleased)

### New

#### Agrega plantillas de Yasnippet para systemd-mode.


~ Jorge Araya Navarro

#### Habilita Yasnippet en systemd-mode.


~ Jorge Araya Navarro

#### Habilita hack en org-mode que mueve etiquetas al final de marco.


~ Jorge Araya Navarro

#### Habilita paquetes para org-mode y ajusta org-projectile.


~ Jorge Araya Navarro

#### Usa el fork de emacs-slack de Malabarba.


  Upstream tiene muchos problemas para ser útil

~ Jorge Araya Navarro

### Changes

#### Separa Alert y Appt.


~ Jorge Araya Navarro

#### Establece variable a `nil` si no esta definida.


  Evita que emacs-slack falle mientras carga en Windows

~ Jorge Araya Navarro

#### Ajustes para Python.


~ Jorge Araya Navarro

#### Dired+ ya no se carga desde Elpa.


  Esto debido a los ajustes en Melpa sobre archivos inseguros bajados desde la Wiki de Emacs

  https://github.com/melpa/melpa/pull/5008/

~ Jorge Araya Navarro

### Fix

#### Elimina opción innecesaria para sentencia de pkgbuild-mode.


~ Jorge Araya Navarro

#### Fija atajo para ivy-switch-buffer.


  Ejecuta el autoloads para ivy cuando el atajo es utilizado

~ Jorge Araya Navarro


## 3.2 (2017-12-23)

### New

#### Implementa funciones para convertir notas al pie y cursiva.


  De Asciidoc a LaTeX

~ Jorge Araya Navarro

### Changes

#### Sentencias `use-package` envueltas en `with-eval-after-load`


  Simula cargado de dependencias como una expresión lógica `AND`. `:after` hace que un paquete se
  cargue cuando cualquiera de los simbolos que contiene ha sido definido (como una expresión lógica `OR`).

  https://redd.it/7lq1dv

  https://stackoverflow.com/a/21880276/2020214

~ Jorge Araya Navarro

#### Adquiere los credenciales para redmine de `.netrc`


~ Jorge Araya Navarro

#### Renombra funciones personalizados para usar `-`


  Por convención, los espacio de nombre de las funciones y variables o simbolos se separan con una
  raya (`-`)

~ Jorge Araya Navarro

### Fix

#### Carga Slack y Redmine solo cuando DBus esta disponible en Emacs.


~ Jorge Araya Navarro


## 3.1 (2017-12-16)

### New

#### Pega fragmento generado de CHANGELOG al portapales en magit.


  Facilita la creación de fragmentos de CHANGELOG en un rango especificado entre dos commits sin salir
  de magit utilizando gitchangelog, la salida del comando es colocado en el portapapeles del sistema operativo.

  - https://github.com/vaab/gitchangelog

~ Jorge Araya Navarro

#### Convierte tiempo HH:MM bajo el cursor a notacion decimal.


  Ayuda a conocer el equivalente en notacion decimal de cualquier cantidad de horas y minutos en un
  archivo org-mode. Esta información es pegada en el portapapeles del sistema operativo.

  Para org-mode el atajo `C-M-y` es utilizado para la función `shackra/time-at-point-to-hours` que se
  encarga de todo el trabajo.

  - https://stackoverflow.com/a/2178975/2020214

~ Jorge Araya Navarro

#### Registra instalación de Meghanada.


~ Jorge Araya Navarro

#### Define función para desactivar localmente electric-indent-mode.


~ Jorge Araya Navarro

#### Instala utilidad para interactuar con Redmine.


~ Jorge Araya Navarro

#### Instala entorno de depuración integrado a Emacs.


  - https://github.com/realgud/realgud

~ Jorge Araya Navarro

#### Instala modo menor para trabajar con código Java.


  https://github.com/mopemope/meghanada-emacs

~ Jorge Araya Navarro

#### Función para convertir el tiempo en notación decimal.


  Me ayuda a calcular el tiempo invertido en el brete para registrarlo posteriormente en los registros
  de la empresa

  - https://redd.it/7jlh0t
  - https://www.calculatorsoup.com/calculators/time/time-to-decimal-calculator.php
  - https://www.gnu.org/software/emacs/manual/html_node/elisp/String-Basics.html

~ Jorge Araya Navarro

#### Habilita org-download para descarga de imagenes.


  Para la plantillas de org-mode capture

~ Jorge Araya Navarro

#### Habilita Slack dentro de Emacs.


  Comunicación con las organizaciones para las cuales trabajo

~ Jorge Araya Navarro

#### Indica el nuevo hogar de la configuración.


~ Jorge Araya Navarro

#### Separa la configuración de ivy y swiper.


~ Jorge Araya Navarro

#### Habilita Gimp mode.


  Lo necesito para editar archivos `.scm` o Script-fu.

~ Jorge Araya Navarro

#### Implementa función para comprobar existe de módulos Python.


  Sirve para utilizar en plantillas de YaSnippet, para ayudar con la comprobación de ciertas
  condiciones que ayuden a disparar la expansión de la plantilla

  https://stackoverflow.com/a/5014917/2020214

~ Jorge Araya Navarro

#### Integra nuevo segmento en el mode-line.


~ Jorge Araya Navarro

#### Define cara y segmento para el mode-line.


~ Jorge Araya Navarro

#### Inicializa variable de entorno cuando Emacs ha sido cargado.


~ Jorge Araya Navarro

#### Recarga las plantillas de YaSnippet luego de iniciar Emacs.


~ Jorge Araya Navarro

#### Registra plantillas personalizadas de YaSnippet.


~ Jorge Araya Navarro

#### Registra el archivo de marcadores en Git.


~ Jorge Araya Navarro

#### Habilita git-crypt en el repositorio.


~ Jorge Araya Navarro

#### Añade plantilla en org-mode para anotaciones técnicas.


~ Jorge Araya Navarro

#### Habilita ajustes para `bookmark` y `Bookmark+`


~ Jorge Araya Navarro

#### Ivy/Counsel ahora manejan las etiquetas de org-mode.


~ Jorge Araya Navarro

#### Mu4e con perfil principal de correo por default.


~ Jorge Araya Navarro

#### Añade nuevos paquetes instalados explicitamente.


~ Jorge Araya Navarro

#### Inserta un encabezado al principio de archivos en Python.


~ Jorge Araya Navarro

### Changes

#### Remapea atajo de `other-window` a `ace-window`


~ Jorge Araya Navarro

#### Elimina transcription-mode.


  Paquete ya no forma parte de los submódulos de Git

~ Jorge Araya Navarro

#### Activa la herencia de propiedades.


~ Jorge Araya Navarro

#### Conserva el atajo para salto de linea de RET.


  `eletric-indent-mode` se encarga de sangrar correctamente el nuevo salto de linea, de estar activado

  ` (describe-function 'newline) `

~ Jorge Araya Navarro

#### Función para arreglar los imports en Python antes de guardar.


~ Jorge Araya Navarro

#### Mueve la definición de los repositorios Elpa a init.el.


~ Jorge Araya Navarro

#### Telephone-line utiliza cara distinta.


~ Jorge Araya Navarro

#### Utiliza cara personalizada para mostrar entorno virtual Python.


~ Jorge Araya Navarro

#### Elimina modulo.


~ Jorge Araya Navarro

#### Elimina algunos modulos innecesarios y actualiza otros.


~ Jorge Araya Navarro

#### Remapea los atajos de un comando por otro.


  Evita que cometa errores en caso de utilizar un atajo diferente al que asigne para el otro comando

~ Jorge Araya Navarro

#### Ajusta la configuración de las plantillas de captura org-mode.


  Elimina plantillas redundantes, cambia la letra de atajo para la bitácora de pendientes (o backlog
  en inglés)

~ Jorge Araya Navarro

#### Ajustes menores para org-mode.


  Cuando se hace un refile ahora los ítem pueden guardarse a nivel de archivo. Se cambia el nivel de
  profundidad de los archivos `notas.org` y `quizas.org` y se quita el atajo a `org-iswitchb` de C-x
  b. Las notas ahora se hacen al archivo `notas.org` por defecto.

~ Jorge Araya Navarro

### Fix

#### Establece atajo para comando personalizado dentro de org-mode.


  `org-mode-map` no es definido hasta que se ejecuta el bloque `(use-package org)`. Antes se estaba
  definiendo el atajo priori a la evaluación de org-mode.

~ Jorge Araya Navarro

#### Remapea combinación para cambiar buffer a comando personalizado.


~ Jorge Araya Navarro

#### Deshabilita paquetes para Slack y refactoracion de JavaScript.


~ Jorge Araya Navarro

#### Deshabilita gimp-mode.


  Falla por dependencias sin actualizar

~ Jorge Araya Navarro

#### Evita fallo si nombre de buffer no tiene extensión.


~ Jorge Araya Navarro

#### Desactiva sangrado automatico de aggresive-indent-mode.


~ Jorge Araya Navarro

#### Elimina abuso del comando use-package.


  Evita que bugs sean introducidos al intentar usar use-package para trozos de codigo elisp que no
  provienen de paquetes

~ Jorge Araya Navarro

#### Utiliza un sistema de notificacion diferente en Windows.


  En Windows no existe D-Bus

~ Jorge Araya Navarro

#### Establece correctamente directorio de plantillas.


~ Jorge Araya Navarro

#### Elimina de Git plantillas de fabrica de YaSnippet.


  Estas son instaladas cuando se instala YaSnippet por lo que es innecesario registrarlas en Git

~ Jorge Araya Navarro

### Other

#### Merge branch 'master' of gitlab.com:shackra/emacs.


~ Jorge Araya Navarro

#### Add 1 git-crypt collaborator.


  New collaborators:

  	39A264EE Jorge Javier Araya Navarro <jorge@esavara.cr>

~ Jorge Araya Navarro


## 3.0 (2017-09-26)

### New

#### Instala tern-mode de manera explicita, cambia el mapa de teclas.


  A nivel global M-. estaba fallando debido a la configuración anterior que era incorrecta

~ Jorge Araya Navarro

#### Actualiza preparativos para package.el.


  https://github.com/s-kostyaev/.emacs.d/blob/5c872864533749879fc7d1008a29fc68833ee04c/init.el#L10

~ Jorge Araya Navarro

#### Añade paquetes para trabajar con Docker.


~ Jorge Araya Navarro

#### Cambia las opciones de recoleccion de basura.


  En Windows esto hace que Emacs responda con mayor velocidad a los caracteres que se escriben y
  aparezcan en la pantalla.

~ Jorge Araya Navarro

#### Añade paquetes para editar Angular2.


  https://afsmnghr.github.io/emacs/angular/

~ Jorge Araya Navarro

#### Formatea los titulos de las tablas sin enlaces o palabras TODO.


  Permite que los titulos de las cabeceras sean más legibles

  https://emacs.stackexchange.com/a/9508/690

~ Jorge Araya Navarro

### Changes

#### Cambia la definición del hydra para el sangrado en Python.


  Cualquier tecla debería sacarnos del hydra, si la región estuviera activa (`use-region-p` evalúa a
  `t`) necesitabamos desmar la region para evitar que ella fuera reemplazada por la tecla presionada
  para salir.

~ Jorge Araya Navarro

#### Elimina redundancia.


~ Jorge Araya Navarro

#### Muestra el titulo de los nuevos correos entrantes.


~ Jorge Araya Navarro

#### Normaliza la configuración de python-mode.


~ Jorge Araya Navarro

#### Normaliza la configuración para editar LaTeX.


~ Jorge Araya Navarro

#### No utiliza use-package para paquetes que no proveen `provide`


  use-package no funcionaba correctamente, si el paquete no tiene `(provide 'foo)` entonces no vale la
  pena usar el macro use-package

~ Jorge Araya Navarro

#### Cambia el icono para cambios no registrados en VC.


  El icono de "buffer modificado" era exactamente igual

~ Jorge Araya Navarro

#### Actualiza el icono de Git en el modeline.


  Parecía no estar centrado, lo cual me estaba irritando

~ Jorge Araya Navarro

#### Cambia el idioma del aviso en configuracion.el.


~ Jorge Araya Navarro

#### Actualiza la versión de secretaria.el.


~ Jorge Araya Navarro

#### Deshabilita golden-ratio.


~ Jorge Araya Navarro

#### Mueve variable fuera de custom.el.


  `bmkp-last-as-first-bookmark-file` por alguna razon siempre esta cambiando.

~ Jorge Araya Navarro

#### Utiliza :if en lugar de :disabled.


  :disabled en use-package ignora el valor que tiene a la derecha

  https://github.com/jwiegley/use-package/issues/387
  https://github.com/jwiegley/use-package/issues/496#issuecomment-330006149

~ Jorge Araya Navarro

#### Cambio a `add-to-list`


  Evita duplicacion de elementos en la lista de la variable ivy-ignore-buffers

~ Jorge Araya Navarro

#### Elimina snippets.


~ Jorge Araya Navarro

#### Cambia `:if` a `:disabled`


  Evita que secciones de configuracion sean activadas del todo

~ Jorge Araya Navarro

#### Ajusta la configuración para editar JavaScript.


  https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
  https://emacs.cafe/emacs/javascript/setup/2017/05/09/emacs-setup-javascript-2.html

~ Jorge Araya Navarro

#### Deshabilita prodigy.


  imapnotify esta siendo ejecutado desde systemd

~ Jorge Araya Navarro

### Fix

#### Arregla el verdadero nombre del paquete auto-revert-mode.


~ Jorge Araya Navarro

#### Evita que el byte-compiler dé errores.


  Estos dos paquetes son "ficticios", sus archivos no existen y no pueden ser leidos por el byte-compiler

~ Jorge Araya Navarro

#### Evita entrada duplicada ingrese en org-capture-template.


  org-projectile se configura diferente desde las nuevas versiones.

~ Jorge Araya Navarro


## 2.4.1 (2017-08-27)

### New

#### Agrega mu4e-alert.


  Notificación de nuevo email, gracias a goimapnotify

~ Jorge Araya Navarro

#### Añade kotlin-mode.


~ Jorge Araya Navarro

#### Cambia python-imapnotify por goimapnotify.


  https://gitlab.com/shackra/goimapnotify
  https://github.com/a-sk/python-imapnotify/

~ Jorge Araya Navarro

#### Añade macro de teclado que desenreda sentencias use-package.


~ Jorge Araya Navarro

### Changes

#### Desenreda sentencias use-package.


  La configuración es más fácil de leer pues no hay sentencias use-package anidadas

~ Jorge Araya Navarro


## 2.4.0 (2017-08-16)

### New

#### Añade paquete chronos.


  Necesito un cronometro para medir el tiempo de ciertas actividades (como al cocinar)

~ Jorge Araya Navarro

#### Mejora las sugerencias para corrección ortográfica.


  Palabras escritas en TipadoDeCamello aparecían en las sugerencias lo que dificulta la corrección
  ortográfica en inglés.

~ Jorge Araya Navarro

#### Añade snippet para usar en mi currículum.


~ Jorge Araya Navarro

#### Gherkin-mode para editar escenarios en BDD.


~ Jorge Araya Navarro

#### Reemplaza la plantilla de Git por defecto con un snippet.


  Agiliza el flujo de trabajo con Git dentro de Emacs usando Magit

~ Jorge Araya Navarro

#### Actualiza el modulo schrute-mode.


~ Jorge Araya Navarro

### Changes

#### Ajustes en la configuración de python-mode.


~ Jorge Araya Navarro

#### Cambia el icono de Git en el mode-line.


  El icono por default era muy feo

~ Jorge Araya Navarro

#### Desactiva el gancho que modifica el buffer COMMIT_EDITMSG.


  El flujo de trabajo no es ideal, no funciona bien con `commit --amend`

~ Jorge Araya Navarro

#### Remueve codigo y actualiza mi correo electronico.


  org-trello estaba dando fallos por su definición de variables en custom.el, además, he cambiado de
  email

~ Jorge Araya Navarro

#### Actualiza configuración de org-mode.


  Mejora el "agenda views" de org-mode para mostrar tareas programadas para el día de hoy, la semana o
  el mes. Por defecto las anotaciones se harán en el archivo diario.org. Al ingresar una nueva tarea
  "Fechas" se hace bajo una entrada llamada "Fechas" dentro de "cosas por hacer.org" para facilitar la
  búsqueda de tareas para el día en orgzly.

  https://emacs.stackexchange.com/questions/15309/is-there-a-way-to-show-an-agenda-with-just-a-time-grid
  https://emacs.stackexchange.com/questions/29831/hide-scheduled-items-in-org-agenda-until-they-are-past-their-scheduled-date-and

~ Jorge Araya Navarro

#### Email es descargado con imapnotify.


~ Jorge Araya Navarro

#### Elimina el retraso para cargar expand-region.


~ Jorge Araya Navarro

#### Funciones shackra/super-* ahora son `(interactive)`


  Esto evita problemas con schrute-mode

~ Jorge Araya Navarro

#### Modifica la configuración de Schrute-mode.


~ Jorge Araya Navarro

#### Refactoriza Python y Flycheck.


~ Jorge Araya Navarro

#### Elimina hydras de hydra-mc Estos hydras eran innecesarios pues los comandos asociados a ellos no se repetirán más de una vez.


~ Jorge Araya Navarro

#### Cambia el alto del mode-line.


~ Jorge Araya Navarro

#### Añade indium para Javascript.


~ Jorge Araya Navarro

#### Mueve cambio en variable a :config.


~ Jorge Araya Navarro

### Fix

#### Activa `anaconda-mode` al iniciar `python-mode`


  Por alguna estupida razón anaconda no estaba configurado para iniciar cuando se editan archivos Python

~ Jorge Araya Navarro

#### Actualiza configuración de `org-webpage` y `org-projectile`


  `org-webpage` tenia fallos de dependencias. `org-projectile` había cambiado el nombre de varios de
  sus funciones

~ Jorge Araya Navarro

#### Evita que los paquetes sean inicializados automáticamente.


  Algunos paquetes aparecían como no disponibles a pesar de figurar en el `load-path`

~ Jorge Araya Navarro

#### Arregla la configuración de mensajes para commits.


  Yasnippets estaba causando un fallo que no permitía finalizar la configuración del buffer para los
  mensajes de commit en commits de Git

~ Jorge Araya Navarro

#### Quita la canonización de nombres en mu4e.


  Los cambios anteriores hacen que el autocompletado para el campo "To:" no funcione

~ Jorge Araya Navarro

#### Actualiza definición de fragmentos para telephone-line.


~ Jorge Araya Navarro

#### Org no rompe las lineas en títulos o elementos con M-RET.


~ Jorge Araya Navarro

#### Corrige los atajos para iedit-mode.


~ Jorge Araya Navarro

#### Agrega paquetes y cambia atajos para python-mode.


  Se re-habilita TRAAD, se incluye una utilidad que agrega platillas de documentación de Sphinx a
  funciones y clases, se modifica la hydra hydra-py para sangrar bloques de código Python. También
  se desactiva el sangrado agresivo con `aggressive-indent-mode`. Finalmente se asocian atajos del
  teclado con funciones de anaconda-mode.

~ Jorge Araya Navarro

#### Resuelve varios problemas de dependencias entre paquetes.


~ Jorge Araya Navarro

#### Corrige error para cambiar de buffer con C-u mi/switch-buffer.


~ Jorge Araya Navarro

#### Añade .tar.7z a la lista de formatos para compresión.


~ Jorge Araya Navarro

### Other

#### Desactiva `schrute-mode` y demanda `undo-tree`


~ Jorge Araya Navarro

#### Schrute-mode como modulo del repositorio.


~ Jorge Araya Navarro

#### Corrige error lógico para activación del paquete emojify.


~ Jorge Araya Navarro

#### Actualiza la lista de paquetes instalados.


~ Jorge Araya Navarro

#### Añade webpaste Utilidad para pegar contenido a pastebin sin salir de Emacs.


~ Jorge Araya Navarro

#### Reemplaza visual-regexp por PCRE2EL Quiero usar la sintaxis pcre en Emacs sin tener que añadir nuevos comandos y reemplazar atajos de teclado.


~ Jorge Araya Navarro

#### Dired: Añade atajos de teclado para compara y comprimir archivos.


~ Jorge Araya Navarro

#### Refactoriza configuración de prog-mode.


~ Jorge Araya Navarro

#### Apaga auto-fill-mode en modos mayores basados en text-mode.


~ Jorge Araya Navarro

#### Hace que Schrute-mode se active a dos repeticiones (1+ la siguiente)


~ Jorge Araya Navarro

#### Extiende la lista de paquetes instalados manualmente.


~ Jorge Araya Navarro

#### Agrega Yasnippet a la lista de backends de Company Esto sucede siempre que Emacs ha finalizado su inicio.


~ Jorge Araya Navarro

#### Activa highlight-indent-guides sólo para python-mode.


~ Jorge Araya Navarro

#### Agrega paquete golden-ratio-scroll-screen.


~ Jorge Araya Navarro

#### Elimina llamada a auto-fill.


~ Jorge Araya Navarro

#### Refactoriza la configuración de JS2 y Stylus-mode.


~ Jorge Araya Navarro

#### Deshabilita `gotype` de la configuración para Gometalinter.


~ Jorge Araya Navarro

#### Refactoriza configuración de LaTeX, web-mode, TRAAD, Rust y PHP-mode.


~ Jorge Araya Navarro

#### Refactoriza configuración de org-mode.


~ Jorge Araya Navarro

#### Agrega paquete iedit.


~ Jorge Araya Navarro

#### Refactoriza interfaz para imenu a ivy, desenreda imenu+


~ Jorge Araya Navarro

#### Agrega buffers de Weechat a la lista para matar.


~ Jorge Araya Navarro

#### Separa configuración relaciona a Git de Magit.


~ Jorge Araya Navarro

#### Refactoriza interfaz de projectile a ivy Helm no se usará más, es innecesario preservar las sentencias condicionales relacionadas a Helm.


~ Jorge Araya Navarro

#### Refactoriza configuración relacionada a Company.


~ Jorge Araya Navarro

#### Actualiza el comando para visitar archivos y cambiar buffers El uso de Hydra fue un total fracaso pues no es tan intuitivo como yo pensaba.


~ Jorge Araya Navarro

#### Añade nuevos paquetes a la lista de paquetes seleccionados.


~ Jorge Araya Navarro

#### Reduce a 2 las repeticiones para activar comando alternativos schrute-mode es más efectivo si se reducen las repeticiones de 2 a 3 para activar comandos alternativos.


~ Jorge Araya Navarro

#### Estiliza la configuración de Go y añade gometalinter `use-package` admite otras formas de definición de jerarquías entre paquetes de Emacs. Usar `:after` en lugar de anidar sentencias `use-package` dentro de otras hace que la configuración sea más legible.


~ Jorge Araya Navarro

#### Deshabilita ciertos comportamientos en Emacs No guarda archivos al perder Emacs el foco. undo-tree no guarda una copia del historial de cambios a un archivo, todo debido a un error. https://redd.it/5pa5jb.


~ Jorge Araya Navarro

#### Corrige pequeños detalles en el archivo org.


~ Jorge Araya Navarro


## 2.2.4 (2017-01-08)

### Other

#### Actualiza la configuración Necesitaba comentar los atajos de teclado y remover fragmentos de la configuración obsoletos.


~ Jorge Araya Navarro

#### Guarda cambios en archivos cuando Emacs pierde el foco.


~ Jorge Araya Navarro

#### Cambia la introducción.


~ Jorge Araya Navarro

#### Quita fragmentos inservibles.


~ Jorge Araya Navarro

#### Ignora archivos comprimidos de undo-tree.


~ Jorge Araya Navarro

#### Nuevos cambios menores.


~ Jorge Araya Navarro

#### Mejora la lógica de salto de ventanas El código anterior era estúpido, además, ace-window ya manejaba lo que yo trataba de hacer anteriormente.


~ Jorge Araya Navarro

#### Habilita programación para Typescript.


~ Jorge Araya Navarro

#### Actualiza lista de paquetes instalados explicitamente.


~ Jorge Araya Navarro

#### Instala paquete para controlar Chrome en Emacs Para desarrollo web en Chrome desde Emacs.


~ Jorge Araya Navarro

#### Arregla función en gancho after-save-hook con comprobación de puerto mozcontroller fallaba si Firefox no estaba corriendo y MozController no tenia el puerto 4242 abierto, lo cual hacia engorroso el proceso de desarrollo mostrando buffers de error en Emacs. Comprobamos si el puerto esta abierto con una nueva función.


~ Jorge Araya Navarro

#### Actualiza paquetes instalados explícitamente. activación de comandos.


~ Jorge Araya Navarro

#### Refrescara Firefox cuando un buffer es guardado Agiliza la visualización de cambios desde Firefox/Iceweasel en la pagina web o plantilla que se esta trabajando sin necesidad de dejar Emacs gracias a moz-controller.


~ Jorge Araya Navarro

#### Actualiza configuración de Schrute y Mu4e.


~ Jorge Araya Navarro

#### Activa schrute-mode Necesito agilizar mi uso de Emacs mientras me deshago de mis malos hábitos. Hice este paquete para ello y creo que ya es hora de activarlo en mi configuración.


~ Jorge Araya Navarro

#### Org-mu4e reparado.


~ Jorge Araya Navarro

#### Arreglo menor con activación de tipografía.


  También se bajo el nivel de seguridad SSL de 'paranoid a 'high.

~ Jorge Araya Navarro

#### Función para visitar una noticia dentro de elfeed con eww.


~ Jorge Araya Navarro

#### Modificando configuración para Weechat.


~ Jorge Araya Navarro

#### Arreglos y actualizaciones menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Ajuste en undo-tree y descubrimiento de Proced.


~ Jorge Araya Navarro

#### Re-activando nlinum luego de mucho tiempo.


~ Jorge Araya Navarro


## 2.2.3 (2016-10-02)

### Other

#### Paquetes extras.


  * move-text
  * company-statistics

~ Jorge Araya Navarro


## 2.2.2 (2016-09-29)

### Other

#### Haciendo más veloz el enredado de bloques de código elisp.


~ Jorge Araya Navarro


## 2.2.1 (2016-09-28)

### Other

#### Projectile y Magit.


  Dada la integración de Projectile y Magit, se elimina el binding F12 y
  se usara C-c p v para ejecutar Magit-status.

~ Jorge Araya Navarro

#### Migrando enredado de bloques de código.


  Gracias a Holger Schurig https://bitbucket.org/holgerschurig/emacsconf

  El bug donde isearch-* se ataba a la combinación C-s/C-r en lugar de
  Swiper, era provocado por better-defaults, iniciando better-defaults
  antes de Swiper arregla el problema.

~ Jorge Araya Navarro


## 2.2 (2016-09-28)

### Other

#### Shackra/other-window toma en cuenta golden-ratio.


  Desactiva el modo menor y balancea las ventanas antes de llamar a
  `ace-window`.

  También se borró la comprobación de edades en los archivos
  configuracion.(el|org) para eliminar un bug que evita que Emacs evalué
  completamente configuracion.el.

~ Jorge Araya Navarro

#### Cambiando el cursor de ventana como un pro.


~ Jorge Araya Navarro


## 2.1 (2016-09-26)

### Other

#### Swiper ahora si es fijado a C-s.


  Todos los bindings de Swiper ahora son fijados por Emacs. Parece que el
  problema era que no estaba leyendo la configuración completa.

~ Jorge Araya Navarro

#### Moviendo llamadas anidadas de use-package a :config.


~ Jorge Araya Navarro

#### Usando Bootstrap 4 para la plantilla del blog.


~ Jorge Araya Navarro

#### Eliminando buffers virtuales de Ivy.


~ Jorge Araya Navarro

#### Ajustes menores.


~ Jorge Araya Navarro


## 2.0 (2016-09-17)

### Other

#### Corrección menor, gracias a Daviel Bordak.


~ Jorge Araya Navarro

#### Mode-line más informativo, mejores hydra-mc-*


~ Jorge Araya Navarro

#### Engordando las nalgas del mode-line, toma 2.


~ Jorge Araya Navarro

#### Revert "Engordando las nalgas de mi mode-line ( ͡° ͜ʖ ͡°)"


  This reverts commit b4a617942b6d9f57bc3ab76117a812c4d2161187.

~ Jorge Araya Navarro

#### Engordando las nalgas de mi mode-line ( ͡° ͜ʖ ͡°)


~ Jorge Araya Navarro

#### Correcciones menores.


~ Jorge Araya Navarro

#### Migración de Helm a ivy.


~ Jorge Araya Navarro

#### Función `el-pocket-add-url-at-point`


~ Jorge Araya Navarro

#### El-pocket para añadir más fácilmente urls a Pocket.


~ Jorge Araya Navarro


## 1.8.7 (2016-08-21)

### Other

#### Integrando Go Guru a Emacs.


~ Jorge Araya Navarro

#### Tema cambiado a Zenburn.


~ Jorge Araya Navarro


## 1.8.6 (2016-08-13)

### Other

#### Ajuste en la plantilla descargas.mustache.


~ Jorge Araya Navarro

#### Ignorando carpeta emojis.


~ Jorge Araya Navarro

#### Modificando archivo léame y la configuración.


  Cada modo mayor que usa company para auto-completado ahora hace la
  variable `company-backends` local al buffer para su modificación.

~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Nunca preguntar al ejecutar código elisp.


~ Jorge Araya Navarro

#### Mejoras en tema del blog.


~ Jorge Araya Navarro

#### Etiqueta para marcar secciones desactivadas.


~ Jorge Araya Navarro

#### Actualizando comando de compilación para Go.


~ Jorge Araya Navarro


## 1.8.5 (2016-07-23)

### Other

#### Circe y Shackle.


~ Jorge Araya Navarro

#### Arreglando nombre erróneo de archivo.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Actualizacion de submodulo font-man.


~ Jorge Araya Navarro

#### Adición de mi propio paquete Font-man.


~ Jorge Araya Navarro

#### `web-mode` es el modo mayor para editar html y plantillas html.


~ Jorge Araya Navarro

#### Una hydra de multiple-cursors debe ser azul.


~ Jorge Araya Navarro

#### Agregando SLIME.


  Estoy leyendo Land Of Lisp, entonces me gustaría realizar todos los
  ejercicios del libro dentro de Emacs en lugar de la terminal.

~ Jorge Araya Navarro

#### Org-refile varios archivos y plantilla para Elisp.


~ Jorge Araya Navarro

#### Material-light como tema de día.


  Color del titulo de los documentos org-mode corregido para mejorar visibilidad

~ Jorge Araya Navarro

#### Tema claro para usar durante el día.


~ Jorge Araya Navarro

#### Nuevo paquete git-gutter-fringe.


~ Jorge Araya Navarro

#### Mejora en hydra-win.


  - Cambio de teclas asociadas a comandos para mover el cursor o cambiar
    las dimensiones de ventana.
  - División de ventanas con 2 (horizontal) y 3 (vertical).
  - Borrado de espacios en blanco al final de las lineas en todo el
    archivo.

~ Jorge Araya Navarro


## 1.8.4 (2016-06-20)

### Other

#### De 5 a 4 columnas para mejor visibilidad.


~ Jorge Araya Navarro

#### Arreglo menor.


~ Jorge Araya Navarro

#### Refactorizaciones y nuevas extensiones.


  - Hydras para multiple-cursors refactorizados.
  - Nuevos bindings para vimish-folds.
  - org-projectile para anotar lista de tareas pendientes por proyectos.
  - correcciones menores para `bind-keys` en multiple-cursors y
    vimish-fold.
  - UI para MPD, Mingus.

~ Jorge Araya Navarro


## 1.8.3 (2016-06-18)

### Other

#### Arreglos en función para actualizar un paquete.


  Gracias a nispio por su ayuda http://emacs.stackexchange.com/a/24038/690

~ Jorge Araya Navarro

#### Corrección gramatical y borrado de "TODO"


~ Jorge Araya Navarro


## 1.8.2 (2016-06-16)

### Other

#### Función para actualizar paquetes.


  Siempre que exista una nueva versión de un paquete
  `SHACKRA/UPDATE-ONE-PACKAGE` instala la nueva actualización y borra la
  versión antigua.

~ Jorge Araya Navarro

#### Feeds para elfeed.


~ Jorge Araya Navarro

#### Lector RSS.


~ Jorge Araya Navarro

#### Soporte para desarrollar app para Android.


~ Jorge Araya Navarro


## 1.8.1 (2016-06-09)

### Other

#### `goimports` para formatear código Go.


~ Jorge Araya Navarro

#### Merge branch 'master' of bitbucket.org:shackra/.emacs.d.


~ Jorge Araya Navarro

#### Reparando python-mode.


~ Jorge Araya Navarro


## 1.8 (2016-05-31)

### Other

#### Reparando python-mode.


~ Jorge Araya Navarro

#### Quitando definición de variables de entorno.


~ Jorge Araya Navarro

#### Usar Monoisome como tipografía.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Mejoras menores.


~ Jorge Araya Navarro

#### Elisp para hacer Emacsclient un git mergetool.


~ Jorge Araya Navarro

#### Pequeños ajustes.


~ Jorge Araya Navarro


## 1.7.5 (2016-05-10)

### Other

#### Escondiendo undo-tree del mode-line.


~ Jorge Araya Navarro

#### Varios ajustes.


~ Jorge Araya Navarro

#### Cambios menores.


  Activar golden-ratio de manera automática

~ Jorge Araya Navarro

#### Nuevos paquetes útiles.


  Se instalan AURel y golden-ratio

~ Jorge Araya Navarro

#### Mejoras en la Hydra para multiple-cursors.


~ Jorge Araya Navarro

#### Duh.


~ Jorge Araya Navarro

#### Cambio menor.


~ Jorge Araya Navarro

#### Mejoras para pony-mode.


~ Jorge Araya Navarro

#### Activando `skewer` cuando `web-mode` se activa.


  web-mode no hereda los ganchos asignados a sgml-mode.

~ Jorge Araya Navarro

#### Nuevo nombre de buffer para kill-or-bury-alive.


~ Jorge Araya Navarro


## 1.7.4 (2016-04-09)

### Other

#### Ajustes en el mode-line y cambio de tema de día.


~ Jorge Araya Navarro

#### Mostrar borradores.


~ Jorge Araya Navarro

#### Ajustes en mu4e.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro


## 1.7.3 (2016-03-20)

### Other

#### Mejor definición para comando `compile` en go-mode.


  El comando para `compile` se establece de manera inteligente según el
  contenido del archivo `.go`, el programa escrito en Golang será
  ejecutado por compile siempre y cuando al principio del archivo exista
  la cadena `package main`.

~ Jorge Araya Navarro

#### Eliminando GitFlow y modificando Golang.


~ Jorge Araya Navarro

#### Merge branch 'develop'


~ Jorge Araya Navarro

#### Merge tag '1.7.2' into develop.


  Tomando en serio la edición de código Lisp

~ Jorge Araya Navarro

#### Ox-reveal.


~ Jorge Araya Navarro


## 1.7.2 (2016-03-05)

### Other

#### Merge branch 'release/1.7.2'


~ Jorge Araya Navarro

#### ParEdit y Multiple-cursors con Hydra.


~ Jorge Araya Navarro

#### Merge tag '1.7.1' into develop.


  Cambios menores

~ Jorge Araya Navarro


## 1.7.1 (2016-03-05)

### Other

#### Merge branch 'release/1.7.1'


~ Jorge Araya Navarro

#### Cambios menores en mu4e.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Añadiendo js2-mode y otros juguetes.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.7'


~ Jorge Araya Navarro

#### Golang y Bookmark+


  extensiones para programar Golang en Emacs. Marcadores con Bookmark+,
  una hydra fue creada para hacer más practico el uso de Bookmark+

~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.6.2' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.6.1' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.6.2'


~ Jorge Araya Navarro

#### La función devuelve el valor correcto.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.6.1'


~ Jorge Araya Navarro

#### Actualizando secretaria.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.6'


~ Jorge Araya Navarro

#### Fixes bug #5.


  Con esto no debería existir más problemas en Mac OS u otros sistemas que
  no definan la variable de entorno $LANG

~ Jorge Araya Navarro

#### Usando ultima versión de mi paquete Secretaria.el.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.3' into develop.


~ Jorge Araya Navarro

#### Uso correcto del commando Yasnippet.


~ Jorge Araya Navarro

#### Añadiendo mi propio paquete, pero como desactivado.


~ Jorge Araya Navarro

#### Agregando mi paquete `secretaria`


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.2' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.1' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.3'


~ Jorge Araya Navarro

#### Mejoras para org y helm.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.2'


~ Jorge Araya Navarro

#### LaTeX en MacOS desde Emacs y otras mejoras.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.5.1'


~ Jorge Araya Navarro

#### Arreglos para MacOS y diseño paginas web.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.5'


~ Jorge Araya Navarro

#### Activación de imenu. Actualización para mu4e.


  Además, nueva plantilla de captura para org-mode donde se agrega un
  enlace guardado con `C-c C-l` al cuerpo del texto de la tarea.

~ Jorge Araya Navarro

#### Actualizando configuración mu4e.


  Las credenciales ahora son cargadas por medio del paquete `secreto`
  aprovechando la nueva característica `mu4e-context` que trae la ultima
  versión de mu.

~ Jorge Araya Navarro

#### Eliminando el paquete profile.


~ Jorge Araya Navarro

#### Añadiendo un paquete elisp de mi propia cosecha.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.4.1' into develop.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.4' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-1.4.1'


~ Jorge Araya Navarro

#### Arreglo en comprobación de existencia de fuentes.


  Usando un algoritmo que no falla cuando Emacs corre como demonio

~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.4'


~ Jorge Araya Navarro

#### Comprobando existencia de tipografías antes de uso.


~ Jorge Araya Navarro

#### Actualizado el archivo léame.


~ Jorge Araya Navarro

#### GNU ELPA especificado por default.


~ Jorge Araya Navarro

#### Quitando submodulo EGO.


~ Jorge Araya Navarro

#### Desactivando sensitive.


~ Jorge Araya Navarro

#### Remediando nuevo comportamiento de Helm.


  Aun queda cambiar todos los comandos `find-*`

~ Jorge Araya Navarro

#### Trozo de texto plantilla para latex-mode.


~ Jorge Araya Navarro

#### Cambios menores twittering-mode.


  Gracias a Aaron Harris ( http://emacs.stackexchange.com/a/19086/690 )
  Ahora puedo hacer que mi comando `shackra/tt-fav-rett` no necesite
  confirmación de mi parte para retweetear y marcar como favorito algún tweet

~ Jorge Araya Navarro

#### Merge branch 'arreglo-python-keybinding-traad' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-provide-traad-globalrevert' into develop.


~ Jorge Araya Navarro

#### Merge branch 'develop' of bitbucket.org:shackra/.emacs.d into develop.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.3' into develop.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-python-keybinding-traad'


~ Jorge Araya Navarro

#### Hydra-traad sólo para Python-mode.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-provide-traad-globalrevert'


~ Jorge Araya Navarro

#### Arreglos importantes.


  Sentencias elisp que faltaban fueron agregadas para que `use-package` no
  fallara al cargar auto-revert-mode y traad-projectile. Se borró una
  doble declaración de la variable `mu4e-update-interval` que me estaba
  trolleando.

~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.3'


~ Jorge Araya Navarro

#### Hydra para Traad.


  También mu4e se inicia de manera automática en el fondo

~ Jorge Araya Navarro

#### Restauración de ventanas al entrar a mu4e.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.2'


~ Jorge Araya Navarro

#### Traad: refactorización de código Python con rope.


  Referencias a ropemacs fueron borradas de la configuración. YASnippet
  ahora se inicia per buffer. `M-y` es el atajo de teclado para
  `helm-show-kill-ring`. Las secuencias de escape dentro de cadenas de
  texto tienen un color más vistoso. `global-auto-revert-mode` es
  encendido de manera automática.

~ Jorge Araya Navarro

#### Arreglos en el tema del blog.


~ Jorge Araya Navarro

#### Usando un nombre menos problematico.


~ Jorge Araya Navarro

#### Corrección menor.


~ Jorge Araya Navarro

#### Plantillas del blog modificadas.


~ Jorge Araya Navarro

#### Mustache-mode instalado.


~ Jorge Araya Navarro

#### Org-webpage reemplaza a EGO.


~ Jorge Araya Navarro

#### Mejoras en shackra/ispell-switch.


~ Jorge Araya Navarro

#### Funcionalidad implementada.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-helm-projectile' into develop.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores en twittering-mode.


~ Jorge Araya Navarro

#### Arreglo menor.


~ Jorge Araya Navarro

#### Merge branch 'caracteristica-rust' into develop.


~ Jorge Araya Navarro

#### Kill-or-bury-alive mata buffers con rust-mode.


  No pareciera estar heredando del modo mayor `prog-mode` por lo que se
  tuvo que especificar explícitamente en
  `kill-or-bury-alive-must-die-list` para que los buffers que visitan
  archivos rust sean cerrados al presionar C-x k.

  Enlaces abreviados para el sitio de torrents Kickass Torrent definidos,
  ahora un enlace para buscar una película en KAT es tan simple como
  escribir `[[katpelicula:Inside Out][Buscar la pelicula Inside Out en
  KAT]]`, entre otros cambios menores.

~ Jorge Araya Navarro

#### Agregando soporte para Rust.


  Y cambios convenientes para org-mode

~ Jorge Araya Navarro

#### Arreglo en appt y adición de Sese.


  La función usada para avisar de citas fue arreglado, ahora appt no
  tendrá problemas de funcionamiento.

  Simple Emacs-based Subtitle Editor fue agregado.

~ Jorge Araya Navarro

#### Restaurando el tamaño para Symbola.


  Algunos caracteres que se renderizan con la tipografía Symbola puede que
  se vean muy pequeños. Su tamaño ha sido aumentado para corregir este
  posible defecto.

~ Jorge Araya Navarro

#### Cambios en la configuración de kill-or-bury-alive.


  Todos los buffers de modos mayores de programación y edición de texto
  son matados gracias a los cambios en el código del paquete
  kill-or-bury-alive.

~ Jorge Araya Navarro

#### Merge branch 'caracteristica-python3' into develop.


~ Jorge Araya Navarro

#### Requiriendo `visual-regexp-steroids`


  Por alguna extraña razón hay que usar `require` con
  `visual-regexp-steroids` porque de otra manera no se activan las
  funcionalidades proporcionadas por el paquete.

~ Jorge Araya Navarro

#### Documentación con eldoc-mode.


  eldoc-mode es activado en python-mode para mostrar la firma de las
  funciones u otra documentación. Desactivado `:tangle` para un bloque de
  codigo elisp en la configuración.

~ Jorge Araya Navarro

#### Corrección menor.


~ Jorge Araya Navarro

#### Merge branch 'arreglo-helm-projectile'


~ Jorge Araya Navarro

#### `helm-projectile` incluido en la configuración.


  Por alguna extraña razón estaba esperando que
  `helm-projectile-find-file` funcionara adecuadamente sin tener el
  paquete `helm-projectile` instalado

~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.1'


~ Jorge Araya Navarro

#### Arreglo de las notificaciones de la agenda.


~ Jorge Araya Navarro

#### Cambiando de tipografía (Monoid)


~ Jorge Araya Navarro

#### Verificación correcta de certificados SSL.


~ Jorge Araya Navarro

#### Arreglos menores para multi-term.


~ Jorge Araya Navarro

#### Mejoras en multi-term para ser más productivo.


~ Jorge Araya Navarro

#### Nuevos paquetes añadidos.


  `systemd` para editar archivos .service de systemd y
  `kill-or-bury-alive` para matar esos molestos buffers o enterrarlos
  según se necesite

~ Jorge Araya Navarro

#### Pequeños cambios en hydra-win.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Habilitando winner-mode.


~ Jorge Araya Navarro

#### Arreglo rápido.


~ Jorge Araya Navarro

#### Merge branch 'caracteristica-seguridad' into develop.


~ Jorge Araya Navarro

#### SSL correctamente configurado, AFAIK.


  fixes #4

  Sin embargo, las peticiones a sitios web que tienen certificados auto
  firmados **no** fallan como se (supone?) falló con los certificados para
  el sitio web equivocado.

~ Jorge Araya Navarro

#### Configurado.


  Sin embargo, según las pruebas algo no se hizo bien. Una pregunta en
  Stackexchange de Emacs fue abierta para recibir asistencia
  http://emacs.stackexchange.com/q/18079/690

~ Jorge Araya Navarro

#### Eliminando archivo innecesario.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.0' into develop.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-1.0'


  Mi primer versión "estable" de mi configuración de Emacs \o/

~ Jorge Araya Navarro

#### Aumentando el nivel del índice de contenido.


~ Jorge Araya Navarro

#### Re-organización del archivo de configuración.


~ Jorge Araya Navarro

#### Merge branch 'publicacion-master'


~ Jorge Araya Navarro

#### Arreglos rápidos y desactivación de Jabber.el.


~ Jorge Araya Navarro

#### Más modos mayores y menores.


  comentada la linea en Jabber.el referente a la variable `fsm-debug` para
  diagnosticar lo que este evitando que Jabber.el cargue de manera correcta.

~ Jorge Araya Navarro

#### Cambios menores en org-capture.


~ Jorge Araya Navarro

#### Código Python y shell ejecutable en org-babel.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Alias para tumblesocks y twittering-mode.


~ Jorge Araya Navarro

#### Twittering-mode - Twitter. Tumblesocks - Tumblr.


  Redes sociales desde Emacs

~ Jorge Araya Navarro

#### Cambios en las plantillas para org-capture.


~ Jorge Araya Navarro

#### Actualizando el código de EGO.


~ Jorge Araya Navarro

#### Migrando de org-page a EGO.


~ Jorge Araya Navarro

#### Generar estatico de sitios web agregado.


~ Jorge Araya Navarro

#### Correcciones para dired.


  Los directorios son agrupados en la parte de arriba del buffer.

~ Jorge Araya Navarro

#### Mejoras para dired-mode.


~ Jorge Araya Navarro

#### Hydra para avy. vimish-fold agregado.


~ Jorge Araya Navarro

#### Cambios en hydra-win y correcciones menores.


  el hydra para dividir y moverse entre ventanas ahora usa las teclas WASD
  e IJKL para re-dimensionar las ventanas y cambiar el foco de
  ventana (respectivamente).

  El problema de la macro `use-package` que no ataba la combinación de
  teclas C-M-, con el comando `comment-dwim` para Python-mode debería
  estar resuelto ahora usando la función `(bind-key)`.

~ Jorge Araya Navarro

#### Ycmd.


~ Jorge Araya Navarro

#### Modo para editar archivos PKGBUILD añadido.


~ Jorge Araya Navarro

#### Ignorando otros buffers (magit y anaconda)


~ Jorge Araya Navarro

#### Varios paquetes extras para Git.


  Ya que voy a estar trabajando en grupo en
  https://github.com/Team-VerseBot pienso que es hora de ponerme serio con
  algunos paquetes que extienden magit.

  También he incluido algunos paquetes para Mercurial, como hgignore-mode
  que es un modo mayor para editar archivos .hgignore.

~ Jorge Araya Navarro

#### Hydra-win se ejecuta luego de dividir ventanas.


~ Jorge Araya Navarro

#### Migrando de Jedi a Anaconda.


  Jedi comenzó a dar problemas porque no abría su propio proceso inferior
  de Python con el cual se supone que debe sacar los candidatos para el auto-completado.

~ Jorge Araya Navarro

#### Corrigiendo error de logica.


~ Jorge Araya Navarro

#### Mejoras en multi-term y migración de Pymacs.


~ Jorge Araya Navarro

#### Desapareciendo projectile del mode-line.


~ Jorge Araya Navarro

#### I-search es reemplazado por swiper.


  ¡Zorro, no te lo lleves!

~ Jorge Araya Navarro

#### Implementando el uso de hydra.


  Haciendo combinaciones de teclas fáciles de repetir usando hydra, hay un
  hydra para `multiple-cursors`, otro para `python-mode` (para el
  sangrado de bloques de código) y otro para manejar ventanas dentro
  de un marco de Emacs (para ver un demo grabado por el creador de hydra,
  ir a https://youtu.be/_qZliI1BKzI ).

~ Jorge Araya Navarro

#### FlyCheck estaba colado en custom.el.


~ Jorge Araya Navarro

#### Actualizando el archivo léame.


~ Jorge Araya Navarro

#### Varias migraciones importantes.


  Creo que a partir de aquí podemos fusionar con la rama master y usar
  esta configuración. Otras cosas que quizás yo necesite las puedo agregar
  después

~ Jorge Araya Navarro

#### Problema con text-mode arreglado.


~ Jorge Araya Navarro

#### Migrado telephone-line y sane defaults.


~ Jorge Araya Navarro

#### Jedi y company{-jedi} migrado.


~ Jorge Araya Navarro

#### Migrado org-mode y visual-fill-column.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Varias secciones migradas, incluyendo helm.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Otro paquete borrado.


~ Jorge Araya Navarro

#### Eliminando un paquete.


~ Jorge Araya Navarro

#### Correcciones menores.


~ Jorge Araya Navarro

#### Fragmento faltante en telephone-line.


  Ahora los modos menores se muestran en el mode-line

~ Jorge Araya Navarro

#### Modificado el mode-line de telephone-line.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Agrengando telephone-line, pero desactivado.


~ Jorge Araya Navarro

#### Cambiando la shell para multi-term.


~ Jorge Araya Navarro

#### Borrando CEDET, agregando profile como submodulo.


~ Jorge Araya Navarro

#### Agregando `shrink-whitespace`


~ Jorge Araya Navarro

#### Secciones recuperadas de la configuración.


  Por alguna extraña razón, estaban borradas algunas partes de la
  configuración, quizás se perdieron cuando cambiaba la jerarquía de los
  títulos en el archivo de configuración.

  La configuración esta un poco más documentada y limpia. Todo esta bien,
  por el momento.

~ Jorge Araya Navarro

#### Modificando los caracteres del mode-line.


  También he realizado algo de limpieza, algunos fragmentos de código
  fueron movidos a otros sitios. Aunque aun falta modificar/aumentar la
  documentación en algunas áreas (donde haga falta, claro)

~ Jorge Araya Navarro

#### Eliminando discover-my-majors.


  Eso ya esta cubierto por helm-descbinds (C-h b)

~ Jorge Araya Navarro

#### Agregando más paquetes útiles y cambios menores.


~ Jorge Araya Navarro

#### Configuración para Langtool desactivada.


~ Jorge Araya Navarro

#### Añadiendo alias para algunos comandos.


~ Jorge Araya Navarro

#### Re-habilitando Jabber.


~ Jorge Araya Navarro

#### Super mejoras para mu4e.


~ Jorge Araya Navarro

#### Cambios para mu4e.


~ Jorge Araya Navarro

#### Agregando submódulo multimu4e.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambiando comando de mu4e para recoger el correo.


~ Jorge Araya Navarro

#### Mejoras en dired.


~ Jorge Araya Navarro

#### Cambio en Dired.


  Por defecto usara el mismo buffer para diferentes directorios. En estos
  casos nunca usar RET para ir a otra carpeta si se tienen archivos
  marcados, en su lugar usar C-x d

~ Jorge Araya Navarro

#### Eliminando adoc-mode, arreglando langtool.


~ Jorge Araya Navarro

#### Eliminando temporalmente python-mode.el.


  Debido a este error https://github.com/company-mode/company-mode/issues/377

~ Jorge Araya Navarro

#### Fm-bookmarks instalado.


~ Jorge Araya Navarro

#### Modificaciones menores.


~ Jorge Araya Navarro

#### AUCTeX para la edición de documentos LaTeX.


  Con su respectiva configuración ideal

~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Borrando restos de anaconda-mode.


~ Jorge Araya Navarro

#### Reemplazando anaconda-mode con jedi.el.


~ Jorge Araya Navarro

#### Actualizando la configuración y la lista de paquetes instalados.


~ Jorge Araya Navarro

#### Ignora los errores al tratar de establecer una tipografía que no existe en el sistema.


~ Jorge Araya Navarro

#### Acomodando la configuración de el Python-mode de F. Gallina.


~ Jorge Araya Navarro

#### Imenu+ removido: afecta el correcto funcionamiento de helm-imenu.


~ Jorge Araya Navarro

#### Modificaciones menores en la configuración.


~ Jorge Araya Navarro

#### Las etiquetas script van antes de la etiqueta de cierre de body.


~ Jorge Araya Navarro

#### Agregando Google Analytics a la plantilla, también Sharethis.


~ Jorge Araya Navarro

#### Eliminando el fondo de las palabras clave TODO de org-mode.


~ Jorge Araya Navarro

#### Tema cambiado por emacs-material-theme.


~ Jorge Araya Navarro

#### Desactivando company-quickhelp temporalmente.


~ Jorge Araya Navarro

#### Algunos ganchos ahora contienen funciones declaradas en lugar de funciones anónimas con lambdas.


~ Jorge Araya Navarro

#### Algunos paquetes no están ya disponibles en los repositorios activados de Melpa, por lo que la lista de paquetes fue regenerada sin ellos.


~ Jorge Araya Navarro

#### Tratando de evitar que sh-mode rompa las lineas al llegar al extremo derecho del documento.


~ Jorge Araya Navarro

#### Listando nuevos paquetes instalados.


~ Jorge Araya Navarro

#### Company ahora usa racer para auto completar código en Rust. Company tiene muchas adiciones como estadisticas y popups con documentación.


~ Jorge Araya Navarro

#### Usando (format-spec) en lugar de (format) al colocar el nombre del proyecto dentro de la licencia GPLv3.


~ Jorge Araya Navarro

#### Acción para ver correos HTML en el navegador agregada a mu4e.


~ Jorge Araya Navarro

#### Corrigiendo error en la configuración luego de borrar eyebrowse.


~ Jorge Araya Navarro

#### Algunos paquetes borrados con package-safe-delete y eliminados de la configuración de Emacs.


~ Jorge Araya Navarro

#### Definición personalizada para python-mode para header2.el.


~ Jorge Araya Navarro

#### Agregando paquetes header2 y helm-flycheck.


~ Jorge Araya Navarro

#### Melpa estable ahora es nuestro único repositorio de paquetes de Emacs. El archivo de configuración ahora se llama `configuracion.org`


~ Jorge Araya Navarro

#### Removido Melpa por contener paquetes desactualizados.


~ Jorge Araya Navarro

#### Agregando archivo para ignorar.


~ Jorge Araya Navarro

#### Arreglando nombre de argumento.


~ Jorge Araya Navarro

#### Cambiando el nombre de la aplicación que hace la llamada de aviso; de "emacs" a "Emacs: Org"


~ Jorge Araya Navarro

#### Configurando "appointments" con org-mode.


~ Jorge Araya Navarro

#### Agregando un atajo de teclado para elfeed.


~ Jorge Araya Navarro

#### Avy-jump y elfeed instalados.


~ Jorge Araya Navarro

#### Asignando un atajo de teclado al comando twittering-favorite.


~ Jorge Araya Navarro

#### Eliminado el paquete ledger-mode.


~ Jorge Araya Navarro

#### Configuración de teclas para algunos modos menores, activación de modos menores, cambios en la configuración de Helm, nlinum y hlinum ahora son activados en todos los modos mayores que tengan relación a la programación, otros cambios menores.


~ Jorge Araya Navarro

#### Desactivados powerline y smart-modeline.


~ Jorge Araya Navarro

#### Configuración de py-autopep8 actualizada.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Twittering-mode y sx.el agregados a Emacs.


~ Jorge Araya Navarro

#### Ignorando archivos en ~/.emacs.d/.sx.


~ Jorge Araya Navarro

#### Estableciendo el apodo por defecto para los chats grupales en jabber.


~ Jorge Araya Navarro

#### Nueva cuenta de Jabber.


~ Jorge Araya Navarro

#### Creando atajos a "maildirs"


~ Jorge Araya Navarro

#### Archivo cifrado fue borrado.


~ Jorge Araya Navarro

#### Olvidé borrar el archivo cifrado con credenciales para mediawiki.el lolfail.


~ Jorge Araya Navarro

#### Borrando archivos cifrados con GPG.


~ Jorge Araya Navarro

#### Las credenciales para conectarse a Jabber ahora son obtenidas del llavero por los medios que Emacs ofrece.


~ Jorge Araya Navarro

#### Find-file-sudo ha sido corregido para invocarse solo cuando el archivo existe, y no pueda ser modificado por el usuario actual.


~ Jorge Araya Navarro

#### Agregando favicon.


~ Jorge Araya Navarro

#### Formateo con CSS para la clase "figure" generado por org-mode para imagenes con descripción.


~ Jorge Araya Navarro

#### Activando winner-mode.


~ Jorge Araya Navarro

#### Cambios en los colores de los estados TODO.


~ Jorge Araya Navarro

#### El historial de archivos es guardado cuando un frame de Emacs es cerrado.


~ Jorge Araya Navarro

#### Activando de vuelta powerline-mode.


~ Jorge Araya Navarro

#### Desactivando powerline por error (ver https://github.com/jonathanchu/emacs-powerline/issues/31 )


~ Jorge Araya Navarro

#### Cambiando opciones para tema de actual.


~ Jorge Araya Navarro

#### Activación de nuevo tema, mejoras en el script de Python que genera la lista de paquetes instalados.


~ Jorge Araya Navarro

#### Unkillable-scratch fue instalado y activado en la configuración.


~ Jorge Araya Navarro

#### Cambios menores.


~ Jorge Araya Navarro

#### Nuevas funciones para generar mi blog fueron agregadas.


~ Jorge Araya Navarro

#### Tema del blog agregado.


~ Jorge Araya Navarro

#### Helm-mini debe ser usado en lugar de switch-to-buffer.


~ Jorge Araya Navarro

#### Deshabilitando dos módulos de org-mode.


~ Jorge Araya Navarro

#### Otra carpeta más filtrada de la lista de paquetes a instalar.


~ Jorge Araya Navarro

#### Carpetas que no pertenecen a ningún paquete de MELPA son ignorados de la lista de paquetes a instalar.


~ Jorge Araya Navarro

#### La fecha de modificación de los archivos org y elisp son verificados para indicarle a Emacs qué hacer si uno es más nuevo que otro o el otro no existe.


~ Jorge Araya Navarro

#### Error en script de Python corregido, algunos paquetes no tienen una raya seguidos luego por su versión.


~ Jorge Araya Navarro

#### Al intentar abrir un archivo cuyo dueño es el super-usuario, Emacs trata de abrirlo inmediatamente como root.


~ Jorge Araya Navarro

#### Lua-mode agregado, tema para org-mode removido.


~ Jorge Araya Navarro

#### Js2-mode es usado para editar archivos JavaScript.


~ Jorge Araya Navarro

#### Funciones para visitar archivos y cambiar de buffer personalizadas fueron agregadas.


~ Jorge Araya Navarro

#### Cambiar el tema de powerline cada vez que una consola era creada dentro de emacs fue una mala idea.


~ Jorge Araya Navarro

#### Limpiando el código de configuración para jabber.el.


~ Jorge Araya Navarro

#### Undo-tree esta activado de manera global de forma automática.


~ Jorge Araya Navarro

#### Rainbow-mode se activa automáticamente para todos los modos de programación.


~ Jorge Araya Navarro

#### Cuando un emulador de terminal es creado dentro de emacs, el tema de powerline cambia a algo más sencillo.


~ Jorge Araya Navarro

#### Algunos cambios no muy importantes.


~ Jorge Araya Navarro

#### Nuevos paquetes instalados!


~ Jorge Araya Navarro

#### Adoc-mode.


~ Jorge Araya Navarro

#### El comando `mu4e` a sido asociado a la tecla <f7>


~ Jorge Araya Navarro

#### Borrado paquete innecesario que se puede instalar desde ELPA.


~ Jorge Araya Navarro

#### Cambios en web-mode para hacer la experiencia de diseño web en emacs mas amena.


~ Jorge Araya Navarro

#### Actualizada la lista de paquetes instalados en Emacs.


~ shackra

#### Electric-pair-mode esta mejor que autopair-mode, entonces se puede hacer el cambio.


~ shackra

#### Actualizado la configuración de helm-mode.


~ shackra

#### Activando org-habit por medio de los cambios a org-modules.


~ shackra

#### Requiriendo org-habit.


~ shackra

#### Arreglando error con la tecla RET que se usa para desactivar iedit cuando se esta usando iedit-mode.


~ shackra

#### Las cuentas de correo para mu4e así como las credenciales para usar con mediawiki.el se cargan solamente si Emacs corre como demonio (esto debería hacer el arranque de Emacs más rápido si no se inicia como demonio)


~ shackra

#### Agregando el paquete iedit, cambiando el comportamiento de iedit. Ignorar errores al momento de cargar archivos GPG que contienen configuración alguna.


~ shackra

#### Lista de paquetes instalados en Emacs, actualizada.


~ shackra

#### Jabber.el ahora usa libnotify para las notificaciones.


~ shackra

#### Habilitando `sh` para org-babel.


~ shackra

#### Cambios menores.


~ shackra

#### Cambios en uno de los ganchos de jabber.el.


~ shackra

#### No abre la agenda luego de iniciar emacs.


~ shackra

#### Corrigiendo error con la ubicación del tema jazz.


~ shackra

#### Lista de paquetes actualizada.


~ shackra

#### Nuevo tema "Jazz" es puesto en uso.


~ shackra

#### Actualizando configuración a pedido de Tu Do ( http://emacs.stackexchange.com/questions/3724/how-to-make-helm-stop-when-tramp-asks-me-for-my-password?noredirect=1#comment5499_3724  )


~ shackra

#### Ignorando un buffer que no puedo desactivar.


~ shackra

#### Integrando ace-window en la configuración.


~ shackra

#### Archivo olvidado.


~ shackra

#### Requiriendo wikimedia, cambiando a https algunos sitios Mediawiki, actualizando la lista de paquetes.


~ shackra

#### Configuración para sitios Mediawiki, arreglos en langtool.


~ shackra

#### Error con flymake y eldoc en elpy-mode solucionado.


~ shackra

#### Desactivando temporalmente el gancho para las notificaciones de jabber.


~ shackra

#### Corrigiendo fallos en la configuración.


~ shackra

#### Cambiando el método de notificación para notify.el.


~ shackra

#### Varios arreglos en la configuración.


~ shackra

#### Org-mode capture con una opción más para escribir anotaciones.


~ shackra

#### Ignorando carpetas que creadas por jabber.el.


~ shackra

#### Visual-line-mode se usa en lugar de auto-fill. Algunas partes de la configuración han sido puestas en revision.


~ shackra

#### Eliminando una fuente de paquetes.


~ shackra

#### Jabber.el funciona adecuadamente.


~ shackra

#### Borrado submodulo ELIM.


~ shackra

#### Agregando submodulo ELIM.


~ shackra

#### Asignando la nueva función a una combinación de teclas.


~ shackra

#### Función para insertar combinación de teclas entre etiquetas <kbd>


~ shackra

#### Restituyendo el gancho para org-mode.


~ shackra

#### El archivo bookmarks no deberia ser manejado por Git.


~ shackra

#### Limpiando el desastre.


~ shackra

#### Uniendo dos cambios distintos cambios.


~ shackra

#### Flyspell ahora ignora algunas partes de org-mode!


~ shackra

#### Auto-fill-mode desactivado en org y muse.


~ shackra

#### Agregando una archivo léame.


~ shackra

#### Pelicuas -> Películas, duh.


~ shackra

#### Las teclas para las plantillas de org-mode capture no pueden ser dobles (si se piensan usar desde el menu que ofrece C-c c)


~ shackra

#### Se implementaron nuevas plantillas de captura de anotaciones para org-mode.


~ shackra

#### Problema con org-capture resuelto!


~ shackra

#### Cambios en mu4e.


~ shackra

#### Un comando más inteligente para retornar al inicio de la linea!


~ shackra

#### Agregando history a la lista de archivos/carpetas ignorados.


~ shackra

#### Cambiando la lista en cabeceras.


~ shackra

#### Extendiendo dired.


~ shackra

#### Habilitando Python en Babel.


~ shackra

#### Agregando undo-tree, cambiando la configuración y uniendo varias partes de la configuración en un sólo bloque de código fuente.


~ shackra

#### Cambios en org-mode.


~ shackra

#### Cambios en la configuración del modo python.


~ shackra

#### Cambios en la configuración.


~ shackra

#### Corrigiendo fallos introducidos en la configuración de org-page.


~ shackra

#### Cambios en la configuración.


~ shackra

#### Se usa use-package para asegurarse que los paquetes estan instalados en la carpeta elpa del usuario.


~ shackra

#### Fragmento de código Python que genera código Elisp y se encarga de instala paquetes faltantes. fix bug #1.


~ shackra

#### Org-page agregado a la configuración.


~ shackra

#### Cambios en org-mode y cambio de tema.


~ shackra

#### Initial-buffer-choice no hace lo que se pensaba que hacía.


~ shackra

#### Agregando archivos para ignorar.


~ shackra

#### El buffer por defecto sera la agenda de Org-mode.


~ shackra

#### Afinando detalles en la configuración así como también corrigiendo errores.


~ shackra

#### Cambios en la configuración.


~ shackra

#### Cambios varios en la configuración!


~ shackra

#### Agregado soporte para golang y rustlang.


~ shackra

#### El archivo custom.el carga antes, todo funciona ahora.


~ shackra

#### Nuevas opciones personalizadas en la configuración.


~ shackra

#### Movida la definición del archivo customize.


~ shackra

#### Eliminando momentaneamente el paquete auto-indent-mode que esta causando fallos en python-mode.


~ shackra

#### Acciones para hacer cuando se salva un archivo.


~ shackra

#### Aumentando la profundidad de índices que en imenu cuando se usa con org-mode.


~ shackra

#### Corrigiendo un error en org-mode que evitaba que el modo se activara correctamente.


~ shackra

#### Cambios menores en la configuración.


~ shackra

#### Submodulo actualizado.


~ shackra

#### Primer commit de mi nueva configuración de GNU Emacs.


~ shackra


