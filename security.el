(if (fboundp 'gnutls-available-p)
    (fmakunbound 'gnutls-available-p))

(setq tls-program '("gnutls-cli --tofu -p %p %h")
      imap-ssl-program '("gnutls-cli --tofu -p %p %s")
      smtpmail-stream-type 'starttls
      starttls-extra-arguments '("--tofu")
      tls-checktrust t
      gnutls-verify-error t
      gnutls-log-level 0)
