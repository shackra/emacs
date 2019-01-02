;; extraido de https://bitbucket.org/holgerschurig/emacsconf/src/
(defvar my-start-time (current-time)
  "Tiempo en que Emacs arrancó")

(setq load-prefer-newer t)
;; Disable package initialize after us.  We either initialize it
;; anyway in case of interpreted .emacs, or we don't want slow
;; initialization in case of byte-compiled .emacs.elc.
(package-initialize nil)
(setq package-enable-at-startup nil)
;; Ask package.el to not add (package-initialize) to .emacs.
(setq package--init-file-ensured t)
(setf byte-compile-warnings nil)

;; Resuelve problema en Windows 10 con codificaciones incorrectas
(define-coding-system-alias 'cp65001 'utf-8)

;; repositorios de paquetes
(setf package-archives '(("melpa"        . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu"          . "https://elpa.gnu.org/packages/")
                         ("org"          . "https://orgmode.org/elpa/")))

(setq inhibit-startup-screen t)
;; :pin no funciona en use-package por el momento, entonces si deseamos que se
;; instale un paquete desde el repositorio que queremos debemos especificarlo
;; aqui antes de que use-package sea inicializado
(setq package-pinned-packages '((auctex      . "gnu")
                                (python      . "gnu")))

(setf package-selected-packages '(ace-window ag aggressive-indent alert all-the-icons all-the-icons-dired android-mode auctex aurel auto-yasnippet better-defaults blacken bookmark+ bug-hunter cargo cask-mode chronos commander company company-auctex company-childframe company-emoji company-lsp company-quickhelp company-statistics company-tern counsel counsel-notmuch counsel-projectile dash diminish dired-details+ docker docker-compose-mode dockerfile-mode el-pocket el2org elfeed emmet-mode emojify epl exec-path-from-shell expand-region f feature-mode fixmee flycheck-cask flycheck-golangci-lint flycheck-gometalinter flycheck-kotlin flycheck-package flyspell-correct-ivy font-lock-studio free-keys gimp-mode git git-gutter-fringe gitconfig-mode gitignore-mode go-eldoc go-fill-struct go-guru go-mode go-playground go-snippets go-tag godoctor golden-ratio golden-ratio-scroll-screen gradle-mode hgignore-mode highlight-escape-sequences highlight-indent-guides highlight-numbers hungry-delete iedit imenu-anywhere importmagic indium ivy-hydra js2-refactor json-mode keyfreq kotlin kotlin-mode langtool lsp-ui magit-gh-pulls magit-todos meghanada mingus monky monokai-theme move-text moz-controller mu4e-alert multi-term multiple-cursors mustache-mode nlinum noflet notmuch-labeler ob-go omnisharp org-beautify-theme org-bullets org-download org-plus-contrib org-projectile org-redmine org-trello org-webpage org2web ox-gfm package-build paredit pcre2el pdf-tools php-mode php-refactor-mode pippel pkgbuild-mode pony-mode pretty-mode prodigy py-autopep8 pydoc-info python-environment pyvenv rainbow-mode ranger realgud rjsx-mode s scss-mode secretaria shackle shut-up slack slime sphinx-doc stylus-mode switch-buffer-functions sx systemd telephone-line tern toml-mode traad twittering-mode typescript-mode undo-tree use-package vimish-fold virtualenvwrapper visual-fill-column vlf vue-mode web-beautify web-mode webpaste weechat windresize ws-butler xref-js2 yaml-mode yasnippet zenburn-theme))

(defun package--save-selected-packages (&optional value)
  "Set and save `package-selected-packages' to VALUE.

The variable is saved on ~/.emacs.d/init.el and its content is ordered alphabetically."
  (when value
    (setq package-selected-packages value))
  ;; Sort alphabetically all symbols of package-selected-packages
  (setf package-selected-packages (cl-sort package-selected-packages 'string-lessp))
  (if after-init-time
      (let ((save-silently inhibit-message))
        ;; save the content of package-selected-packages
        (with-current-buffer (find-file-noselect "~/.emacs.d/init.el")
          (search-forward "package-selected-packages")
          (delete-region (point-at-bol) (point-at-eol))
          (insert (format "(setf package-selected-packages '%s)" package-selected-packages))
          (save-buffer)
          (kill-buffer)))
    (add-hook 'after-init-hook #'package--save-selected-packages)))

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
      (elfile (concat user-emacs-directory "README.el"))
      (gc-cons-threshold most-positive-fixnum))
  (when (or (not (file-exists-p elfile))
            (file-newer-than-file-p orgfile elfile))
    (my-tangle-config-org orgfile elfile))
  (progn
    (load-file elfile)
    ;; Solo al final inicializamos los paquetes
    (package-initialize)
    (message "Tiempo de inicialización %.2fs" (float-time (time-subtract (current-time) my-start-time)))))

(defun my-tangle-config-org-hook-func ()
  (when (string= "README.org" (buffer-name))
    (let ((orgfile (concat user-emacs-directory "README.org"))
          (elfile (concat user-emacs-directory "README.el")))
      (my-tangle-config-org orgfile elfile))))

(add-hook 'after-save-hook #'my-tangle-config-org-hook-func)
