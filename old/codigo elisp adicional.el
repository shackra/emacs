;; * Códigos Elisp
;; funciones de Emacs lisp escritas por mi u otras personas (y que yo he recolectado para mi uso personal)
;; ** Inspector de entradas org-mode
;; Convierte un elemento org-mode bajo el puntero en su equivalente elisp para inspección
(defun org-inspect-element-at-point ()
  "Inspecciona el elemento org-mode en su forma elisp"
  (interactive)
  (let ((body (org-element-context)))
    (switch-to-buffer (get-buffer-create "*org-inspect-element-at-point*"))
    (erase-buffer)
    (insert (format "'%s" body))
    (pp-buffer)))

(defun org-inspect-element-buffer ()
  "Inspecciona todo el documento org-mode en su forma elisp"
  (interactive)
  (let ((body (org-element-parse-buffer)))
    (switch-to-buffer (get-buffer-create "*org-inspect-element-buffer*"))
    (erase-buffer)
    (insert (format "'%s" body))
    (pp-buffer)))

(defun org-inspect-buffer-clocktable ()
  "Inspecciona el documento org-mode en su forma elisp como una tabla org-clock"
  (interactive)
  (let ((body (org-clock-get-table-data (buffer-name) nil)))
    (switch-to-buffer (get-buffer-create "*org-inspect-buffer-clocktable*"))
    (erase-buffer)
    (insert (format "'%s" body))
    (pp-buffer)))

