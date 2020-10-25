(setq load-prefer-newer t)
(setf byte-compile-warnings nil)

(defvar orgfile (concat user-emacs-directory "README.org")
  "Ubicación de la configuración literal")

;; para depuracion
;(setf orgfile (concat user-emacs-directory "debug.org"))

(defvar elfile (concat user-emacs-directory "init.el")
  "Ubicación de la salida de la configuración literal a Emacs Lisp")

(setf straight-use-package-by-default t
      straight-repository-branch "develop")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setf straight-check-for-modifications '(check-on-save find-when-checking))

(setq inhibit-startup-screen t)

;; sombrero de aluminio, le bajamos una rayita
(setq network-security-level 'medium)

;; https://jamiecollinson.com/blog/my-emacs-config/#make-it-easy-to-edit-this-file
(defun find-config ()
  "Abre el archivo de configuración de Emacs"
  (interactive)
  (find-file orgfile))

(global-set-key (kbd "C-c I") 'find-config)

;; instala `use-package' usando `straight'
(straight-use-package 'use-package)

(use-package use-package-hydra)

(use-package hydra :config (require 'hydra-examples))

(use-package diminish)

(use-package bind-key)

(use-package f)

(use-package exec-path-from-shell)

(eval-when-compile
  (require 'use-package))

;; por default instala todos los paquetes usando `straight' si no estan
;; disponibles locamente
(setf straight-use-package-by-default t)

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
    (message "Wrote %s ..." elfile)))

;; transfiere bloques de código a `elfile'
(when (or (not (file-exists-p elfile))
          (file-newer-than-file-p orgfile elfile))
  (my-tangle-config-org orgfile elfile))

(defun my-tangle-config-org-hook-func ()
  (when (string= (file-name-nondirectory orgfile) (buffer-name))
    (my-tangle-config-org orgfile elfile)))

(add-hook 'after-save-hook #'my-tangle-config-org-hook-func)
