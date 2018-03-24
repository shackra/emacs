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
 '(fci-rule-color "#383838")
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
 '(package-selected-packages
   (quote
    (lsp-vue vue-mode org-plus-contrib counsel-notmuch notmuch-labeler org-bullets org-beautify-theme zenburn-theme undo-tree keyfreq dired-details+ ranger windresize ace-window ivy-hydra tern virtualenvwrapper counsel counsel-projectile switch-buffer-functions realgud meghanada org-redmine slack org-download multiple-cursors gimp-mode yapfify importmagic dockerfile-mode docker-compose-mode docker isortify pippel noflet org2web json-mode xref-js2 ng2-mode kotlin-mode gradle-mode flycheck-kotlin kotlin ox-gfm el2org chronos pkgbuild-mode free-keys company-emoji emojify pdf-tools shackle mingus ws-butler elfeed golden-ratio aurel pretty-mode systemd alert vimish-fold telephone-line all-the-icons fixmee mustache-mode golden-ratio-scroll-screen move-text paredit aggressive-indent hungry-delete visual-fill-column pcre2el flycheck-package flyspell-correct-ivy scss-mode stylus-mode slime android-mode indium js2-refactor company-tern flycheck-gometalinter go-guru godoctor go-snippets go-eldoc company-go go-mode php-mode php-refactor-mode web-beautify web-mode ac-html-bootstrap company-web emmet-mode python-environment flycheck-rust company-racer racer cargo yaml-mode toml-mode traad pony-mode company-anaconda py-autopep8 pyvenv org-trello org-projectile rainbow-mode highlight-escape-sequences highlight-numbers weechat org-webpage sx iedit moz-controller bookmark+ imenu-anywhere kill-or-bury-alive hgignore-mode monky git-gutter-fringe magit-gh-pulls gitconfig-mode gitignore-mode multi-term ag company-auctex company-quickhelp company-statistics company nlinum feature-mode prodigy pydoc-info sphinx-doc tide expand-region font-lock-studio webpaste highlight-indent-guides el-pocket twittering-mode better-defaults use-package org)))
 '(py-autopep8-options nil)
 '(python-shell-interpreter "python")
 '(pyvenv-virtualenvwrapper-python "/usr/bin/python")
 '(smtpmail-smtp-server "mail.privateemail.com")
 '(smtpmail-smtp-service 587)
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "/bin/bash")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
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
