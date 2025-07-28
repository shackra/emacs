(load-file (expand-file-name "emacs-backpack/init.el" user-emacs-directory))
(load-file (expand-file-name "extras/base.el" emacs-backpack--base-backpack-dir))
(load-file (expand-file-name "extras/dev.el" emacs-backpack--base-backpack-dir))
(load-file (expand-file-name "extras/writer.el" emacs-backpack--base-backpack-dir))
(load-file (expand-file-name "email.el" user-emacs-directory))

;; esconde la barra de menú
(menu-bar-mode -1)

;; Usa respuestas cortas para yes/no
(setopt use-short-answers t)

;; Mata el buffer actual
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; Fuente principal
(set-face-attribute 'default nil :family "Iosevka Nerd Font Mono" :height 160)

;; Fuente variable (para textos con variable-pitch)
(set-face-attribute 'variable-pitch nil :family "Iosevka Comfy")

(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font Mono")

;; Fuente de símbolos
(set-fontset-font t 'symbol (font-spec :family "JuliaMono"))

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

(leaf magit-todos
  :disabled
  :after magit
  :ensure t
  :config
  (magit-todos-mode 1)
  (dolist (dir '("vendor/" "node_modules/"))
    (add-to-list 'magit-todos-exclude-globs dir)))

(leaf treesit-auto
  :ensure t
  :custom
  (treesit-auto-install . 'prompt)
  :global-minor-mode global-treesit-auto-mode
  :defer-config
  (treesit-auto-add-to-auto-mode-alist 'all))

(defun shackra/eglot-format-buffer-before-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))

;; Gancho para agregar `eglot-format-buffer'
(with-eval-after-load 'eglot
  (add-hook 'eglot-managed-mode-hook #'shackra/eglot-format-buffer-before-save))

;; Necesito escribir software en Go
(leaf go-mode
  :ensure t
  :hook ((go-mode-hook go-ts-mode-hook) . eglot-ensure))

(defun shackra/project-ignore-projects (project-root)
  (or (file-remote-p project-root)
      (string-match-p "^/nix/store" project-root)
      (string-match-p "/node_modules/" project-root)
      (string-match-p "go/pkg/mod" project-root)))

(leaf rg
  :ensure t
  :hook (after-init-hook . rg-enable-default-bindings))

;; Necesito manejar proyectos
(leaf project
  :ensure t
  :config
  (setq project-vc-extra-root-markers
	'("Cargo.toml" "compile_commands.json"
	  "compile_flags.txt" "go.mod"
	  "project.godot")))

;; me gustaría tener un tablero como en Doom
(leaf dashboard
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
	dashboard-items '((projects		.	3)
                          (bookmarks		.	3)
			  (registers		.       3))

	dashboard-display-icons-p t
	dashboard-icon-type 'nerd-icon
	dashboard-set-heading-icons t
	dashboard-set-file-icons t)

  (dashboard-setup-startup-hook)
  :defer-config
  (dashboard-modify-heading-icons '((recents . "nf-oct-file_text")
				    (bookmarks . "nf-oct-book"))))

;; quiero una barra modeline más bonita
(leaf doom-modeline
  :ensure t
  :hook (after-init-hook . doom-modeline-mode)
  :init
  (setq doom-modeline-height 44))

;; Me gustaria usar temas de Doom
(leaf doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italics t)
  (load-theme 'doom-sourcerer t))

;; Necesito que algunas ventanas se comporten de forma distinta
(leaf shackle
  :init
  (setq shackle-lighter ""
	shackle-default-size 0.4)
  :ensure t
  :hook (after-init-hook . shackle-mode)
  :config
  (setq shackle-rules
	'((magit-status-mode        :select t :inhibit-window-quit t :same t)
          (magit-log-mode           :select t :inhibit-window-quit t :same t)
	  ("*Async Shell Command*"  :ignore t)
	  ("*eshell*"               :select t :other t))))

(add-hook 'after-init-hook #'winner-mode)

;; Domestica ciertas ventanas
(leaf popper
  :ensure t
  :bind (("C-<break>"   . popper-toggle) ;; <break> sería Pause en el teclado
         ("M-<pause>"   . popper-cycle)
         ("C-M-<break>" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode
	  eshell-mode
	  vterm-mode))
  (popper-mode +1)
  (popper-echo-mode +1)                 ; For echo area hints
  :config
  (setq popper-group-function #'popper-group-by-project))

;; emulador de terminal dentro de Emacs!
(leaf vterm
  :bind ("C-c t" . vterm)) ;; no lleva :ensure porque el paquete esta instalado en el sistema operativo

;; quiero que lo mostrado por `eldoc' aparezca en un `child-frame'
(leaf eldoc-box
  :ensure t
  :init
  (setq eldoc-box-only-multi-line t)
  :hook (eglot-managed-mode-hook . eldoc-box-hover-at-point-mode))

;; quisiera que la posición del cursor sea recordado al visitar un
;; archivo de nuevo
(leaf saveplace
  :ensure t
  :config
  (setq save-place-file (expand-file-name ".mis-lugares-guardados" user-emacs-directory))
  :custom
  (save-place-ignore-files-regexp . "\\(?:COMMIT_EDITMSG\\|hg-editor-[[:alnum:]]+\\.txt\\|elpa\\|svn-commit\\.tmp\\|bzr_log\\.[[:alnum:]]+\\)$")
  (save-place-forget-unreadable-files . t)
  :global-minor-mode save-place-mode)

(leaf saveplace-pdf-view
  :ensure t)

;; Estoy usando envrc
(leaf envrc
  :ensure t
  :hook (after-init-hook . envrc-global-mode)
  :bind (:envrc-mode-map
	 ("C-c e" . envrc-command-map)))

;; Quisiera editar los archivos de NixOS :)
(leaf nix-ts-mode
  :ensure t
  :mode "\\.nix\\'"
  :hook (nix-ts-mode-hook . eglot-ensure))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(nix-ts-mode . ("nixd")))
  (add-to-list 'eglot-server-programs '(css-ts-mode . ("gtkcsslanguageserver")))
  ;; activa eglot para modos mayores
  (dolist (hook '(js-mode-hook
		  js-ts-mode-hook
		  typescript-mode-hook
		  typescript-ts-mode-hook
		  css-mode
		  css-ts-mode
		  python-mode-hook
		  python-ts-mode-hook
		  json-mode-hook
		  json-ts-mode-hook))
    (add-hook hook #'eglot-ensure))

  (define-key eglot-mode-map   (kbd "C-c l r")   #'eglot-rename)
  (define-key eglot-mode-map   (kbd "C-c l a")   #'eglot-code-actions))

;; ajustes adicionales para servidores LSP, por defecto
(with-eval-after-load 'eglot
  (let* ((dotfiles-home     (substitute-in-file-name "$HOME/dotfiles"))
	 (nixos-expr        (format "(builtins.getFlake \"%s\").nixosConfigurations.woody.options" dotfiles-home))
	 (home-manager-expr (format "(builtins.getFlake \"%s\").homeConfigurations.jorge.options" dotfiles-home)))
    (setq-default eglot-workspace-configuration
                  `(:nil
		    (:formatting (:command ["nixfmt"])
				 :nix (:flake
				       (
					:autoArchive t
					:autoEvalInputs t
					:nixpkgsInputName "nixpkgs")))
		    :nixd '(:formatting (:command ["nixfmt"]) ;; revisar https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md#configuration-overview
					:nixpkgs (:expr "import <nixpkgs> { }")
					:nixos (:optionsExpr ,nixos-expr)
					:homeManager (:optionsExpr ,home-manager-expr))
		    :gopls (:usePlaceholders t :gofumpt t)))))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c ! n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c ! p") #'flymake-goto-prev-error))

(leaf nix-modeline
  :after nix-ts-mode
  :ensure t
  :hook (nix-ts-mode-hook . nix-modeline-mode))

;; Intentemos tener las mismas variables de entorno
(leaf exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-warn-duration-millis 600)
  :defer-config
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" "NIX_SSL_CERT_FILE" "NIX_PATH"))
    (add-to-list 'exec-path-from-shell-variables var))
  :config
  (if (daemonp)
      (exec-path-from-shell-initialize)
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize))))

;; ajustes para uniquify
;; sacado de:
;;     https://pragmaticemacs.wordpress.com/2016/05/10/uniquify-your-buffer-names/
(with-eval-after-load 'uniquify
  (setq uniquify-buffer-name-style 'forward
	uniquify-separator "/"
	uniquify-after-kill-buffer-p t    ; rename after killing uniquified
	uniquify-ignore-buffers-re "^\\*")) ; don't muck with special buffers

;; Soporte para Godot Engine
(leaf gdscript-mode
  :ensure t
  :hook ((gdscript-mode-hook gdscript-ts-mode-hook) . eglot-ensure)
  :init
  (add-to-list 'major-mode-remap-alist '(gdscript-mode . gdscript-ts-mode)))

;; Soporte para leer y anotar PDFs
(leaf pdf-tools
  :ensure t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install))

;; borramos espacios en blanco de forma inteligente
(leaf smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
         ("C-d" . smart-hungry-delete-forward-char)))

;; ajustes para C/C++
(with-eval-after-load 'cc-mode
  ;; activa eglot
  (with-eval-after-load 'eglot
    (dolist (hook '(c++-mode-hook
		    c-mode-hook
		    c++-ts-mode-hook
		    c-ts-mode-hook))
      (add-hook hook #'eglot-ensure))))

(with-eval-after-load 'consult
  (add-to-list 'consult-buffer-filter "\\`\\*Async-native-compile-log\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*Messages\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*info\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*Help\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*EGLOT")
  (add-to-list 'consult-buffer-filter "\\`magit-process")
  (add-to-list 'consult-buffer-filter "\\`\\*xref\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*img-cache\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\*mu4e-last-update\\*\\'")
  (add-to-list 'consult-buffer-filter "\\`\\magit-diff:")
  (add-to-list 'consult-buffer-filter "\\`\\*playerctl\\*\\'"))

;; instala modo mayor para editar archivos de CMake
(leaf cmake-mode
  :ensure t
  :hook ((cmake-mode-hook . cmake-ts-mode-hook)
	 ((cmake-mode-hook cmake-ts-mode-hook) . eglot-ensure)))

(leaf crux
  :ensure t
  :config
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
  (global-set-key (kbd "C-c o") #'crux-open-with)
  (global-set-key [(shift return)] #'crux-smart-open-line)
  (global-set-key (kbd "s-r") #'crux-recentf-find-file)
  (global-set-key (kbd "C-<backspace>") #'crux-kill-line-backwards)
  (global-set-key [remap kill-whole-line] #'crux-kill-whole-line))

(leaf just-ts-mode
  :ensure t
  :hook (after-init-hook . just-ts-mode-install-grammar))

(leaf typescript-ts-mode)

(leaf svelte-mode
  :ensure t)

(with-eval-after-load 'eglot
  (with-eval-after-load 'svelte-mode
    (add-to-list 'eglot-server-programs
		 '(svelte-mode . ("svelteserver" "--stdio")))))

(leaf go-tag
  :ensure t)

(leaf markdown-mode
  :ensure t
  :init (setq markdown-command "multimarkdown"))

(leaf eglot-inactive-regions
  :ensure t
  :custom
  (eglot-inactive-regions-style . 'darken-foreground)
  (eglot-inactive-regions-opacity . 0.4)
  :global-minor-mode eglot-inactive-regions-mode
  :config
  (dolist (hook '(c++-mode
		  c-mode
		  c++-ts-mode
		  c-ts-mode))
    (add-hook hook #'eglot-inactive-regions-mode)))

(leaf multiple-cursors
  :ensure t
  :bind (("C-c m n" . mc/mark-next-like-this)
         ("C-c m p" . mc/mark-previous-like-this)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m e" . mc/edit-lines)
         ("C-c m i" . mc/insert-numbers)
         ("C-c m l" . mc/edit-ends-of-lines)
         ("C-c m h" . mc/edit-beginnings-of-lines))
  :config
  ;; Opcional: Personalización adicional
  (setq mc/always-run-for-all t))

(leaf iedit
  :ensure t)

(leaf hydra
  :ensure t)

(leaf zoutline
  :ensure t)

(leaf lispy
  :straight '(lispy :type git :host github :repo "enzuru/lispy")
  :hook ((emacs-lisp-mode-hook lisp-mode-hook lisp-interaction-mode-hook) . lispy-mode)
  :config
  ;; Opcional: Personalizaciones adicionales
  (setq lispy-close-quotes-at-end-p t))

(leaf hl-todo
  :ensure t
  :config (global-hl-todo-mode 1))

(leaf yuck-mode
  :ensure t)

;; afecta dired
(leaf ls-lisp
  :config
  (setq ls-lisp-dirs-first t)
  (setq ls-lisp-use-insert-directory-program nil))

(leaf all-the-icons
  :ensure t)

(leaf all-the-icons-dired
  :disabled
  :ensure t
  :after (all-the-icons)
  :config
  (setq all-the-icons-dired-monochrome nil)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(with-eval-after-load 'dired
  ;; this command is useful when you want to close the window of `dirvish-side'
  ;; automatically when opening a file
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-mouse-drag-files t)
  (setq mouse-drag-and-drop-region-cross-program t)
  (setq delete-by-moving-to-trash t))

(with-eval-after-load 'tramp
  ;; Enable full-featured Dirvish over TRAMP on ssh connections
  ;; https://www.gnu.org/software/tramp/#Improving-performance-of-asynchronous-remote-processes
  (connection-local-set-profile-variables
   'remote-direct-async-process
   '((tramp-direct-async-process . t)))
  (connection-local-set-profiles
   '(:application tramp :protocol "ssh")
   'remote-direct-async-process)
  ;; Tips to speed up connections
  (setq tramp-verbose 0)
  (setq tramp-chunksize 2000)
  (setq tramp-ssh-controlmaster-options nil))

(leaf dirvish
  :ensure t
  :hook ((after-init-hook . dirvish-override-dired-mode)
	 (dirvish-setup-hook . dirvish-emerge-mode))
  :custom
  (dirvish-quick-access-entries . ; It's a custom option, `setq' won't work
				'(("h" "~/"                          "Carpeta personal")
				  ("d" "~/Documentos"                "Documentos")
				  ("b" "~/Descargas"                 "Descargas")
				  ("i" "~/Imágenes"                  "Imágenes")
				  ("c" "~/code"                      "Proyectos de software")
				  ("f" "~/dotfiles"                  "dotfiles")))
  :config
  (dirvish-side-follow-mode)	   ; similar to `treemacs-follow-mode'
  (setq mouse-1-click-follows-link nil)
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes   ; The order *MATTERS* for some attributes
        '(vc-state subtree-state collapse git-msg file-time)
        dirvish-side-attributes
        '(vc-state collapse file-size))
  (setq dirvish-large-directory-threshold 20000)
  (setq dirvish-preview-dispatchers ;; usa pdf-tools para previsualizar pdfs
	(cl-substitute 'pdf-tools 'pdf dirvish-preview-dispatchers))
  (setq dirvish-emerge-groups
	'(("Archivos recientes"  (predicate . recent-files-2h))
	  ("Documentos"          (extensions "pdf" "tex" "bib" "epub"))
	  ("Vídeos"              (extensions "mp4" "mkv" "webm"))
	  ("Imágenes"            (extensions "jpg" "png" "svg" "gif" "jpeg"))
	  ("Audio"               (extensions "mp3" "flac" "wav" "ape" "aac" "ogg"))
	  ("Archivos"            (extensions "gz" "rar" "zip" "7z"))))
  :bind	  ; Bind `dirvish-fd|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish)
   (:dirvish-mode-map	; Dirvish inherits `dired-mode-map'
    ("u"         .       dired-up-directory)	; So you can adjust `dired' bindings here
    ("?"		.	dirvish-dispatch) ; [?] a helpful cheatsheet
    ("a"		.	dirvish-setup-menu) ; [a]ttributes settings:`t' toggles mtime, `f' toggles fullframe, etc.
    ("f"		.	dirvish-file-info-menu)	; [f]ile info
    ("o"		.	dirvish-quick-access) ; [o]pen `dirvish-quick-access-entries'
    ("s"		.	dirvish-quicksort)    ; [s]ort flie list
    ("r"		.	dirvish-history-jump) ; [r]ecent visited
    ("l"		.	dirvish-ls-switches-menu) ; [l]s command flags
    ("v"		.	dirvish-vc-menu) ; [v]ersion control commands
    ("*"		.	dirvish-mark-menu)
    ("y"		.	dirvish-yank-menu)
    ("N"		.	dirvish-narrow)
    ("^"		.	dirvish-history-last)
    ("TAB"	.	dirvish-subtree-toggle)
    ("M-f"	.	dirvish-history-go-forward)
    ("M-b"	.	dirvish-history-go-backward)
    ("M-e"	.	dirvish-emerge-menu)
    ("<mouse-1>" .	dirvish-subtree-toggle-or-open)
    ("<mouse-2>" .	dired-mouse-find-file-other-window)
    ("<mouse-3>" .	dired-mouse-find-file))))

(leaf dired-x
  :defer-config
  ;; Make dired-omit-mode hide all "dotfiles"
  (setq dired-omit-files
        (concat dired-omit-files "\\|^\\..*$")))

;; Additional syntax highlighting for dired
(leaf diredfl
  :ensure t
  :hook
  ((dired-mode-hook . diredfl-mode)
   ;; highlight parent and directory preview as well
   (dirvish-directory-view-mode-hook . diredfl-mode))
  :config
  (set-face-attribute 'diredfl-dir-name nil :bold t))

(with-eval-after-load 'treesit
  (add-to-list 'treesit-language-source-alist
               '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")))

(leaf hyprlang-ts-mode
  :ensure t
  :custom
  (hyprlang-ts-mode-indent-offset . 2))

(leaf gcmh
  :ensure t
  :custom
  (gcmh-idle-delay . 1.2))

(leaf playerctl
  :ensure t
  :bind
  ("C-c C-SPC" . playerctl-play-pause-song)
  ("C-c C-n" . playerctl-next-song)
  ("C-c C-p" . playerctl-previous-song))

(defun shackra--outline-indent-define-keys-for-keymaps (keymaps)
  "Establece atajos de teclado para keymaps en `KEYMAPS'"
  (dolist (keymap-sym keymaps)
    (let ((keymap (symbol-value keymap-sym)))
      (define-key keymap (kbd "C-{") 'outline-indent-toggle-fold)
      (define-key keymap (kbd "C-}") 'outline-indent-toggle-level-at-point))))

(leaf python
  :defer-config
  (shackra--outline-indent-define-keys-for-keymaps '(python-mode-map python-ts-mode-map)))

(leaf yaml-mode
  :defer-config
  (shackra--outline-indent-define-keys-for-keymaps '(yaml-mode-map)))

(leaf yaml-ts-mode
  :defer-config
  (shackra--outline-indent-define-keys-for-keymaps '(yaml-ts-mode-map)))

(leaf outline-indent
  :ensure t
  :hook ((python-mode-hook python-ts-mode-hook yaml-mode-hook yaml-ts-mode-hook) . outline-indent-minor-mode)
  :commands outline-indent-minor-mode
  :custom
  (outline-indent-ellipsis . " ▼ ")
  :config
  (setq outline-blank-line t)
  (setq-default search-invisible nil))

;; sacado de https://github.com/jamescherti/outline-indent.el#how-to-make-emacs-indent-new-lines-based-on-previous-non-blank-line
;; This ensures that pressing Enter will insert a new line and indent it.
(global-set-key (kbd "RET") #'newline-and-indent)

;; Indentation based on the indentation of the previous non-blank line.
(setq-default indent-line-function #'indent-relative-first-indent-point)

;; In modes such as `text-mode', pressing Enter multiple times removes
;; the indentation. The following fixes the issue and ensures that text
;; is properly indented using `indent-relative' or
;; `indent-relative-first-indent-point'.
(setq-default indent-line-ignored-functions '())

(leaf dtrt-indent
  :ensure t
  :commands (dtrt-indent-global-mode
             dtrt-indent-mode
             dtrt-indent-adapt
             dtrt-indent-undo
             dtrt-indent-diagnosis
             dtrt-indent-highlight)
  :config
  (dtrt-indent-global-mode))

(leaf jinx
  :custom (jinx-languages . "es en_US-w_accents")
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))

(leaf vertico
  :config
  (add-to-list 'vertico-multiform-categories
               '(jinx grid (vertico-grid-annotate . 20) (vertico-count . 4)))
  :global-minor-mode vertico-multiform-mode)

(setq user-mail-address "jorge@esavara.cr")
(setq message-signature "Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")

(defun shackra/mu4e-compose-goodies ()
  "Settings for mu4e compose mode."
  (set-fill-column 72)
  (turn-on-auto-fill)
  (electric-indent-local-mode -1)
  (jinx-mode 1))

(leaf mu4e-query
  :leaf-defer nil
  :require t
  :straight (mu4e-query :type git :host github :repo "mickeynp/mu4e-query"))

(leaf mu4e
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  :bind
  ("C-c u"	.	mu4e)
  (:mu4e-main-mode-map
   ("x"		.	bury-buffer)
   ("I"		.	mu4e-update-index)
   ("<tab>"	.	shr-next-link)
   ("<backtab>" .	shr-previous-link))
  (:mu4e-headers-mode-map
   ("M"		.	mu4e-headers-mark-all)
   ("N"		.	mu4e-headers-mark-all-unread-read))
  :hook (mu4e-compose-mode-hook . shackra/mu4e-compose-goodies)
  :preface
  (cl-defmacro shackra/mu4e-easy-context (&key c-name maildir mail smtp
					       (sent-action 'sent)
					       (name "Jorge Javier Araya Navarro")
					       (sig message-signature))
    (let
	((inbox      (concat "/" maildir "/Inbox"))
	 (sent       (concat "/" maildir "/Sent"))
	 (trash      (concat "/" maildir "/Trash"))
	 (refile     (concat "/" maildir "/Archive"))
	 (draft      (concat "/" maildir "/Drafts")))

      `(make-mu4e-context
	:name ,c-name
	:match-func (lambda (msg)
                      (when msg
			(string-match-p (concat "^/" ,maildir "/")
					(mu4e-message-field msg :maildir))))
	:vars '((user-mail-address		.	,mail)
		(user-full-name			.	,name)
		(mu4e-sent-folder		.	,sent)
		(mu4e-drafts-folder		.	,draft)
		(mu4e-trash-folder		.	,trash)
		(mu4e-refile-folder		.	,refile)
		(mu4e-compose-signature		.	(concat ,sig))
		(mu4e-sent-messages-behavior	.	,sent-action)
		(message-signature		.	,sig)
		(mu4e-maildir-shortcuts .
					((,inbox   . ?i)
					 (,sent    . ?s)
					 (,trash   . ?t)
					 (,refile  . ?a)
					 (,draft   . ?d)))))))
  :custom
  (gnus-article-date-headers		.	'(combined-local-lapsed))
  ;; la mayoria de estos fueron tomados de mu4easy-mode
  (mu4e-maildir				.	"~/Maildir")
  (mu4e-get-mail-command		.	`,(concat (executable-find "mbsync") " --push --all")) ;; no adquiere nuevo email, solo empuja los cambios locales
  (mu4e-update-interval			.	nil)
  (mu4e-attachment-dir			.	"~/Descargas")
  (mu4e-change-filenames-when-moving	.	t) ;; requerido por mbsync
  (mail-user-agent			.	'mu4e-user-agent)
  (message-citation-line-function	.	'message-insert-formatted-citation-line)
  (mu4e-compose-format-flowed		.	t)
  (mu4e-headers-auto-update		.	t)
  (mu4e-headers-date-format		.	"%d/%m/%Y %H:%M")
  (mu4e-index-cleanup			.	t)
  (mu4e-index-lazy-check		.	nil)
  (mu4e-main-hide-personal-addresses	.	t)
  (mu4e-main-buffer-name		.	"*mu4e-main*")
  (mu4e-use-fancy-chars			.	t)
  (sendmail-program			.	`,(executable-find "msmtp"))
  (message-sendmail-f-is-evil		.	t)
  (message-sendmail-extra-arguments	.	'("--read-envelope-from"))
  (message-send-mail-function		.	#'message-send-mail-with-sendmail)
  (send-mail-function			.	#'message-send-mail-with-sendmail)
  (message-signature			.	"Jorge Araya\n\nContacto:\n Telegram: t.me/shackra · Signal: Shackra.28")
  (mu4e-context-policy			.	'pick-first) ;; start with the first (default) context;
  (mu4e-compose-context-policy		.	'ask) ;; ask for context if no context matches;
  (message-kill-buffer-on-exit		.	t)
  ;; optional
  ;; store link to message if in header view, not to header query:
  (org-mu4e-link-query-in-headers-mode	.	nil)
  ;; don't have to confirm when quitting:
  (mu4e-confirm-quit			.	nil)
  ;; number of visible headers in horizontal split view:
  (mu4e-headers-visible-lines		.	5)
  ;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:
  (mu4e-hide-index-messages		.	t)
  ;; customize the reply-quote-string:
  (message-citation-line-format		.	"El %A %d de %B del %Y, %N escribió:\n")
  ;; M-x find-function RET message-citation-line-format for docs:
  (message-citation-line-function	.	'message-insert-formatted-citation-line)
  ;; by default do show related emails:
  (mu4e-search-include-related		.	nil)
  ;; omite duplicados
  (mu4e-search-skip-duplicates		.	t)
  (mu4e-headers-attach-mark		.	`("a" . ,(propertize "@" 'face '(:foreground "gold" :weight bold))))
  (mu4e-headers-calendar-mark		.	`("c" . ,(propertize "%" 'face '(:foreground "deep sky blue"))))
  (mu4e-headers-draft-mark		.	`("D" . ,(propertize "*" 'face '(:foreground "orange" :slant italic))))
  (mu4e-headers-encrypted-mark		.	`("x" . ,(propertize "?" 'face '(:foreground "medium purple" :weight bold))))
  (mu4e-headers-flagged-mark		.	`("F" . ,(propertize "+" 'face '(:foreground "red" :weight bold))))
  (mu4e-headers-list-mark		.	`("l" . ,(propertize "L" 'face '(:foreground "forest green"))))
  (mu4e-headers-new-mark		.	`("N" . ,(propertize "!" 'face '(:foreground "orange red" :weight bold))))
  (mu4e-headers-passed-mark		.	`("P" . ,(propertize ">" 'face '(:foreground "gray"))))
  (mu4e-headers-personal-mark		.	`("p" . ,(propertize "y" 'face '(:foreground "light sea green" :slant italic))))
  (mu4e-headers-replied-mark		.	`("R" . ,(propertize "R" 'face '(:foreground "steel blue" :weight bold))))
  (mu4e-headers-seen-mark		.	`("S" . ,(propertize "]" 'face '(:foreground "gray55"))))
  (mu4e-headers-signed-mark		.	`("s" . ,(propertize "{" 'face '(:foreground "green4" :weight bold))))
  (mu4e-headers-trashed-mark		.	`("T" . ,(propertize "X" 'face '(:foreground "firebrick" :weight bold))))
  (mu4e-headers-unread-mark		.	`("u" . ,(propertize "[" 'face '(:foreground "dodger blue" :weight bold))))
  (mu4e-headers-date-format		.	"%-d %b %Y") ; e.g., "3 mar 2024" (con año)
  (mu4e-headers-time-format		.	"%-d %b") ; e.g., "3 mar"
  ;; marcadores con consultas mu
  
  ;; encabezados estilo gmail
  (mu4e-headers-fields			.	'((:human-date  . 12)
						  (:flags	. 7)
						  (:from	. 30)
						  (:subject	. 92)))
  :config
  (setq shackra-query-mailing-lists '(or (from (one-of "emacs-devel@gnu.org" "help-gnu-emacs@gnu.org" "mu-discuss@googlegroups.com")) (to (one-of "emacs-devel@gnu.org" "help-emacs@gnu.org" "mu-discuss@googlegroups.com")) (cc (one-of "emacs-devel@gnu.org" "help-gnu-emacs@gnu.org" "mu-discuss@googlegroups.com"))))
  (setq mu4e-bookmarks  `((:name "Sin leer" :key ?u :query ,(mu4e-make-query `(and (flag unread) (not (flag trashed)) (not ,shackra-query-mailing-lists))))
			  (:name "Listas de correo" :key ?l :query ,(mu4e-make-query `(and (flag unread) (not (flag trashed)) ,shackra-query-mailing-lists)))
			  (:name "Marcado" :key ?f :query ,(mu4e-make-query '(flag flagged)))
			  (:name "Correos de hoy" :key ?t :query ,(mu4e-make-query '(date (today .. now))))
			  (:name "Correos de ayer" :key ?y :query ,(mu4e-make-query '(not (date (today ..)))))))
  
  (setq mu4e-contexts `(,(shackra/mu4e-easy-context
			  :c-name "personal"
			  :maildir "principal"
			  :mail "jorge@esavara.cr")
			,(shackra/mu4e-easy-context
			  :c-name  "gmail"
			  :maildir "gmail"
			  :mail    "shackrasislock0@gmail.com"
			  :sent-action delete)
			,(shackra/mu4e-easy-context
			  :c-name "yahoo"
			  :maildir "yahoo"
			  :mail "jorgejavieran@yahoo.com.mx")
			,(shackra/mu4e-easy-context
			  :c-name "jorgearaya.dev"
			  :maildir "hey"
			  :mail "hey@jorgearaya.dev"
			  :sig "Jorge Araya\nFreelance Software Engineer — https://jorgearaya.dev"
			  :sent-action delete)))
  
  (add-to-list 'mu4e-view-actions '("Aplicar correo" . mu4e-action-git-apply-mbox) t)

  (defun my/mu4e~headers-human-date (msg)
    "Mostrar fecha sin año si es del año actual; caso contrario, con año."
    (let* ((date (mu4e-msg-field msg :date))
           (tm   (decode-time date))
           (cur  (decode-time (current-time)))
           (day  (nth 3 tm))
           (mon  (nth 4 tm))
           (year (nth 5 tm))
           (cyr  (nth 5 cur)))
      (if (= year cyr)
          (format-time-string mu4e-headers-time-format date)
	(format-time-string mu4e-headers-date-format date))))

  (advice-add 'mu4e~headers-human-date :override #'my/mu4e~headers-human-date)

  (defun mi/mu4e-push-mail-al-salir (&rest _args)
    "Llama a mbsync --push --all al salir de mu4e."
    (start-process-shell-command "mbsync-push" "*mbsync-push*"
				 "mbsync --push --all"))

  (advice-add 'mu4e-quit :after #'mi/mu4e-push-mail-al-salir)

  (setf (alist-get 'trash mu4e-marks)
	'(:char ("d" . "▼")
		:prompt "dtrash"
		:dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
		;; Here's the main difference to the regular trash mark, no +T
		;; before -N so the message is not marked as IMAP-deleted, unless
		;; it's Gmail.
		:action (lambda (docid msg target)
                          (let ((maildir (mu4e-message-field msg :maildir)))
                            (if (string-match-p "Gmail\\|Google" maildir)
				(mu4e--server-move docid (mu4e--mark-check-target target) "+T+S-u-N")
                              (mu4e--server-move docid (mu4e--mark-check-target target) "+S-u-N"))))))

  (setf (alist-get 'refile mu4e-marks)
	'(:char ("r" . "▶")
		:prompt "refile"
		:dyn-target (lambda (target msg) (mu4e-get-refile-folder msg))
		;; Notice the special treatment for Gmail.
		:action (lambda (docid msg target)
                          (let ((maildir (mu4e-message-field msg :maildir)))
                            (if (string-match-p "Gmail\\|Google" maildir)
				(mu4e--server-remove docid)
                              (mu4e--server-move docid (mu4e--mark-check-target target) "+S-u-N")))))))