;; ** función para insertar etiquetas <kbd>
;; Gracias a Malabarba en su [[http://emacs.stackexchange.com/a/2208/690][respuesta desde Emacs.stackexchange]].
(defun endless/insert-key (key)
  "Ask for a key then insert its description.
  Will work on both org-mode and any mode that accepts plain html."
  (interactive "kType key sequence: ")
  (let* ((is-org-mode (derived-mode-p 'org-mode))
         (tag (if is-org-mode
                  "@@html:<kbd>%s</kbd>@@"
                "<kbd>%s</kbd>")))
    (if (null (equal key "\r"))
        (insert
         (format tag (help-key-description key nil)))
      (insert (format tag ""))
      (forward-char (if is-org-mode -8 -6)))))
;; ** función para =delete-frame-functions=
(defun shackra-run-delete-frame-hooks (frame)
  "Esta función corre algunas funciones que no son llamadas cuando Emacs
  corre como proceso de segundo plano"
  (when (server-running-p)
    (savehist-save)
    (recentf-save-list)))

(add-hook 'delete-frame-functions 'shackra-run-delete-frame-hooks)
;; ** salva algunos buffers al perder Emacs el foco
;; Sacado de [[http://timothypratley.blogspot.nl/2015/07/seven-specialty-emacs-settings-with-big.html][Programming: Seven specialty Emacs settings with big payoffs]]

(defun guardar-todo ()
  (interactive)
  (save-some-buffers t))

;; uso:
;; (add-hook 'focus-out-hook #'guardar-todo)
;; ** No molestes, Shia LaBeouf!
(defun shackra-org-reschedule-tomorrow ()
  "Re-Programa para mañana una tarea que pude hacer hoy"
  (interactive)
  (org-schedule :time (format-time-string "%Y-%m-%d" (time-add (current-time) (seconds-to-time 86400)))))
;; ** =defadvice= temporal
;; (defmacro my/with-advice (adlist &rest body)
;;   "Execute BODY with temporary advice in ADLIST.

;;   Each element of ADLIST should be a list of the form
;;     (SYMBOL WHERE FUNCTION [PROPS])
;;   suitable for passing to `advice-add'.  The BODY is wrapped in an
;;   `unwind-protect' form, so the advice will be removed even in the
;;   event of an error or nonlocal exit."
;;   (declare (debug ((&rest (&rest form)) body))
;;            (indent 1))
;;   `(progn
;;      ,@(mapcar (lambda (adform)
;;                  (cons 'advice-add adform))
;;                adlist)
;;      (unwind-protect (progn ,@body)
;;        ,@(mapcar (lambda (adform)
;;                    `(advice-remove ,(car adform) ,(nth 2 adform)))
;;                  adlist))))
;; ** usar Emacsclient como git mergetool
(defun shackra-emerge (local remote base output)
  "difftool que se abre en emacsclient"
  (emerge-files-with-ancestor nil local remote base output nil 'shackra-emerge--close-current-frame))

(defun shackra-emerge--close-current-frame ()
  "Cierra el frame actual"
  (delete-frame (selected-frame)))

;; Para hacer que Git use emacsclient como /mergetool/ hay que modificar la configuración de Git
;; [merge]
;; tool = emacsclient
;; [mergetool "emacsclient"]
;; cmd = emacsclient -c -a \"\" --eval \"(shackra-emerge \\\"$LOCAL\\\" \\\"$REMOTE\\\" \\\"$BASE\\\" \\\"$OUTPUT\\\")\"
;; trustExitCode = true

;; ** Generar enlaces de descargas para descargas directas y BitTorrent
(defun shackra-owp-descargas (title hashalist)
  "Enlaces Magnet a HTML."
  (let* ((nuevalista '())
         (nuevoelement (ht-create))
         (uri "")
         (nombre "")
         (tipo "")
         (!torrent)
         (mustache-partial-paths (list (expand-file-name "" user-emacs-directory))))
    ;; recreamos la lista en `hashalist' como una lista ht
    (dolist (e hashalist)
      (setf nombre (car e))
      (setf !torrent (car (cddr e)))
      (if !torrent
          (progn
            (setf uri (car (cdr e)))
            (setf tipo "directa"))
        (progn
          (setf tipo "con BitTorrent")
          (setf uri (format "magnet:?xt=urn:btih:%s&dn=%s&tr=%s"
                            (car (cdr e))
                            (url-hexify-string (car e))
                            (url-hexify-string (concat "udp://tracker.openbittorrent.com:80"
                                                       "&tr=udp://opentor.org:2710"
                                                       "&tr=udp://tracker.ccc.de:80"
                                                       "&tr=udp://tracker.blackunicorn.xyz:6969"
                                                       "&tr=udp://tracker.coppersurfer.tk:6969"
                                                       "&tr=udp://tracker.leechers-paradise.org:6969"))))))
      (ht-set! nuevoelement "nombre" nombre)
      (ht-set! nuevoelement "uri" uri)
      (ht-set! nuevoelement "es-torrent" (not !torrent))
      (ht-set! nuevoelement "tipo" tipo)
      (add-to-list 'nuevalista (ht-copy nuevoelement)))
    (mustache-render "{{> descargas}}" (ht ("hash-alist" nuevalista) ("titulo" title)))))
;; ** Probar si un puerto esta abierto

(defun shackra-port-open-p (server port)
  (let* ((conn nil))
    (condition-case err
        (progn
          (setf conn (open-network-stream "test-port-open" nil server port))
          (stop-process conn)
          t)
      (file-error nil))))

;; ** Comprobar si un modulo Python existe

(defun shackra-python-module-exist-p (module)
  "Retorna `t' si el modulo `MODULE' existe"
  (let ((exists (string-trim (shell-command-to-string (format "python -c 'import pkgutil; print(0 if pkgutil.find_loader(\"%s\") else 1)'" module)))))
    (when (string= exists "0")
      t)))

;; ** Convertir =hh:mm= a formato de punto flotante

(require 'thingatpt)
(require 'rx)

(defvar shackra-time-re (rx (group (one-or-more digit)) ":" (group (one-or-more digit)))
  "Expresión regular que coincide con notacion de tiempo HH:MM")

(defun shackra-time--to-seconds (timestr)
  "Convierte la notacion HH:MM a segundos"
  (unless timestr
    (setf timestr "0:00"))
  (let* ((matchindex (string-match shackra-time-re timestr))
         (hours (string-to-number (match-string 1 timestr)))
         (minutes (string-to-number (match-string 2 timestr))))
    (+ (* 60 (* hours 60)) (* minutes 60))))

(defun shackra-time-to-hours (timestr)
  "Expresa el tiempo en notacion de punto decimal"
  (format "%.3f" (/ (shackra-time--to-seconds timestr) 3600.0)))

(defun shackra-time-at-point-to-hours ()
  "Convierte el tiempo bajo el cursor a notacion decimal, lo copia al portapapeles"
  (interactive)
  (let ((decimal-time (shackra-time-to-hours (thing-at-point 'time))))
    (message decimal-time)
    (kill-new decimal-time)))

(defun time-bounds-of-time-at-point ()
  (save-excursion
    (while (looking-back "[^[:space:]]" 1)
      (backward-char))
    (save-match-data
      (if (looking-at shackra-time-re)
          (cons (point) (match-end 0))
        nil))))

(put 'time 'bounds-of-thing-at-point 'time-bounds-of-time-at-point)

;; ** Apaga el auto sangrado

(defun shackra-electric-indent-mode-off ()
  (electric-indent-local-mode -1)
  (define-key python-mode-map (kbd "RET") 'newline-and-indent)
  ;; Desactiva aggresive-indent si esta instalado y activo
  (when (fboundp 'aggressive-indent-mode)
    (aggressive-indent-mode -1)))

;; ** Palabras (='word=) al principio de linea de =(region-beginning)= y =(region-end)=

(defun shackra-words-region-begin-end (begin end)
  "Retorna una lista con las palabras al principio de linea para `BEGIN' y `END'"
  (interactive "r")
  (save-excursion
    (let ((word1)
          (word2))
      ;; Mueve el cursor al principio de la región
      (goto-char begin)
      (beginning-of-line)
      (setf word1 (thing-at-point 'word t))
      ;; Mueve el cursor al final de la región
      (goto-char end)
      (beginning-of-line)
      (setf word2 (thing-at-point 'word t))
      ;; devuelve el resultado
      `(,word1 ,word2))))

;; ** Division de ventanas y movimiento inmediato del cursor a la nueva ventana
;; Combinaciones de teclas que no pertenecen a ningún paquete en particular.

(defun shackra-split-window-vertically ()
  "Divide la ventana por la mitad verticalmente y mueve el cursor a la ventana nueva"
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun shackra-split-window-horizontally ()
  "Divide la ventana por la mitad horizontalmente y mueve el cursor a la ventana nueva"
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(global-set-key [remap split-window-below] #'shackra-split-window-vertically)
(global-set-key [remap split-window-right] #'shackra-split-window-horizontally)

;; ** Filtro de temas de mi cuaderno de apuntes técnicos

;; configuración para apuntes técnicos
(defvar shackra-custom-engineer-notebook "~/Documentos/cosas tecnicas/apuntes tecnicos.org"
  "ubicación del archivo de apuntes técnicos")

(defvar shackra-technotes-search-engine-url "https://duckduckgo.com/?q="
  "Motor de busqueda para encontrar coincidencias sobre determinada frase")

(defvar shackra-technotes-rx-url (rx bol "http" (optional "s") ":" (repeat 2 "/"))
  "expresión regular para comprobar si una cadena es una URL")

(defun shackra--kill-this-buffer ()
  "Mata el buffer actual y borra la ventana"
  (interactive)
  (kill-this-buffer)
  (delete-window))

(defun shackra--technotes-action (entry)
  "Abre un enlace en `entry' apropiadamente"
  (let* ((url (get-text-property 0 'property entry)))
    (progn
      (org-link-open-from-string url)
      (unless (string-match-p shackra-technotes-rx-url url)
        (with-current-buffer (file-name-nondirectory shackra-custom-engineer-notebook)
          (org-narrow-to-element)
          (org-cycle)
          ;; Cierra el buffer de `shackra-custom-engineer-notebook'
          (use-local-map (copy-keymap org-mode-map))
          (local-set-key "q" 'shackra--kill-this-buffer)
          (read-only-mode))))))

(defun shackra--technotes-source (string &optional predicate flag)
  (let ((collection))
    (with-current-buffer (find-file-noselect shackra-custom-engineer-notebook)
      (goto-char (point-min))
      ;; Se dirige al primer encabezado
      (goto-char (re-search-forward "^*"))
      (set-mark (line-beginning-position))
      (goto-char (point-max))
      (setf collection
            (org-map-entries
             (lambda ()
               (let ((entry '())
                     (link (org-store-link 0))
                     (tags (map 'list (lambda (x) (concat "#" x)) (split-string (or (nth 5 (org-heading-components)) "") ":" t " "))))
                 (setf entry `(,(concat (nth 4 (org-heading-components)) " " (string-join tags " ")) . ,link))
                 (deactivate-mark)
                 entry)))))
    (setf collection (cl-remove-if-not (lambda (element) (string-match-p (counsel--elisp-to-pcre (ivy--regex-ignore-order string)) (car element))) collection))
    (add-to-list 'collection `(,(concat "Buscar en la web: " string) . ,(concat shackra-technotes-search-engine-url (url-encode-url string))) t)
    (cl-map 'list (lambda (elemt) (propertize (car elemt) 'property (cdr elemt))) collection)))

(defun shackra-technotes ()
  "Consulta una entrada de mis apuntes técnicos"
  (interactive)
  (ivy-read "Consultar> " #'shackra--technotes-source :action 'shackra--technotes-action :require-match t :dynamic-collection t :caller 'shackra-technotes))

(global-set-key (kbd "C-c T") #'shackra-technotes)

;; ** Nivel de sangrado para desarrollo web
;; Varios modos mayores que uso para desarrollo web tienen para personalizar el nivel de sangrado. Para todos quiero usar el mismo nivel de sangrado pero también quiero cambiarlo cuando así lo desee sin tener que rastrear las varias en la configuración.

(defvar shackra-webdev-indent 2 "Nivel de sangrado para desarrollo web")

;; ** Matar buffers de forma inmediata

(unbind-key "C-x k" global-map)
(define-key global-map (kbd "C-x k") 'kill-this-buffer)

;; ** Desactivar lsp-mode cuando se activa múltiples cursores
;; He notado un grave descenso de la responsividad de Emacs cuando estoy usando iedit-mode o multiple-cursors mientras lsp-mode esta activo. Aparentemente el problema radica en =lsp-on-change= ejecutandose en cada cambio hecho al buffer a traves del gancho =after-change-functions=, esta función hace solicitudes a un servidor RPC lo cual por alguna razón congela Emacs.

;; La mejor solución seria quitar la función de los ganchos temporalmente.

(defvar-local shackra--lsp-on-change-exist nil
  "indica si la función `lsp-on-change' estaba insertada en `after-change-functions'")

(defun shackra-lsp-on-change-modify-hook ()
  "Remueve o agrega `lsp-on-change' de `after-change-functions'"
  (if (not shackra--lsp-on-change-exist)
      ;; quita la función, solamente si estaba insertada desde un principio
      (when (memq 'lsp-on-change after-change-functions)
        (setf shackra--lsp-on-change-exist t)
        (remove-hook 'after-change-functions 'lsp-on-change t))
    ;; agrega la función
    (add-hook 'after-change-functions #'lsp-on-change nil t)
    (setf shackra--lsp-on-change-exist nil)))

;; ** Ubicación de ditaa

(setf org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")

;; ** Ayudante para modificar =eglot-server-programs=

(defun shackra-modify-eglot-apply (major-mode symbol &rest params)
  "Retorna un cons sea SYMBOL o una combinacion de `(car symbol)' y PARAMS si SYMBOL coincide con MAJOR-MODE."
  (let* ((head (car symbol)))
    (if (or (and (listp head) (memq major-mode head))
            (eq head major-mode))
        (progn (dolist (param params)
                 (setf head (cons head param)))
               head)
      symbol)))

(defun shackra-modify-eglot (major-mode &rest params)
  "Modifica `eglot-server-programs' con una nueva lista de parametros dados por PARAMS para el modo mayor MAJOR-MODE."
  (mapcar (lambda (element) (funcall #'shackra-modify-eglot-apply major-mode element params)) eglot-server-programs))
