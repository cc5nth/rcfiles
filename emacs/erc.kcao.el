;; -----------------------------------------------
;; erc
(require 'erc)
(require 'erc-log)
(require 'erc-join)
(require 'erc-track)
(require 'erc-stamp)
(require 'erc-match)

(setq erc-user-full-name "Chen Cao"
      erc-nick "kcao"
      erc-email-userid "kcao")
(setq erc-server "irc.devel.redhat.com"
      erc-port 6667
      erc-prompt-for-password nil)

;;(erc-timestamp-mode 1)
(erc-match-mode 1)
(erc-log-mode 1)

(setq erc-pals '("kcao")
      erc-keywords '("kcao")
      erc-current-nick-highlight-type 'nick
;;      erc-hide-timestamps nil
;;      erc-timestamp-only-if-changed-flag nil
;;      erc-timestamp-format "%H:%M "
;;      erc-insert-timestamp-function 'erc-insert-timestamp-left
;;      erc-join-buffer (quote frame)
      erc-enable-logging t
      erc-log-insert-log-on-open nil
      erc-log-channels t
      erc-log-channels-directory "~/redhat/irclogs"
      erc-save-buffer-on-part t
      erc-save-queries-on-quit t
      erc-kill-buffer-on-part t
      )
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(erc-autojoin-mode 0)
(add-hook 'erc-after-connect '(lambda (SERVER NICK)
           (erc-message "PRIVMSG" "MrQ ++")))
(setq erc-autojoin-channels-alist
  (quote (("irc.devel.redhat.com"
           "#apac" "#beijing" "#bug-review" "#devel"
           "#eng-china" "#helpdesk" "#kvm" "#kvm-qe"
           "#rhel6" "#section" "#sysadmin" "#virt"
           "#apac-qa"))))
