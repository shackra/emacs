(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
    ("c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(elpy-interactive-python-command "ipython")
 '(elpy-mode-hook (quote (hl-line-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet)))
 '(elpy-rpc-backend "jedi")
 '(elpy-rpc-python-command "python2")
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
 '(org-babel-load-languages (quote ((ledger . t) (python . t) (emacs-lisp . t))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-habit org-id org-info org-irc org-mhe org-rmail org-w3m org-expiry org-invoice)))
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
