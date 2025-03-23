prog-mode

;; taken from https://github.com/minad/tempel/blob/5b09f612cfd805dba5e90bf06580583cab045499/README.org#template-file-format (GPL-3.0 license)
(fixme (if (derived-mode-p 'emacs-lisp-mode) ";;" comment-start) " FIXME(shackra) ")
(todo (if (derived-mode-p 'emacs-lisp-mode) ";;" comment-start) " TODO(shackra) ")
(bug (if (derived-mode-p 'emacs-lisp-mode) ";;" comment-start) " BUG(shackra) ")
(hack (if (derived-mode-p 'emacs-lisp-mode) ";;" comment-start) " HACK(shackra) ")
(note (if (derived-mode-p 'emacs-lisp-mode) ";;" comment-start) " NOTE(shackra) ")
