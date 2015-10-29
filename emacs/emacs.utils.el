;; -----------------------------------------------
;; git
;(require 'git)
;(require 'git-blame)

;; -----------------------------------------------
;; stgit
;(require 'stgit)
;(setq stgit-default-show-unknown t)

;; -----------------------------------------------
;; ibus
;(require 'ibus)
;(setq ibus-python-shell-command-name "python2")
;(add-hook 'after-init-hook 'ibus-mode-on)
;; Use C-SPC for Set Mark command
;(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
;(ibus-define-common-key ?\C-/ nil)
;; Change cursor color depending on IBus status
;(setq ibus-cursor-color '("red" "blue" "limegreen"))


;; ----------------------------------------------
;; jabber
;(setq jabber-account-list
;      '(("ken.ccao@gmail.com"
;         (:network-server . "talk.google.com")
;         (:connection-type . ssl))))
