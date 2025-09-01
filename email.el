(setq user-mail-address "jorge@esavara.cr")
(setq message-signature "Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")

(defun shackra/mu4e-compose-goodies ()
  "Settings for mu4e compose mode."
  (set-fill-column 72)
  (turn-on-auto-fill)
  (electric-indent-local-mode -1)
  (jinx-mode 1))

(leaf mu4e-query
  :leaf-defer nil
  :require t
  :straight (mu4e-query :type git :host github :repo "mickeynp/mu4e-query"))

(leaf mu4e-contrib
  :preface
  (defun shr-no-colourise-region (&rest ignore))
  :custom
  (mu4e-html2text-command . 'mu4e-shr2text)
  (shr-color-visible-luminance-min . 60)
  (shr-color-visible-distance-min . 5)
  :advice
  (:around shr-colorize-region shr-no-colourise-region))

(leaf mu4e
  :preface
  (load-file "~/.emacs.d/email-utils.el")

  (defun mi/mu4e-push-mail-al-salir (&rest _args)
    "Llama a mbsync --push --all al salir de mu4e."
    (start-process-shell-command "mbsync-push" "*mbsync-push*"
				 "mbsync --push --all"))

  (defun my/mu4e~headers-human-date (msg)
    "Mostrar fecha sin año si es del año actual; caso contrario, con año."
    (let* ((date (mu4e-msg-field msg :date))
           (tm   (decode-time date))
           (cur  (decode-time (current-time)))
           (day  (nth 3 tm))
           (mon  (nth 4 tm))
           (year (nth 5 tm))
           (cyr  (nth 5 cur)))
      (if (= year cyr)
          (format-time-string mu4e-headers-time-format date)
	(format-time-string mu4e-headers-date-format date))))
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  :bind
  ("C-c u"	.	mu4e)
  (:mu4e-main-mode-map
   ("x"		.	bury-buffer)
   ("I"		.	mu4e-update-index)
   ("<tab>"	.	shr-next-link)
   ("<backtab>" .	shr-previous-link))
  (:mu4e-headers-mode-map
   ("M"		.	mu4e-headers-mark-all)
   ("N"		.	mu4e-headers-mark-all-unread-read))
  :hook
  (mu4e-compose-mode-hook . shackra/mu4e-compose-goodies)
  :advice
  (:override mu4e~headers-human-date my/mu4e~headers-human-date)
  (:after mu4e-quit mi/mu4e-push-mail-al-salir)
  :custom
  (gnus-article-date-headers		.	'(combined-local-lapsed))
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  (mu4e-maildir				.	"~/Maildir")
  (mu4e-get-mail-command		.	`,(concat (executable-find "mbsync") " --push --all")) ;; no adquiere nuevo email, solo empuja los cambios locales
  (mu4e-update-interval			.	nil)
  (mu4e-attachment-dir			.	"~/Descargas")
  (mu4e-change-filenames-when-moving	.	t) ;; requerido por mbsync
  (mail-user-agent			.	'mu4e-user-agent)
  (message-citation-line-function	.	'message-insert-formatted-citation-line)
  (mu4e-compose-format-flowed		.	t)
  (mu4e-headers-auto-update		.	t)
  (mu4e-headers-date-format		.	"%d/%m/%Y %H:%M")
  (mu4e-index-cleanup			.	t)
  (mu4e-index-lazy-check		.	nil)
  (mu4e-main-hide-personal-addresses	.	t)
  (mu4e-main-buffer-name		.	"*mu4e-main*")
  (mu4e-use-fancy-chars			.	t)
  (sendmail-program			.	`,(executable-find "msmtp"))
  (message-sendmail-f-is-evil		.	t)
  (message-sendmail-extra-arguments	.	'("--read-envelope-from"))
  (message-send-mail-function		.	#'message-send-mail-with-sendmail)
  (send-mail-function			.	#'message-send-mail-with-sendmail)
  (message-signature			.	"Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")
  (mu4e-context-policy			.	'pick-first) ;; start with the first (default) context;
  (mu4e-compose-context-policy		.	'ask) ;; ask for context if no context matches;
  (message-kill-buffer-on-exit		.	t)
  ;; optional
  ;; store link to message if in header view, not to header query:
  (org-mu4e-link-query-in-headers-mode	.	nil)
  ;; don't have to confirm when quitting:
  (mu4e-confirm-quit			.	nil)
  ;; number of visible headers in horizontal split view:
  (mu4e-headers-visible-lines		.	5)
  ;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:
  (mu4e-hide-index-messages		.	t)
  ;; customize the reply-quote-string:
  (message-citation-line-format		.	"El %A %d de %B del %Y, %N escribió:\n")
  ;; M-x find-function RET message-citation-line-format for docs:
  (message-citation-line-function	.	'message-insert-formatted-citation-line)
  ;; by default do show related emails:
  (mu4e-search-include-related		.	nil)
  ;; omite duplicados
  (mu4e-search-skip-duplicates		.	t)
  (mu4e-headers-attach-mark		.	`("a" . ,(propertize "@" 'face '(:foreground "gold" :weight bold))))
  (mu4e-headers-calendar-mark		.	`("c" . ,(propertize "%" 'face '(:foreground "deep sky blue"))))
  (mu4e-headers-draft-mark		.	`("D" . ,(propertize "*" 'face '(:foreground "orange" :slant italic))))
  (mu4e-headers-encrypted-mark		.	`("x" . ,(propertize "?" 'face '(:foreground "medium purple" :weight bold))))
  (mu4e-headers-flagged-mark		.	`("F" . ,(propertize "+" 'face '(:foreground "red" :weight bold))))
  (mu4e-headers-list-mark		.	`("l" . ,(propertize "L" 'face '(:foreground "forest green"))))
  (mu4e-headers-new-mark		.	`("N" . ,(propertize "!" 'face '(:foreground "orange red" :weight bold))))
  (mu4e-headers-passed-mark		.	`("P" . ,(propertize ">" 'face '(:foreground "gray"))))
  (mu4e-headers-personal-mark		.	`("p" . ,(propertize "y" 'face '(:foreground "light sea green" :slant italic))))
  (mu4e-headers-replied-mark		.	`("R" . ,(propertize "R" 'face '(:foreground "steel blue" :weight bold))))
  (mu4e-headers-seen-mark		.	`("S" . ,(propertize "]" 'face '(:foreground "gray55"))))
  (mu4e-headers-signed-mark		.	`("s" . ,(propertize "{" 'face '(:foreground "green4" :weight bold))))
  (mu4e-headers-trashed-mark		.	`("T" . ,(propertize "X" 'face '(:foreground "firebrick" :weight bold))))
  (mu4e-headers-unread-mark		.	`("u" . ,(propertize "[" 'face '(:foreground "dodger blue" :weight bold))))
  (mu4e-headers-date-format		.	"%-d %b %Y") ; e.g., "3 mar 2024" (con año)
  (mu4e-headers-time-format		.	"%-d %b") ; e.g., "3 mar"
  ;; marcadores con consultas mu

  ;; encabezados estilo gmail
  (mu4e-headers-fields			.	'((:human-date  . 12)
						  (:flags	. 7)
						  (:from	. 30)
						  (:subject	. 92)))
  :setq
  (shackra-query-one-of . '(one-of "emacs-devel@gnu.org" "help-gnu-emacs@gnu.org" "mu-discuss@googlegroups.com" "golang-nuts@googlegroups.com" "python-list@python.org"))
  (shackra-query-mailing-lists . `(contact ,shackra-query-one-of))
  (shackra-query-maildir-trash . '(or (flag trashed) (maildir ("/.*\\/Trash/"))))
  :config
  ;; (man "mu-query") -- para saber más sobre las consultas con mu
  (setq mu4e-bookmarks  `((:name "Sin leer" :key ?u :query ,(mu4e-make-query `(and (flag unread) (not ,shackra-query-maildir-trash) (not ,shackra-query-mailing-lists))))
			  (:name "Listas de correo" :key ?l :query ,(mu4e-make-query `(and (flag unread) (not ,shackra-query-maildir-trash) ,shackra-query-mailing-lists)))
			  (:name "Marcado" :key ?f :query ,(mu4e-make-query '(flag flagged)))
			  (:name "Correos de hoy" :key ?t :query ,(mu4e-make-query `(and (date (today .. now)) (not ,shackra-query-mailing-lists))))))

  (setq mu4e-contexts `(,(shackra/mu4e-easy-context
			  :c-name "personal"
			  :maildir "principal"
			  :mail "jorge@esavara.cr")
			,(shackra/mu4e-easy-context
			  :c-name  "gmail"
			  :maildir "gmail"
			  :mail    "shackrasislock0@gmail.com"
			  :sent-action delete)
			,(shackra/mu4e-easy-context
			  :c-name "yahoo"
			  :maildir "yahoo"
			  :mail "jorgejavieran@yahoo.com.mx")
			,(shackra/mu4e-easy-context
			  :c-name "jorgearaya.dev"
			  :maildir "hey"
			  :mail "hey@jorgearaya.dev"
			  :sig "Jorge Araya\nFreelance Software Engineer — https://jorgearaya.dev"
			  :sent-action delete)))

  (add-to-list 'mu4e-view-actions '("Git: Aplicar correo" . mu4e-action-git-apply-mbox) t)
  (add-to-list 'mu4e-view-actions '("Ver en el navegador" . mu4e-action-view-in-browser) t)

  (setf (alist-get 'trash mu4e-marks)
	'(:char ("d" . "▼")
		:prompt "dtrash"
		:dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
		;; Here's the main difference to the regular trash mark, no +T
		;; before -N so the message is not marked as IMAP-deleted, unless
		;; it's Gmail.
		:action (lambda (docid msg target)
                          (let ((maildir (mu4e-message-field msg :maildir)))
                            (if (string-match-p "Gmail\\|Google" maildir)
				(mu4e--server-move docid (mu4e--mark-check-target target) "+T+S-u-N")
                              (mu4e--server-move docid (mu4e--mark-check-target target) "+S-u-N"))))))

  (setf (alist-get 'refile mu4e-marks)
	'(:char ("r" . "▶")
		:prompt "refile"
		:dyn-target (lambda (target msg) (mu4e-get-refile-folder msg))
		;; Notice the special treatment for Gmail.
		:action (lambda (docid msg target)
                          (let ((maildir (mu4e-message-field msg :maildir)))
                            (if (string-match-p "Gmail\\|Google" maildir)
				(mu4e--server-remove docid)
                              (mu4e--server-move docid (mu4e--mark-check-target target) "+S-u-N")))))))

;; deshabilitado, motivo:
;; https://github.com/lordpretzel/mu4e-views/issues/36
(leaf mu4e-views
  :disabled
  :after mu4e
  :ensure t
  :bind (:mu4e-headers-mode-map
	 ("v" . mu4e-views-mu4e-select-view-msg-method) ;; select viewing method
	 ("M-n" . mu4e-views-cursor-msg-view-window-down) ;; from headers window scroll the email view
	 ("M-p" . mu4e-views-cursor-msg-view-window-up) ;; from headers window scroll the email view
         ("f" . mu4e-views-toggle-auto-view-selected-message) ;; toggle opening messages automatically when moving in the headers view
         ("i" . mu4e-views-mu4e-view-as-nonblocked-html) ;; show currently selected email with all remote content
	 )
  :config
  (setq mu4e-views-completion-method 'default)
  (setq mu4e-views-default-view-method "html") ;; make xwidgets default
  (mu4e-views-mu4e-use-view-msg-method "html") ;; select the default
  (setq mu4e-views-next-previous-message-behaviour 'stick-to-current-window) ;; when pressing n and p stay in the current window
  (setq mu4e-views-auto-view-selected-message t)) ;; automatically open messages when moving in the headers view
