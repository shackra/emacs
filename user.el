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

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Necesito escribir software en Go
(use-package go-mode
  :ensure t
  :hook
  ((go-mode . eglot))
  :config
  (add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode)))

;; activa eglot para algunos modos mayores
(with-eval-after-load 'eglot
  (add-hook 'python-mode-hook #'eglot)
  (add-hook 'json-mode-hook #'eglot))

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
