;; extraido de https://bitbucket.org/holgerschurig/emacsconf/src/
(defvar my-start-time (current-time)
  "Tiempo en que Emacs arrancó")

(setq load-prefer-newer t)
(setf byte-compile-warnings nil)

;; Resuelve problema en Windows 10 con codificaciones incorrectas
(define-coding-system-alias 'cp65001 'utf-8)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/master/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setf straight-check-for-modifications '(check-on-save find-when-checking))

(straight-use-package
 '(org-plus-contrib
   :repo "https://code.orgmode.org/bzg/org-mode.git"
   :local-repo "org"
   :files (:defaults "contrib/lisp/*.el")
   :includes (org)))

(setq inhibit-startup-screen t)

(defun my-tangle-section-canceled ()
  "Checks if the previous section header was CANC"
  (save-excursion
    (if (re-search-backward "^\\*+\\s-+\\(.*?\\)?\\s-*$" nil t)
        (string-prefix-p "CANC" (match-string 1))
      nil)))

(defun my-tangle-config-org (orgfile elfile)
  "This function will write all source blocks from =config.org= into
=config.el= that are ...

- not marked as :tangle no
- have a source-code of =emacs-lisp=
- doesn't have the todo-marker CANC"
  (let* ((body-list ())
         (gc-cons-threshold most-positive-fixnum)
         (org-babel-src-block-regexp   (concat
                                        ;; (1) indentation                 (2) lang
                                        "^\\([ \t]*\\)#\\+begin_src[ \t]+\\([^ \f\t\n\r\v]+\\)[ \t]*"
                                        ;; (3) switches
                                        "\\([^\":\n]*\"[^\"\n*]*\"[^\":\n]*\\|[^\":\n]*\\)"
                                        ;; (4) header arguments
                                        "\\([^\n]*\\)\n"
                                        ;; (5) body
                                        "\\([^\000]*?\n\\)??[ \t]*#\\+end_src")))
    (with-temp-buffer
      (insert-file-contents orgfile)
      (goto-char (point-min))
      (while (re-search-forward org-babel-src-block-regexp nil t)
        (let ((lang (match-string 2))
              (args (match-string 4))
              (body (match-string 5))
              (canc (my-tangle-section-canceled)))
          (when (and (string= lang "emacs-lisp")
                     (not (string-match-p ":tangle\\s-+no" args))
                     (not canc))
            (add-to-list 'body-list body)))))
    (with-temp-file elfile
      (insert (format ";; No edite este archivo, en su lugar edite %s ...\n\n" orgfile))
      ;; (insert (apply 'concat (reverse body-list)))
      (apply 'insert (reverse body-list)))
    (message "Wrote %s ..." elfile)
    ;;(byte-compile-file elfile) ;; desactiva la compilación del archivo .el de
    ;;la configuración
    ))

(let ((orgfile (concat user-emacs-directory "README.org"))
      (elfile (concat user-emacs-directory "README.el")))
  (when (or (not (file-exists-p elfile))
            (file-newer-than-file-p orgfile elfile))
    (my-tangle-config-org orgfile elfile))
  (progn
    (load-file elfile)
    (message "Tiempo de inicialización %.2fs" (float-time (time-subtract (current-time) my-start-time)))))

(defun my-tangle-config-org-hook-func ()
  (when (string= "README.org" (buffer-name))
    (let ((orgfile (concat user-emacs-directory "README.org"))
          (elfile (concat user-emacs-directory "README.el")))
      (my-tangle-config-org orgfile elfile))))

(add-hook 'after-save-hook #'my-tangle-config-org-hook-func)
