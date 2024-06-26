(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(safe-local-variable-values
   '((+format-with . alejandra)
     (go-tag-args "-transform" "camelcase")
     (git-commit-major-mode . git-commit-elisp-text-mode)
     (org-download-image-dir . "./imagenes")
     (org-clock-mode-line-total . today)))
 '(warning-suppress-types
   '((emacsql)
     (lsp-on-idle-hook)
     (lsp-mode)
     (lsp-mode)
     (doom-first-file-hook)
     (doom-first-input-hook)
     (doom-init-ui-hook))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "white" :background "red" :weight bold :height 1.2 :box (:line-width 10 :color "red")))))
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
