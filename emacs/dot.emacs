;; .emacs

;; init:
(setq inhibit-default-init t) ;; loading of "default.el" at startup?
(setq inhibit-startup-message t) ;; Don't want any startup message

;; ----------------------------------------------
(setq user-full-name "Ken Chen Cao")
(setq user-mail-address "ken.ccao@outlook.com")

(setq-default current-language-environment "UTF-8")

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; ----------------------------------------------
;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; ----------------------------------------------
(setq default-frame-alist (append (list
  '(width  . 80)  ; Width set to 80 characters
  '(height . 35)) ; Height set to 35 lines
   default-frame-alist))

;; ----------------------------------------------
;;(set-background-color "white") ; Set emacs bg color
;;(set-foreground-color "black") ; Set emacs fg color

(menu-bar-mode 0)
;; gui options
(if (display-graphic-p)
    (progn
        (menu-bar-mode 1)
        (scroll-bar-mode 1)
        (tool-bar-mode 0)
        (tooltip-mode 0)))

(display-time-mode 1)
(column-number-mode 1)

(setq-default major-mode 'text-mode)

;; ----------------------------------------------
;; save and backup
(setq make-backup-files         nil) ; Don't want any backup files
;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; -----------------------------------------------
;; default faces
(set-face-attribute 'default nil
                    :inherit nil
                    :stipple nil
                    :inverse-video nil
                    :box nil
                    :strike-through nil
                    :overline nil
                    :underline nil
                    :slant 'normal
                    :weight 'normal
                    :height 110
                    :width 'normal
                    :foundry "unknown"
                    ;; "DejaVu Sans Mono"
                    :family "Monospace")

;; selection:
;; enable visual feedback on selections
;(transient-mark-mode 0) ; enabled by default since 23.0
                         ; uncomment to disable

;; cursor
(set-cursor-color "black")
(setq-default cursor-type "hollow")
;;(blink-cursor-mode 0)
(setq x-stretch-cursor t)

;; mouse:
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

;; highlight modes
(global-hl-line-mode 0) ;; current line

;; syntax highlight
;; is enabled by default since 22.1
(global-font-lock-mode 0) ;; uncomment to disable

;; parenthesis
(show-paren-mode 1)
(setq blink-matching-paren t)

;; show trailing ws
(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil
                    :background "gray95")

;; ----------------------------------------------
(setq load-path (append load-path '("~/.emacs_d")))

(require 'kcao-keys)


;; -----------------------------------------------
;; utils

;; diff: default to unified diffs
(setq diff-switches "-u")

;; spell:
;;(setq-default ispell-program-name "aspell")

;; search:
(setq search-highlight t) ; Highlight search object
(setq isearch-highlight t)
(setq query-replace-highlight t) ; Highlight query object

;; diary
(setq diary-file "~/kcao/ediary")
(setq diary-mail-addr "ken.ccao@outlook.com")
;(add-hook 'diary-hook 'appt-make-list)


;; code navigate:
(require 'xcscope)
(setq cscope-do-not-update-database t)


;; -----------------------------------------------
;; shell
(ansi-color-for-comint-mode-on)

;; -----------------------------------------------
;; Custom
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal))))
 '(paren-match ((t (:background "darkseagreen4"))) t))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; ----------------------------------------------
;;(setq default-abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))

;; add the follow line for my muttrc editor="emacs --execute \"(xxxxx)\""
(add-hook 'mail-mode-hook (lambda () (abbrev-mode 1)))
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;; ----------------------------------------------
;; Auto Fill mode
(setq-default fill-column 75)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'auto-fill-mode)


;; ----------------------------------------------
;; auto-complete
;; http://auto-complete.org/
(add-to-list 'load-path "/opt/kcao/src/emacs/ac")
(add-to-list 'load-path "/opt/kcao/src/emacs/fuzzy-el")
(add-to-list 'load-path "/opt/kcao/src/emacs/popup-el")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/opt/kcao/src/emacs/ac/dict")

(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "C-c TAB") 'auto-complete)


;; -----------------------------------------------
;; ido-mode.
;; since icomplete-mode is somehow annoying
(require 'ido)
(ido-mode t)
;(icomplete-mode t)


;; -----------------------------------------------
;; tabs & indent
(setq-default tab-width 8)
(setq-default highlight-tabs t)
(setq-default indent-tabs-mode nil)
(setq cua-auto-tabify-rectangles nil)


;; make ENTER as newline-and-indent
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'lisp-mode-hook 'set-newline-and-indent)
(add-hook 'python-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'sh-mode-hook 'set-newline-and-indent)


;; -----------------------------------------------
;; c & cc
;(setq c-default-style "linux"
;      c-basic-offset 8)
(add-hook 'c-mode-common-hook '(lambda () (c-set-style "linux")
                                 (setq c-basic-offset 8)
                                 (setq c-basic-indent 8)
                                 (setq indent-tabs-mode t)
                                 (setq tab-width 8)))

;; python
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)))

;; html


;; -----------------------------------------------

;; -----------------------------------------------
;(server-start)

;; -----------------------------------------------
(load-file "~/.emacs.utils.el")
(load-file "~/.emacs.org.el")
;(load-file "~/.erc.kcao.el")
