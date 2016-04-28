(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#151515" "#953331" "#546a29" "#909737" "#385e6b" "#7f355e" "#34676f" "#c6a57b"])
 '(ansi-term-color-vector
   [unspecified "#3B3228" "#cb6077" "#beb55b" "#f4bc87" "#8ab3b5" "#a89bb9" "#8ab3b5" "#d0c8c6"] t)
 '(auth-source-save-behavior nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(byte-compile-warnings nil)
 '(calendar-christian-all-holidays-flag t)
 '(calendar-date-style (quote european))
 '(calendar-holidays
   (quote
    ((holiday-fixed 1 1 "Año nuevo")
     (holiday-fixed 2 14 "San Valentin")
     (holiday-fixed 8 15 "Día de la Madre")
     (holiday-float 6 0 3 "Día del Padre")
     (holiday-fixed 9 15 "Día de la Independencia")
     (holiday-fixed 5 1 "Día Internacional del Trabajo")
     (holiday-fixed 7 25 "Anexión del Partido de Nicoya a Costa Rica")
     (holiday-fixed 8 2 "Día de la Virgen de los Ángeles")
     (holiday-fixed 9 12 "Día de las Culturas")
     (holiday-fixed 10 31 "Víspera de Todos los Santos")
     (holiday-fixed 11 19 "Día Internacional del Hombre")
     (holiday-easter-etc)
     (holiday-fixed 12 25 "Navidad")
     (if calendar-christian-all-holidays-flag
         (append
          (holiday-fixed 1 6 "Epifanía")
          (holiday-julian 12 25 "Navidad (calendario Juleano)")
          (holiday-greek-orthodox-easter)
          (holiday-fixed 8 15 "Asunción de María")
          (holiday-advent 0 "Adviento")))
     (solar-equinoxes-solstices))))
 '(custom-safe-themes
   (quote
    ("51867fa64534ff7ca87fdc1537fbfffc168fa4673e3980850436dc87e31ef426" "3119b66b441eaa36acad473952dfdf901a5924b1fbc995b58477f031e12547c4" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "134f38000f413a88743764983c751ac34edbec75a602065e2ae3b87fcf26c451" "930a202ae41cb4417a89bc3a6f969ebb7fcea5ffa9df6e7313df4f7a2a631434" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
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
 '(holiday-christian-holidays
   (quote
    ((holiday-easter-etc)
     (holiday-fixed 12 25 "Navidad")
     (if calendar-christian-all-holidays-flag
         (append
          (holiday-fixed 1 6 "Epifanía")
          (holiday-julian 12 25 "Navidad (calendario Juleano)")
          (holiday-greek-orthodox-easter)
          (holiday-fixed 8 15 "Asunción de María")
          (holiday-advent 0 "Adviento"))))))
 '(holiday-general-holidays
   (quote
    ((holiday-fixed 1 1 "Año nuevo")
     (holiday-fixed 2 14 "San Valentin")
     (holiday-fixed 8 15 "Día de la Madre")
     (holiday-float 6 0 3 "Día del Padre")
     (holiday-fixed 9 15 "Día de la Independencia")
     (holiday-fixed 5 1 "Día Internacional del Trabajo")
     (holiday-fixed 7 25 "Anexión del Partido de Nicoya a Costa Rica")
     (holiday-fixed 8 2 "Día de la Virgen de los Ángeles")
     (holiday-fixed 9 12 "Día de las Culturas")
     (holiday-fixed 10 31 "Víspera de Todos los Santos"))))
 '(holiday-other-holidays
   (quote
    ((holiday-fixed 11 19 "Día Internacional del Hombre"))))
 '(magit-use-overlays nil)
 '(org-agenda-files (quote ("/home/jorge/org/cosas por hacer.org")))
 '(org-babel-load-languages (quote ((ledger . t) (python . t) (emacs-lisp . t))))
 '(org-catch-invisible-edits (quote show))
 '(org-clock-persist (quote history))
 '(org-ctrl-k-protect-subtree t)
 '(org-default-notes-file "/home/jorge/org/diario.org")
 '(org-directory "/home/jorge/org")
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
 '(py-autopep8-options nil)
 '(python-shell-interpreter "python3")
 '(pyvenv-virtualenvwrapper-python "/usr/bin/python3")
 '(safe-local-variable-values
   (quote
    ((buffer-read-only . 1)
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
 '(jabber-chat-text-foreign ((t (:foreground "white smoke"))))
 '(org-default ((t (:inherit default :family "Source Sans Pro"))))
 '(org-document-info ((t (:foreground "#81d4fa" :height 1.35 :family "Source Sans Pro"))))
 '(org-document-title ((t (:foreground "#ffffff" :weight bold :height 1.35 :family "Source Sans Pro")))))
