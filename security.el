(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python3 -m certifi")))))
  (setf tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setf tls-checktrust t)
  (setf gnutls-verify-error t)
  (setf gnutls-log-level 0)
  (setf gnutls-trustfiles (list trustfile)))

(if (fboundp 'gnutls-available-p)
    (fmakunbound 'gnutls-available-p))
