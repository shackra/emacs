(defun org2html-trim-string (string)
  (replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

(defun org2html--char-to-string (ch)
  (let ((chspc 32)
        (chsq 39)
        (ch0 48)
        (ch9 57)
        (cha 97)
        (chz 122)
        (chA 65)
        (chZ 90)
        (chdot 46)
        (chminus 45)
        (chunderscore 95)
        rlt)
    (cond
     ((or (and (<= ch0 ch) (<= ch ch9))
          (and (<= cha ch) (<= ch chz))
          (and (<= chA ch) (<= ch chZ))
          (= chunderscore ch)
          (= chminus ch)
          )
      (setq rlt (char-to-string ch)))
     ((or (= chspc ch) (= chsq ch) (= chdot ch))
      (setq rlt "-")))
    rlt
    ))

(defun org2html-get-slug (str)
  (let (slug )
    (setq slug (mapconcat 'org2html--char-to-string str ""))
    ;; clean slug a little bit
    (setq slug (replace-regexp-in-string "\-\-+" "-" slug))
    (setq slug (replace-regexp-in-string "^\-+" "" slug))
    (setq slug (replace-regexp-in-string "\-+$" "" slug))
    (setq slug (org2html-trim-string slug))
    (setq slug (downcase slug))
    slug))

(defun org2html-replace-pre (html)
  "Replace pre blocks with sourcecode shortcode blocks.
shamelessly copied from org2blog/wp-replace-pre()"
  (save-excursion
    (let (pos code lang info params header code-start code-end html-attrs pre-class)
      (with-temp-buffer
        (insert html)
        (goto-char (point-min))
        (save-match-data
          (while (re-search-forward "<pre\\(.*?\\)>" nil t 1)

            ;; When the codeblock is a src_block
            (unless
                (save-match-data
                  (setq pre-class (match-string-no-properties 1))
                  (string-match "example" pre-class))
              ;; Replace the <pre...> text
              (setq lang (replace-regexp-in-string ".*src-\\([a-zA-Z0-9]+\\).*" "\\1" pre-class)  )

              (replace-match "")
              (setq code-start (point))

              ;; Go to end of code and remove </pre>
              (re-search-forward "</pre.*?>" nil t 1)
              (replace-match "")
              (setq code-end (point))
              (setq code (buffer-substring-no-properties code-start code-end))

              ;; Delete the code
              (delete-region code-start code-end)
              ;; Stripping out all the code highlighting done by htmlize
              (setq code (replace-regexp-in-string "<.*?>" "" code))

              ;; default is highlight.js, it's the best!
              (insert (concat "\n<pre><code class=\"lang-"
                              lang
                              "\">\n"
                              code
                              "</code></pre>\n"))

              )))

        ;; Get the new html!
        (setq html (buffer-substring-no-properties (point-min) (point-max))))
      ))
  html)

(defun org2html--render-subtree ()
  "Render current subtree"
  (let ((org-directory default-directory)
        html-file
        tags
        title
        post-slug
        html-text)

    ;; set title
    (setq title (nth 4 (org-heading-components)))

    ;; set POST_SLUG if its does not exist
    (setq post-slug (org2html-get-slug title))
    ;; html file
    (setq html-file (concat (file-name-as-directory default-directory) post-slug ".html"))
    (setq html-text (org2html-export-into-html-text))

    (save-excursion
      (setq html-text (org2html-replace-pre html-text)))

    (with-temp-file html-file
      (insert html-text))
    (message "%s created" html-file)
    ))

(defun org2html-export-into-html-text ()
  (let (html-text b e)

    (save-excursion
      (org-mark-element)
      (forward-line) ;; donot export title
      (setq b (region-beginning))
      (setq e (region-end))
      )

    ;; org-export-as will detect active region and narrow to the region
    (save-excursion
      (setq html-text
            (cond
             ((version-list-< (version-to-list (org-version)) '(8 0 0))
              (if (fboundp 'org-export-region-as-html)
                  (org-export-region-as-html b e t 'string)))
             (t
              (if (fboundp 'org-export-as)
                  (org-export-as 'html t nil t)))
             )))
    html-text))

(defun org2html-export-subtree ()
  "Export current first level subtree into HTML"
  (interactive)
  (let ((org-directory default-directory)
        html-file
        tags
        title
        post-slug
        html-text)

    ;; just goto the root element
    (condition-case nil
        (outline-up-heading 8)
      (error
       (message "at the beginning ...")))

    ;; should be nil
    (org2html--render-subtree)
    ))


(defun org2html-wrap-blocks-in-code (src backend info)
  (if (org-export-derived-backend-p backend 'html)
      (org2html-replace-pre src)))
