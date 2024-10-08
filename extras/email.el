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
  :custom
  (mu4easy-signature "\nJorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")
  (mu4e-update-interval nil)
  (mu4e-alert-email-notification-types '(count))
  :config
  (setq sendmail-program (executable-find "msmtp")
	send-mail-function #'smtpmail-send-it
	message-sendmail-extra-arguments '("--read-envelope-from")
	message-send-mail-function #'message-send-mail-with-sendmail))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Sample Setup: Gmail
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'mu4easy
  (setq mu4easy-contexts `(
			   ,(mu4easy-context
			     :c-name "personal"
			     :maildir "principal"
			     :mail "jorge@esavara.cr")
			   ,(mu4easy-context
			     :c-name  "gmail"
			     :maildir "gmail"
			     :mail    "shackrasislock0@gmail.com"
			     :sent-action delete)
			   ,(mu4easy-context
			     :c-name "yahoo"
			     :maildir "yahoo"
			     :mail "jorgejavieran@yahoo.com.mx")
			   ,(mu4easy-context
			     :c-name "work"
			     :maildir "work"
			     :mail "jorge.araya@conductorone.com"
			     :sig "Jorge Araya\nGolang Software Developer"
			     :sent-action delete))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Sample Setup: Fastmail
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
