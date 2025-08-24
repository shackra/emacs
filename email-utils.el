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
	      (mu4e-maildir-shortcuts		.
					      ((,inbox   . ?i)
					       (,sent    . ?s)
					       (,trash   . ?t)
					       (,refile  . ?a)
					       (,draft   . ?d)))))))
