;;; Emacs Bedrock
;;;
;;; Extra config: Email

;;; Usage: Append or require this file from init.el for Email in Emacs. You will
;;; need to do some heavy customization depending on your email provider.

;;; Contents:
;;;
;;;  - Core Email Packages
;;;  - Sample Setup: Gmail
;;;  - Sample Setup: Fastmail

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Core Email Packages
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package mu4easy
  :ensure t
  :bind ("C-c u" . mu4e)
  :hook (after-init . mu4easy-mode)
  :config
  (setq sendmail-program (executable-find "msmtp")
	send-mail-function #'smtpmail-send-it
	message-sendmail-extra-arguments '("--read-envelope-from")
	message-send-mail-function #'message-send-mail-with-sendmail))

(setq shackra-mu4e-signature "Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Sample Setup: Gmail
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'mu4easy
  (setq mu4easy-contexts `(
			   ,(mu4easy-context
			     :c-name "personal"
			     :maildir "personal"
			     :mail (base64-decode-string "am9yZ2VAZXNhdmFyYS5jcg==")
			     :sig ,shackra-mu4e-signature)
			   ,(mu4easy-context
			     :c-name  "gmail"
			     :maildir "gmail"
			     :mail    (base64-decode-string "c2hhY2tyYXNpc2xvY2swQGdtYWlsLmNvbQ==")
			     :sig ,shackra-mu4e-signature
			     :sent-action delete)
			   ,(mu4easy-context
			     :c-name "yahoo"
			     :maildir "yahoo"
			     :sig ,shackra-mu4e-signature
			     :mail (base64-decode-string "am9yZ2VqYXZpZXJhbkB5YWhvby5jb20ubXg="))
			   ,(mu4easy-context
			     :c-name "work"
			     :maildir "work"
			     :mail (base64-decode-string "am9yZ2UuYXJheWFAY29uZHVjdG9yb25lLmNvbQ==")
			     :sig "Jorge Araya\nGolang Software Developer"
			     :sent-action delete))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Sample Setup: Fastmail
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
