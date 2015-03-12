(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#151515" "#953331" "#546a29" "#909737" "#385e6b" "#7f355e" "#34676f" "#c6a57b"])
 '(auth-source-save-behavior nil)
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
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "134f38000f413a88743764983c751ac34edbec75a602065e2ae3b87fcf26c451" "930a202ae41cb4417a89bc3a6f969ebb7fcea5ffa9df6e7313df4f7a2a631434" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(elpy-interactive-python-command "ipython")
 '(elpy-mode-hook (quote (hl-line-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet)))
 '(elpy-rpc-backend "jedi")
 '(elpy-rpc-python-command "python")
 '(fci-rule-color "#151515")
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc)))
 '(flycheck-idle-change-delay 2.0)
 '(flycheck-indication-mode (quote right-fringe))
 '(global-flycheck-mode t nil (flycheck))
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
 '(jabber-activity-mode nil)
 '(jabber-alert-info-message-hooks (quote (jabber-info-libnotify)))
 '(jabber-alert-message-hooks (quote (jabber-message-libnotify jabber-message-scroll)))
 '(jabber-alert-muc-hooks (quote (jabber-muc-libnotify-personal jabber-muc-scroll)))
 '(jabber-alert-presence-hooks (quote (jabber-presence-libnotify)))
 '(jabber-auto-reconnect t)
 '(jabber-chat-buffer-format "*-chat-%n-*")
 '(jabber-chat-delayed-time-format "%d-%m-%Y %H:%M")
 '(jabber-chat-fill-long-lines nil)
 '(jabber-chat-foreign-prompt-format "[%t] %n > ")
 '(jabber-groupchat-buffer-format "*-gc-%n-*")
 '(jabber-groupchat-prompt-format "[%t] %n > ")
 '(jabber-info-message-alist
   (quote
    ((roster . "Actualizada la vizualización del roster")
     (browse . "Solicitud de navegación completada"))))
 '(jabber-libnotify-app "Jabber.el")
 '(jabber-libnotify-icon "emacs")
 '(jabber-libnotify-message-header "Mensaje en Jabber")
 '(jabber-libnotify-timeout 10000)
 '(jabber-libnotify-urgency "normal")
 '(jabber-message-alert-same-buffer nil)
 '(jabber-mode-line-compact nil)
 '(jabber-muc-completion-delimiter ", ")
 '(jabber-muc-private-buffer-format "*-muc-priv-%g-%n-*")
 '(jabber-roster-buffer "*-roster-*")
 '(magit-use-overlays nil)
 '(org-agenda-files
   (quote
    ("/home/jorge/org/cosasporhacer.org" "/home/jorge/org/agenda.org")))
 '(org-babel-load-languages (quote ((ledger . t) (python . t) (emacs-lisp . t))))
 '(org-catch-invisible-edits (quote show))
 '(org-clock-persist (quote history))
 '(org-ctrl-k-protect-subtree t)
 '(org-default-notes-file "/home/jorge/org/diario.org")
 '(org-directory "/home/jorge/org")
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
 '(py-autopep8-options
   (quote
    ("--ignore E711,E712,E24" "--aggressive --aggressive --aggressive")))
 '(python-shell-interpreter "python2")
 '(pyvenv-virtualenvwrapper-python "/usr/bin/python2")
 '(safe-local-variable-values
   (quote
    ((ispell-local-dictionary . english)
     (ispell-local-dictionary . en)
     (ispell-dictionary . en)
     (encoding . utf-8))))
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "/bin/bash")
 '(vr/default-replace-preview t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jabber-chat-text-foreign ((t (:foreground "white smoke")))))
