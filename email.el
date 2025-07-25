(cl-defmacro shackra/mu4e-easy-context (&key c-name maildir mail smtp
					     (sent-action 'sent)
					     (name "Jorge Javier Araya Navarro")
					     (sig message-signature))
  (let
      ((inbox      (concat "/" maildir "/Inbox"))
       (sent       (concat "/" maildir "/Sent"))
       (trash      (concat "/" maildir "/Trash"))
       (refile     (concat "/" maildir "/Archive"))
       (draft      (concat "/" maildir "/Drafts")))

    `(make-mu4e-context
      :name ,c-name
      :match-func (lambda (msg)
                    (when msg
                      (string-match-p (concat "^/" ,maildir "/")
                                      (mu4e-message-field msg :maildir))))
      :vars '((user-mail-address		.	,mail)
              (user-full-name			.	,name)
              (mu4e-sent-folder			.	,sent)
              (mu4e-drafts-folder		.	,draft)
              (mu4e-trash-folder		.	,trash)
              (mu4e-refile-folder		.	,refile)
              (mu4e-compose-signature		.	(concat ,sig))
              (mu4e-sent-messages-behavior	.	,sent-action)
              (message-signature		.	,sig)
              (mu4e-maildir-shortcuts .
                                      ((,inbox   . ?i)
                                       (,sent    . ?s)
                                       (,trash   . ?t)
                                       (,refile  . ?a)
                                       (,draft   . ?d)))))))

(setq user-mail-address "jorge@esavara.cr")
(setq message-signature "Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")

(defun shackra/mu4e-compose-goodies ()
  "Settings for mu4e compose mode."
  (set-fill-column 72)
  (turn-on-auto-fill)
  (electric-indent-local-mode -1)
  (jinx-mode 1))

(leaf mu4e
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  :bind
  ("C-c u" . mu4e)
  (:mu4e-main-mode-map
   ("x" . bury-buffer)
   ("I" . mu4e-update-index)
   ("<tab>" . shr-next-link)
   ("<backtab>" . shr-previous-link))
  (:mu4e-headers-mode-map
   ("M" . mu4e-headers-mark-all)
   ("N" . mu4e-headers-mark-all-unread-read))
  :hook (mu4e-compose-mode-hook . shackra/mu4e-compose-goodies)
  :config
  (setq gnus-article-date-headers '(combined-local-lapsed))
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  (setq mu4e-maildir "~/Maildir")
  (setq mu4e-get-mail-command (concat (executable-find "mbsync") " --push --all")) ;; no adquiere nuevo email, solo empuja los cambios locales
  (setq mu4e-update-interval nil)
  (setq mu4e-attachment-dir "~/Descargas")
  (setq mu4e-change-filenames-when-moving t) ;; requerido por mbsync
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-bookmarks email-bookmarks)
  (setq mu4e-headers-fields email-headers)
  (setq message-citation-line-function 'message-insert-formatted-citation-line)
  (setq mu4e-compose-format-flowed t)
  (setq mu4e-headers-auto-update t)
  (setq mu4e-headers-date-format "%d/%m/%Y %H:%M")
  (setq mu4e-index-cleanup t)
  (setq mu4e-index-lazy-check nil)
  (setq mu4e-main-hide-personal-addresses t)
  (setq mu4e-main-buffer-name "*mu4e-main*")
  (setq mu4e-use-fancy-chars t)
  (setq sendmail-program (executable-find "msmtp"))
  (setq message-sendmail-f-is-evil t)
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq message-send-mail-function #'message-send-mail-with-sendmail)
  (setq send-mail-function #'message-send-mail-with-sendmail)
  (setq message-signature "Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")
  (setq mu4e-context-policy 'pick-first) ;; start with the first (default) context;
  (setq mu4e-compose-context-policy 'ask) ;; ask for context if no context matches;
  (setq message-kill-buffer-on-exit t)
  ;; optional
  ;; store link to message if in header view, not to header query:
  (setq org-mu4e-link-query-in-headers-mode nil)
  ;; don't have to confirm when quitting:
  (setq mu4e-confirm-quit nil)
  ;; number of visible headers in horizontal split view:
  (setq mu4e-headers-visible-lines 5)
  ;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:
  (setq mu4e-hide-index-messages t)
  ;; customize the reply-quote-string:
  (setq message-citation-line-format  "El %A %d de %B del %Y, %N escribió:\n")
  ;; M-x find-function RET message-citation-line-format for docs:
  (setq message-citation-line-function 'message-insert-formatted-citation-line)
  ;; by default do show related emails:
  (setq mu4e-search-include-related nil)
  ;; omite duplicados
  (setq mu4e-search-skip-duplicates t)
  (add-to-list 'mu4e-view-actions
               '("Aplicar correo" . mu4e-action-git-apply-mbox) t)

  (setq
   mu4e-headers-attach-mark    '("a" . "📎")
   mu4e-headers-calendar-mark  '("c" . "📅")
   mu4e-headers-draft-mark     '("D" . "💈")
   mu4e-headers-encrypted-mark '("x" . "🔒")
   mu4e-headers-flagged-mark   '("F" . "📍")
   mu4e-headers-list-mark      '("l" . "🔈")
   mu4e-headers-new-mark       '("N" . "🔥")
   mu4e-headers-passed-mark    '("P" . "❯")
   mu4e-headers-personal-mark  '("p" . "👨")
   mu4e-headers-replied-mark   '("R" . "👍")
   mu4e-headers-seen-mark      '("S" . "👀")
   mu4e-headers-signed-mark    '("s" . "🔑")
   mu4e-headers-trashed-mark   '("T" . "💀")
   mu4e-headers-unread-mark    '("u" . "📩")
   )

  ;; contexts
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

(defvar email-today-query "date:today..now and not maildir:/trash/ and not flag:list")
(defvar email-trash-query "maildir:/Trash/")
(defvar email-inbox-query "maildir:/Inbox/")
(defvar email-unread-query "flag:unread and not maildir:/trash/ and not flag:list")
(defvar email-mailing-list-query "flag:unread and not maildir:/trash/ and flag:list")

(defcustom email-bookmarks
  `(( :name  "No leido"
      :query ,email-unread-query
      :key   ?u)
    ( :name  "Bandeja de entrada"
      :query ,email-inbox-query
      :key   ?i)
    ( :name "Listas de correo"
      :query ,email-mailing-list-query
      :key   ?l)
    ( :name "Hoy"
      :query ,email-today-query
      :key   ?t)
    ( :name "Marcado ⛳"
      :query "flag:flagged"
      :key   ?f)
    ( :name "Etiquetas"
      :query "tag://"
      :key   ?T)
    ( :name "Papelera"
      :query ,email-trash-query
      :key ?x
      :hide-unread t)
    ( :name "Adjuntos"
      :query "mime:application/* or mime:image/*"
      :key   ?a
      :hide-unread t))
  "Preconfigured bookmarks for easy navigation.
See variable `mu4e-bookmarks'."
  :type '(repeat (plist)))

(defcustom email-headers
  '((:human-date   . 18)
    (:flags        . 6)
    (:maildir      . 16)
    (:from-or-to   . 22)
    (:mailing-list . 10)
    (:tags         . 10)
    (:subject      . 92))
  "Format of headers.
See variable `mu4e-headers-fields'"
  :type '(repeat (cons symbol integer)))

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
