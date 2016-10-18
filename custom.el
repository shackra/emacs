(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/opt/android")
 '(auth-source-save-behavior nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(byte-compile-warnings nil)
 '(calendar-christian-all-holidays-flag t)
 '(calendar-date-style (quote european))
 '(custom-safe-themes
   (quote
    ("f1a6cbc40528dbee63390fc81da426f1b00b4fc09a60fe35752f5838b12fbe0a" "51867fa64534ff7ca87fdc1537fbfffc168fa4673e3980850436dc87e31ef426" "3119b66b441eaa36acad473952dfdf901a5924b1fbc995b58477f031e12547c4" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "134f38000f413a88743764983c751ac34edbec75a602065e2ae3b87fcf26c451" "930a202ae41cb4417a89bc3a6f969ebb7fcea5ffa9df6e7313df4f7a2a631434" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(fci-rule-color "#151515")
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (describe-symbol . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (disassemble . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (execute-extended-command))))
 '(hl-sexp-background-color "#1c1f26")
 '(lui-formatting-list
   (quote
    (("\\(?:\\(?:^\\|[	 ]\\)\\*\\([^	 *]\\(?:[	 ]+[^	 *]+\\)*\\)\\*\\(?:$\\|[	 ]\\)\\)" 1
      (quote lui-strong-face))
     ("\\(?:\\(?:^\\|[	 ]\\)_\\([^	 *]\\(?:[	 ]+[^	 *]+\\)*\\)_\\(?:$\\|[	 ]\\)\\)" 1
      (quote lui-emphasis-face)))))
 '(magit-commit-arguments nil)
 '(magit-use-overlays nil)
 '(org-agenda-files (quote ("/home/jorge/org/cosas por hacer.org")))
 '(org-babel-load-languages (quote ((ledger . t) (python . t) (emacs-lisp . t))))
 '(org-catch-invisible-edits (quote show))
 '(org-clock-persist (quote history))
 '(org-ctrl-k-protect-subtree t)
 '(org-default-notes-file "/home/jorge/org/diario.org")
 '(org-directory "/home/jorge/org")
 '(org-export-backends (quote (ascii html icalendar latex md texinfo)))
 '(org-fontify-quote-and-verse-blocks t)
 '(org-footnote-auto-adjust t)
 '(org-habit-graph-column 55)
 '(org-imenu-depth 5)
 '(org-log-done (quote time))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-habit org-id org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-special-ctrl-k t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-todo-keywords
   (quote
    ((sequence "POR-HACER(p)" "EN-PROGRESO(g)" "EN-ESPERA(e@/!)" "EN-REVISIÓN(r@/!)" "|" "CANCELADO(c@)" "TERMINADO(t!)"))))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files
   (quote
    ("/home/jorge/go/src/bitbucket.org/capslockdev/betsy/proyecto.org")) nil (org-trello))
 '(package-selected-packages
   (quote
    (org-trello go-projectile weechat org-projectile python-environment flycheck-package flycheck-rust racer company-racer cargo rustfmt nlinum company-statistics move-text ag zenburn-theme yaml-mode ws-butler windresize web-server web-mode web-beautify visual-regexp-steroids visual-fill-column vimish-fold use-package undo-tree twittering-mode traad toml-mode theme-changer telephone-line systemd sx switch-buffer-functions stylus-mode slime skewer-mode shackle scss-mode rust-mode ranger rainbow-mode pyvenv py-autopep8 pretty-mode pony-mode php-refactor-mode php-mode pdf-tools paredit package-safe-delete ox-reveal org-webpage org-bullets mustache-mode multi-term moz-controller monky mingus mediawiki material-theme magit-gh-pulls kill-or-bury-alive keyfreq js2-refactor ivy-hydra imenu-anywhere hungry-delete highlight-numbers highlight-indent-guides highlight-escape-sequences hgignore-mode golden-ratio go-snippets gitignore-mode gitconfig-mode git-gutter-fringe free-keys flyspell-correct-ivy flycheck fixmee expand-region emojify emmet-mode elfeed el-pocket dired-details+ dired+ company-web company-tern company-quickhelp company-go company-emoji company-auctex company-anaconda circe-notifications camcorder bookmark+ better-defaults base16-theme aurel android-mode all-the-icons aggressive-indent ace-window ac-html-bootstrap)))
 '(py-autopep8-options nil)
 '(python-shell-interpreter "python3")
 '(pyvenv-virtualenvwrapper-python "/usr/bin/python3")
 '(safe-local-variable-values
   (quote
    ((eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons "../package-build" load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))
     (eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))
     (buffer-read-only . 1)
     (shackra:var-python-version . 3)
     (pyvenv-workon . kuotaru)
     (shackra:var-python-ver . 2)
     (shackra:var-python-ver . 3)
     (ispell-dictionary . "en")
     (pyvenv-workon . sent-api)
     (ispell-local-dictionary . english)
     (ispell-local-dictionary . en)
     (ispell-dictionary . en)
     (encoding . utf-8))))
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "/bin/bash")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(vr/default-replace-preview t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(mode-line ((t (:box nil))))
 '(mode-line-highlight ((t (:box nil))))
 '(mode-line-inactive ((t (:box nil)))))
