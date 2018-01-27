;; .emacs

;; init:
(setq inhibit-default-init t) ;; loading of "default.el" at startup?
(setq inhibit-startup-message t) ;; Don't want any startup message

;; ----------------------------------------------
(setq user-full-name "Ken Chen Cao")
(setq user-mail-address "ken.ccao@outlook.com")


;; encoding
;; ----------------------------------------------
;(prefer-coding-system 'utf-8)
(setq-default current-language-environment "UTF-8")

;; help, o, default-file-name-coding-system --> utf-8-unix
;(setq file-name-coding-system 'gbk)

;(setq default-buffer-file-coding-system 'utf-8-unix)
;(setq default-keyboard-coding-system 'utf-8-unix)
;(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
;(setq default-sendmail-coding-system 'utf-8-unix)
;(setq default-terminal-coding-system 'utf-8-unix)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; solve org-mode table font size problem in Windows
;(set-default-font "Consolas")
;(set-fontset-font "fontset-default" 'chinese-gbk "微软雅黑")
;
;(setq face-font-rescale-alist '(("宋体" . 1.2)
;                                ("微软雅黑" . 1.1)))

;; file defaults
;; ----------------------------------------------
(setq-default major-mode 'text-mode)

;; save and backup
(setq make-backup-files         nil) ; Don't want any backup files
;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; new line at the end of file
(setq require-final-newline t)

;; -----------------------------------------------
;; tabs & indent
(setq-default tab-width 8)
(setq-default highlight-tabs t)
(setq-default indent-tabs-mode nil)
(setq cua-auto-tabify-rectangles nil)

;; look and feel
;; ----------------------------------------------
;; interface
;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; ----------------------------------------------
(setq default-frame-alist (append (list
  '(width  . 80)  ; Width set to 80 characters
  '(height . 35)) ; Height set to 35 lines
   default-frame-alist))

;;(set-background-color "white") ; Set emacs bg color
;;(set-foreground-color "black") ; Set emacs fg color

(menu-bar-mode 0)
(tool-bar-mode 0)
;; gui options
(if (display-graphic-p)
    (progn
        (menu-bar-mode 1)
        (scroll-bar-mode 1)
        (tool-bar-mode 0)
        (tooltip-mode 0)))

(display-time-mode 1)
(column-number-mode 1)

;; mouse:
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

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

;; highlight modes
(global-hl-line-mode 0) ;; current line

;; parenthesis
(show-paren-mode 1)
(setq blink-matching-paren t)

;; show trailing ws
(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil
                    :background "gray95")

;; configurations
;; ----------------------------------------------
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
 ;'(ecb-options-version "2.40")
 ;'(markdown-command "pandoc -f markdown -t html -s --mathjax ")
 ;'(markdown-command-needs-filename t)
 '(org-agenda-files (quote ("~/kcao/gtd-org/rh.org")) t))

;; extra config
;;(setq load-path (append load-path '("~/emacs/my-lisp")))

(let ((default-directory  "~/emacs/my-etc"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory  "~/emacs/my-lisp"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory  "~/emacs/site-lisp"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; utils
;; -----------------------------------------------

;; search:
(setq search-highlight t) ; Highlight search object
(setq isearch-highlight t)
(setq query-replace-highlight t) ; Highlight query object

;; diff: default to unified diffs
(setq diff-switches "-u")

;; spell:
;;(setq-default ispell-program-name "aspell")

;; diary
(setq diary-file "~/kcao/ediary.org")
(setq diary-mail-addr "ken.ccao@outlook.com")
;(add-hook 'diary-hook 'appt-make-list)

;; shell
(ansi-color-for-comint-mode-on)

;; abbrev
;;(setq default-abbrev-mode t)
(read-abbrev-file "~/emacs/abbrev_defs")
(setq save-abbrevs t)

(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))

;; add the follow line for my muttrc editor="emacs --execute \"(xxxxx)\""
(add-hook 'mail-mode-hook (lambda () (abbrev-mode 1)))
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;; auto fill mode
(setq-default fill-column 75)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'auto-fill-mode)

;; auto-complete
;; http://auto-complete.org/
(add-to-list 'load-path "~/git/emacs/ac")
(add-to-list 'load-path "~/git/emacs/fuzzy-el")
(add-to-list 'load-path "~/git/emacs/popup-el")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/git/emacs/ac/dict")

(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "C-c TAB") 'auto-complete)

;; ido-mode.
;; since icomplete-mode is somehow annoying
(require 'ido)
(ido-mode t)
;(icomplete-mode t)

;;;;;;;;;;
(require 'kcao-keys)
(require 'kcao-tmpl)

(require 'kcao-coding)

;(load-file "~/.emacs.utils.el")
;(load-file "~/.emacs.org.el")
;(load-file "~/.erc.kcao.el")

;; -----------------------------------------------
;(server-start)

;; -----------------------------------------------
;; the end
