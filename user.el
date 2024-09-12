;; Usa respuetas cortas para yes/no
(setopt use-short-answers t)

;; Fuente principal
(set-face-attribute 'default nil :family "Iosevka Nerd Font Mono" :height 160)

;; Fuente variable (para textos con variable-pitch)
(set-face-attribute 'variable-pitch nil :family "Iosevka Comfy" :height 160)

;; Fuente de símbolos
(set-fontset-font t 'symbol (font-spec :family "Julia Mono" :size 16))

;; Deshabilita CUA mode
(cua-mode -1)
;; des-ata C-z
(global-unset-key (kbd "C-z"))
;; deshabilita la ayuda rapida al iniciar Emacs
(remove-hook 'after-init-hook 'help-quick)

(defun shackra/truncate-long-lines ()
  (setq truncate-lines t))

(add-hook 'prog-mode-hook #'shackra/truncate-long-lines)

(with-eval-after-load 'magit
  ;; tomado del modulo magit de Doom Emacs
  ;; comentario original:
  ;;      Prevent sudden window position resets when staging/unstaging/discarding/etc
  ;;      hunks in `magit-status-mode' buffers. It's disorienting, especially on
  ;;      larger projects.
  (defvar +magit--pos nil)
  (add-hook 'magit-pre-refresh-hook
	    (defun +magit--set-window-state-h ()
	      (setq-local +magit--pos (list (current-buffer) (point) (window-start)))))
  (add-hook 'magit-post-refresh-hook
	    (defun +magit--restore-window-state-h ()
	      (when (and +magit--pos (eq (current-buffer) (car +magit--pos)))
		(goto-char (cadr +magit--pos))
		(set-window-start nil (caddr +magit--pos) t)
		(kill-local-variable '+magit--pos)))))

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(defun shackra/eglot-format-buffer-before-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))

;; Necesito escribir software en Go
(use-package go-mode
  :ensure t
  :after (eglot)
  :hook
  (((go-mode go-ts-mode) . eglot-ensure)
   ((go-mode go-ts-mode) . #'shackra/eglot-format-buffer-before-save)))

;; activa eglot para algunos modos mayores
(with-eval-after-load 'eglot
  (add-hook 'python-mode-hook #'eglot-ensure)
  (add-hook 'python-ts-mode-hook #'eglot-ensure)
  (add-hook 'json-mode-hook #'eglot-ensure)
  (add-hook 'json-ts-mode-hook #'eglot-ensure))

(defun shackra/projectile-ignore-projects (project-root)
  (or (file-remote-p project-root)
      (string-match-p "^/nix/store" project-root)
      (string-match-p "/node_modules/" project-root)
      (string-match-p "go/pkg/mod" project-root)))

;; Necesito manejar proyectos
(use-package projectile
  :ensure t
  :hook ((after-init . projectile-mode))
  :init
  (setq projectile-ignored-project-function #'shackra/projectile-ignore-projects)
  (setq projectile-project-search-path '(("~/code" . 3) ("~/code/work" . 1)))
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; me gustaria tener un tablero como en Doom
(use-package dashboard
  :ensure t
  :config
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))
	dashboard-banner-logo-title "«Bendito el Señor, mi Roca,\nque adiestra mis manos para el combate,\nmis dedos para la pelea» — Salmo 143"
	dashboard-startup-banner (expand-file-name "dashboard/sacred-heart.svg" user-emacs-directory)
	dashboard-item-names '(("Recent Files:" .	"Archivos visitados recientemente:")
			       ("Bookmarks:"    .	"Marcadores:")
			       ("Projects:"	.	"Proyectos:")
			       ("Registers:"	.	"Registros:"))
	dashboard-item-shortcuts '((recents	.	"r")
                                   (bookmarks	.	"m")
                                   (projects	.	"p")
                                   (registers	.	"e"))
	dashboard-items '((recents		.	3)
                          (bookmarks		.	5))

	dashboard-display-icons-p t
	dashboard-icon-type 'nerd-icon
	dashboard-set-heading-icons t
	dashboard-set-file-icons t)

  (dashboard-modify-heading-icons '((recents . "nf-oct-file_text")
				    (bookmarks . "nf-oct-book")))

  (dashboard-setup-startup-hook))

;; quiero una barra modeline más bonita
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 44))

;; Me gustaria usar temas de Doom
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italics t)
  (load-theme 'doom-sourcerer t))

;; Necesito que algunas ventanas se comporten de forma distinta
(use-package shackle
  :init
  (setq shackle-lighter ""
	shackle-default-size 0.4)
  :ensure t
  :hook (after-init . shackle-mode)
  :config
  (setq shackle-rules
	'((magit-status-mode :select t :inhibit-window-quit t :same t)
          (magit-log-mode    :select t :inhibit-window-quit t :same t))))

;; quiero que lo mostrado por eldoc aparezca en un child-frame
(use-package eldoc-box
  :ensure t
  :init
  (setq eldoc-box-only-multi-line t)
  :config
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t))

;; quisiera que la posicion del cursor sea recordado al visitar un
;; archivo de nuevo
(use-package saveplace
  :ensure t
  :hook (after-init . save-place-mode)
  :custom
  (save-place-ignore-files-regexp
   "\\(?:COMMIT_EDITMSG\\|hg-editor-[[:alnum:]]+\\.txt\\|elpa\\|svn-commit\\.tmp\\|bzr_log\\.[[:alnum:]]+\\)$")
  (save-place-file (expand-file-name ".mis-lugares-guardados" user-emacs-directory))
  (save-place-forget-unreadable-files t))

(use-package saveplace-pdf-view
  :ensure t)
