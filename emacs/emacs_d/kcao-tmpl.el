(defun kcao-insert-tmpl (tmpl-name)
  "insert xxx templates by name"
  (interactive "stmpl-name: ")

  (let (tmpl-path)
    (cond ((string= tmpl-name "c-main-func")
           (setq tmpl-path "~/emacs/tmpl/c-main-func.txt"))
          (t
           (setq tmpl-path "~/emacs/tmpl/help.txt")))

    (insert-file tmpl-path))
  )


(defun kcao-insert-tmpl-path (tmpl-path)
  "insert tmpl by path"
  (insert-file tmpl-path))


(defun kcao-itmpl-c-main-func ()
  (interactive)
  (kcao-insert-tmpl-path "~/emacs/tmpl/c-main-func.txt"))

(defun kcao-itmpl-html-index ()
  (interactive)
  (kcao-insert-tmpl-path "~/emacs/tmpl/html-index.txt"))

(provide 'kcao-tmpl)
