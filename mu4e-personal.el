(setf
 ;; información de mi cuenta de correo
 mu4e-compose-signature "👋 Pax et bonum.\nJorge Araya Navarro\nhttps://es.gravatar.com/shackra"
 smtpmail-smtp-server "privateemail.com"
 smtpmail-local-domain "local"
 smtpmail-smtp-user "elcorreo@deshackra.com"
 mu4e-headers-date-format "%d/%m/%Y %H:%M"
 ;; Ajustes para las respuestas
 message-citation-line-format "\nEl %A %d de %B del %Y a las %H%M horas, %N escribió:\n"
 message-citation-line-function 'message-insert-formatted-citation-line
 message-cite-reply-position 'below
 mu4e-get-mail-command "getmail.sh"
 mu4e-maildir "/home/jorge/correo"
 mu4e-update-interval nil
 mu4e-auto-retrieve-keys t
 mu4e-headers-leave-behavior 'apply
 mu4e-headers-visible-lines 8
 mu4e-hide-index-messages t
 message-kill-buffer-on-exit t
 mu4e-attachment-dir  "~/Descargas"
 mu4e-maildir       "~/correo" ;; top-level Maildir
 mu4e-sent-folder   "/personal/Enviados" ;; folder for sent messages
 mu4e-drafts-folder "/personal/Borradores" ;; unfinished messages
 mu4e-trash-folder  "/personal/Papelera"  ;; trashed messages
 mu4e-refile-folder "/personal/Archivados" ;; Mensajes salvados
 smtpmail-stream-type  'ssl
 smtpmail-smtp-service 465
 message-send-mail-function 'smtpmail-send-it
 )
