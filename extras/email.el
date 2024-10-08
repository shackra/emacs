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
  (set-fill-column 120)
  (turn-on-auto-fill)
  (electric-indent-local-mode -1)
  (turn-on-flyspell))

(use-package mu4e
  :bind ("C-c u" . mu4e)
  :hook (mu4e-compose-mode . shackra/mu4e-compose-goodies)
  :custom
  (mu4e-maildir "~/Maildir")
  (mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
  (mu4e-update-interval nil)
  (mu4e-attachment-dir "~/Descargas")
  (mu4e-change-filenames-when-moving t) ;; requerido por mbsync
  :config
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
  ;; by default do not show related emails:
  (setq mu4e-headers-include-related nil)

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
			  :c-name "work"
			  :maildir "work"
			  :mail "jorge.araya@conductorone.com"
			  :sig "Jorge Araya\nGolang Software Developer"
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

(use-package mu4e-views
  :after mu4e
  :ensure t
  :bind (:map mu4e-headers-mode-map
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
