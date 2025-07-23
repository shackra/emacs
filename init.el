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
  :hook (after-init-hook . save-place-mode)
  :config
  (setq save-place-file (expand-file-name ".mis-lugares-guardados" user-emacs-directory))
  :custom
  (save-place-ignore-files-regexp . "\\(?:COMMIT_EDITMSG\\|hg-editor-[[:alnum:]]+\\.txt\\|elpa\\|svn-commit\\.tmp\\|bzr_log\\.[[:alnum:]]+\\)$")
  (save-place-forget-unreadable-files . t))

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
