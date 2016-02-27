(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(recentf-mode 1)
(savehist-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode 1)
(column-number-mode 1)
(global-subword-mode 1)
(global-font-lock-mode 1)
(show-paren-mode t)
(delete-selection-mode 1)

(setf
 x-underline-at-descent-line t ;; la linea que subraya es puesta en la base de
 ;; la tipografía en lugar de en la linea base.
 load-prefer-newer t
 save-interprogram-paste-before-kill t
 bookmark-default-file (expand-file-name "bookmarks" user-emacs-directory)
 bookmark-save-flag 1
 inhibit-startup-message t
 inhibit-startup-echo-area-message "jorge"
 initial-scratch-message nil
 line-spacing 1
 make-backup-files nil
 global-auto-revert-non-file-buffers t
 auto-revert-verbose nil
 echo-keystrokes 0.1
 shift-select-mode nil
 fill-column 80
 blink-matching-paren nil
 history-length 1000
 x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
 enable-recursive-minibuffers t
 gc-cons-percentage 0.125
 undo-tree-mode-lighter ""
 ediff-diff-options "-w"
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(setq-default truncate-lines t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(if
    (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setf default-buffer-file-coding-system 'utf-8))
(add-to-list 'default-frame-alist '(tty-color-mode . -1))
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  (flet ((process-list ())) ad-do-it))
