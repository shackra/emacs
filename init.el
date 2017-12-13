;; extraido de https://bitbucket.org/holgerschurig/emacsconf/src/
(defvar my-start-time (current-time)
  "Tiempo en que Emacs arrancó")

(setq load-prefer-newer t)
;; Disable package initialize after us.  We either initialize it
;; anyway in case of interpreted .emacs, or we don't want slow
;; initialization in case of byte-compiled .emacs.elc.
(setq package-enable-at-startup nil)
;; Ask package.el to not add (package-initialize) to .emacs.
(setq package--init-file-ensured t)
;; set use-package-verbose to t for interpreted .emacs,
;; and to nil for byte-compiled .emacs.elc
(eval-and-compile
  (setq use-package-verbose (not (bound-and-true-p byte-compile-current-file))))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(package-initialize nil)

;; repositorios de paquetes
(setf package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(setq inhibit-startup-screen t)
;; :pin no funciona en use-package por el momento, entonces si deseamos que se
;; instale un paquete desde el repositorio que queremos debemos especificarlo
;; aqui antes de que use-package sea inicializado
(setq package-pinned-packages '((auctex . "gnu")
                                (python . "gnu")
                                (use-package . "melpa-stable")))

(defun my-tangle-section-canceled ()
  "Checks if the previous section header was CANC"
  (save-excursion
    (if (re-search-backward "^\\*+\\s-+\\(.*?\\)?\\s-*$" nil t)
        (string-prefix-p "CANC" (match-string 1))
      nil)))

(when (or (eq system-type 'windows-nt) (eq system-type 'cygwin))
  (setq gc-cons-threshold (* 511 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

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
    (byte-compile-file elfile)))

(let ((orgfile (concat user-emacs-directory "configuracion.org"))
      (elfile (concat user-emacs-directory "configuracion.el"))
      (gc-cons-threshold most-positive-fixnum))
  (when (or (not (file-exists-p elfile))
           (file-newer-than-file-p orgfile elfile))
    (my-tangle-config-org orgfile elfile))
  (load-file elfile))

(defun my-tangle-config-org-hook-func ()
  (when (string= "configuracion.org" (buffer-name))
    (let ((orgfile (concat user-emacs-directory "configuracion.org"))
          (elfile (concat user-emacs-directory "configuracion.el")))
      (my-tangle-config-org orgfile elfile))))

(add-hook 'after-save-hook #'my-tangle-config-org-hook-func)

(message "Start up time %.2fs" (float-time (time-subtract (current-time) my-start-time)))
