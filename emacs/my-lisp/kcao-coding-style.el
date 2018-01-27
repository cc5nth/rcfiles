
;; Add kernel style
(c-add-style "my-kernel-style"
             '( "linux"
                (c-basic-offset . 8)
                (indent-tabs-mode . t)
                (tab-width . 8)
                (c-comment-only-line-offset . 0)
                (c-hanging-braces-alist
                 (brace-list-open)
                 (brace-entry-open)
                 (substatement-open after)
                 (block-close . c-snug-do-while)
                 (arglist-cont-nonempty))
                (c-cleanup-list brace-else-brace)
                (c-offsets-alist
                 (statement-block-intro . +)
                 (knr-argdecl-intro . 0)
                 (substatement-open . 0)
                 (substatement-label . 0)
                 (label . 0)
                 (statement-cont . +))
                ))

(c-add-style "xx-cpp4-style"
             '( "k&r"
                (c-basic-offset . 4)
                (indent-tabs-mode . nil)
                (tab-width . 4)
                (c-comment-only-line-offset . 0)
                (c-hanging-braces-alist
                 (brace-list-open)
                 (brace-entry-open)
                 (substatement-open after)
                 (block-close . c-snug-do-while)
                 (arglist-cont-nonempty))
                (c-cleanup-list brace-else-brace)
                (c-offsets-alist
                 (statement-block-intro . +)
                 (knr-argdecl-intro . 0)
                 (substatement-open . 0)
                 (substatement-label . 0)
                 (label . 0)
                 (statement-cont . +))
                ))

(defvar kernel-keywords '("linux.git" "linux-4" "kernel" "driver")
  "Keywords which are used to indicate this file is kernel code.")

(add-hook 'c-mode-hook
          (lambda ()
            (let* ((filename (buffer-file-name))
                   (is-kernel-code nil))
              (if filename
                  (dolist (keyword kernel-keywords)
                    (if (string-match keyword filename)
                        (setq is-kernel-code t))))
              (if is-kernel-code
                  (c-set-style "my-kernel-style")
                (c-set-style "xx-cpp4-style")))))



(provide 'kcao-coding-style)
