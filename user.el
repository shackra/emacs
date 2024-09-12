;; Usa respuetas cortas para yes/no
(setopt use-short-answers t)

;; Fuente principal
(set-face-attribute 'default nil :family "Iosevka Nerd Font Mono" :height 160)

;; Fuente variable (para textos con variable-pitch)
(set-face-attribute 'variable-pitch nil :family "Iosevka Comfy" :height 160)

;; Fuente serif
(set-face-attribute 'serif nil :family "Iosevka Comfy Motion Duo" :height 160)

;; Fuente de símbolos
(set-fontset-font t 'symbol (font-spec :family "Julia Mono" :size 16))

;; Deshabilita CUA mode
(cua-mode -1)
;; des-ata C-z
(global-unset-key (kbd "C-z"))
;; deshabilita la ayuda rapida al iniciar Emacs
(remove-hook 'after-init-hook 'help-quick)

(add-hook 'prog-mode-hook (lambda () (toggle-truncate-lines +1)))

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

;; quiero una barra modeline más bonita
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 32))

;; Me gustaria usar temas de Doom
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italics t)
  (load-theme 'doom-sourcerer t))
