
;; make ENTER as newline-and-indent
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'lisp-mode-hook 'set-newline-and-indent)
(add-hook 'python-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'sh-mode-hook 'set-newline-and-indent)


;; indent
;; -----------------------------------------------
;; c & cc
;(setq c-default-style "linux"
;      c-basic-offset 8)
;(defun kcao-c-mode-hook ()
;  (c-set-style "linux")
;  (setq c-basic-offset 8)
;  (setq c-basic-indent 8)
;  (setq indent-tabs-mode t)
;  (setq tab-width 8))

;(add-hook 'c-mode-common-hook 'kcao-c-mode-hook)
;(add-hook 'c-mode-hook 'kcao-c-mode-hook)

(defvar xtab-keywords '("4spaces-tab-file-name" "4spaces-tab-file-name2" "xyzabc123__")
  "Keywords which are used to indicate this file is using 4-space indent.")

(defun kcao-c-coding-style-by-fname ()
  (let* ((filename (buffer-file-name))
         (is-xtab-mode nil))
    (if filename
        (dolist (keyword xtab-keywords)
          (if (string-match keyword filename)
              (setq is-xtab-mode t))))
    (if is-xtab-mode
        (progn (c-set-style "linux")
               (setq c-basic-offset 4)
               (setq c-basic-indent 4)
               (setq indent-tabs-mode nil)
               (setq tab-width 4))
      (progn (c-set-style "linux")
             (setq c-basic-offset 8)
             (setq c-basic-indent 8)
             (setq indent-tabs-mode t)
             (setq tab-width 8)))))

(add-hook 'c-mode-hook 'kcao-c-coding-style-by-fname)

(defun kcao-c++-mode-hook ()
  (setq c-basic-offset 4)
  (setq c-basic-indent 4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

(add-hook 'c++-mode-hook 'kcao-c++-mode-hook)

;; python
(defun kcao-python-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'python-mode-hook 'kcao-python-mode-hook)

;; html

;; syntax highlight
;; -----------------------------------------------
;; is enabled by default since 22.1

(require 'kcao-font-lock)
(add-hook 'c-mode-hook 'kcao-c-mode-font-lock-if0-hook)

;(global-font-lock-mode 0) ;; uncomment to disable

;; code navigate
;; -----------------------------------------------
(require 'gtags)
(setq gtags-suggested-key-mapping t)
(add-hook 'c-mode-common-hook
          (lambda () (gtags-mode)))
(add-hook 'c-mode-common-hook
          (lambda () (hs-minor-mode)))

(require 'xcscope)
(setq cscope-program "gtags-cscope")
(setq cscope-do-not-update-database t)

(setq cscope-option-use-inverted-index t)
;(setq cscope-option-kernel-mode t)
;(setq cscope-option-...)

(setq cscope-database-regexps
      '(("^/home/kcao/.*" (t ("-q" "-d")) t)  ))

;(require 'ecb)
;(put 'set-goal-column 'disabled nil)

(provide 'kcao-coding)
