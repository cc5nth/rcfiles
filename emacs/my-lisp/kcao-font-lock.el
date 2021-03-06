;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(defun kcao-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)

(defun kcao-c-mode-font-lock-if0-hook ()
  (font-lock-add-keywords
   nil
   '((kcao-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

;(add-hook 'c-mode-common-hook 'kcao-c-mode-font-lock-if0-hook)


(provide 'kcao-font-lock)
