;; -----------------------------------------------
;; for org-mode and remember
;;
(require 'org-install)
(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

;;(define-key global-map "\C-ca" 'org-agenda)
;;(define-key global-map "\C-cl" 'org-store-link)
;;(setq org-log-done t)
;;

(setq org-agenda-files (list "~/kcao/gtd-org/rh.org"
                             "~/tests/emacs-org/natural_p.org"))
(setq org-default-notes-file "~/kcao/gtd-org/notes.org")

(setq org-todo-keywords
      '((sequence "REPORT(r)" "BUG(b)" "|" "FIXED(f)")
        (sequence "TODO(t!)" "POSTPONED(p)" "|" "DONE(d@)" "CANCELED(c@/!)")))

(setq org-remember-store-without-prompt nil)
(setq org-remember-templates
 (quote ((116 "* TODO %? %u" "~/kcao/gtd-org/todo.org" "Tasks")
         (110 "* %u %?" "~/kcao/gtd-org/notes.org" "Notes"))))

(setq remember-annotation-functions (quote (org-remember-annotation)))
(setq remember-handler-functions (quote (org-remember-handler)))

;; diary

(setq org-agenda-include-diary nil)
(setq org-agenda-diary-file "~/kcao/gtd-org/ediary.org")

;;
;; M-x org-mode P for "Project List"
;;(setq org-agenda-custom-commands
;;     '(("P" "Project List"
;;         ( (tags "PROJECT")
;;         )
;;       )
;;       ("O" "Office"
;;         ( (agenda)
;;           (tags-todo "OFFICE")
;;         )
;;       )
;;       ("W" "Weekly Plan"
;;         ( (agenda)
;;           (todo "TODO")
;;           (tags "PROJECT")
;;         )
;;       )
;;       ("H" "Home NA Lists"
;;         ( (agenda)
;;           (tags-todo "HOME")
;;           (tags-todo "COMPUTER")
;;         )
;;       )
;;      )
;; )
