;;; editor/shackra:reformat/init.el -*- lexical-binding: t; -*-

(defun reformat-add-formatter! (formatter)
  "Add formatter FORMATTER."
  (push formatter apheleia-formatters))

;; FIXME: ninguna de estas funciones sirven del todo xd
(defun reformat-change-formatter! (name new-command)
  "Change formatter NAME with NEW-COMMAND."
  (setf (alist-get name apheleia-formatters) new-command))

(defun reformat-push-formatter! (mode formatter)
  "Push formatter FORMATTER for major-moide MODE."
  (let* ((current-formatters (alist-get mode apheleia-mode-alist)))
    (cl-pushnew current-formatters formatter)
    (setf (alist-get mode apheleia-mode-alist) current-formatters)))

(defun reformat-sort-formatters! (mode order)
  "Set a new order ORDER of formatters for major-mode MODE."
  (let* ((old-order (alist-get mode apheleia-mode-alist)))
    (setf (alist-get mode apheleia-mode-alist) order)
    (message (format "change order for %s from %s to %s" mode old-order (alist-get mode apheleia-mode-alist)))))
