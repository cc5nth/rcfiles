;;

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(global-set-key [next] 'scroll-up-half) ;; PgDn
(global-set-key [prior] 'scroll-down-half) ;; PgUp


(defun kcao-pair-par()
  (interactive)
  (insert "()")
  (backward-char))

(defun enable-kcao-pair-par()
  (interactive)
  (local-set-key (kbd "C-c (") 'kcao-pair-par))


(add-hook 'text-mode-hook 'enable-kcao-pair-par)
;;(global-set-key (kbd "C-c (") 'kcao-pair-par) ;;

(global-set-key (kbd "C-c <f5>") 'redraw-display)
(global-set-key (kbd "C-c <f11>") 'rename-buffer)
(global-set-key (kbd "C-c <f12>") 'ansi-term)
;(global-set-key (kbd "C-c <f9>") 'ibus-toggle)

(global-set-key (kbd "C-c m") 'set-mark-command)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "M-*") 'pop-tag-mark)

(provide 'kcao-keys)
