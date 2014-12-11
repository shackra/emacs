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
    ("9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
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
 '(jabber-alert-info-message-hooks (quote (jabber-info-xmessage)))
 '(jabber-alert-muc-hooks (quote (jabber-muc-echo-personal jabber-muc-scroll)))
 '(magit-use-overlays nil)
 '(org-babel-load-languages (quote ((ledger . t) (python . t) (emacs-lisp . t))))
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
 )
