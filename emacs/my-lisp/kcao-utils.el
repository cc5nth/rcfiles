(defun kcao-lookup-word (engine-type)
  "on www.answers.com, google dict or other engine"
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "%20" myword))

    (setq engine-str-answer "http://www.answers.com/main/ntquery?s=")
    (setq engine-str-gdict
          "http://www.google.com/dictionary?aq=f&langpair=en|en&hl=en&q=")

;;    (if (string= engine-type "answer")
;;        (setq search-engine-str engine-str-answer)
;;      (setq search-engine-str engine-str-gdict))
    (cond ((string= engine-type "answer")
           (setq search-engine-str engine-str-answer))
          ((string= engine-type "gdict")
           (setq search-engine-str engine-str-gdict))
          (t (setq search-engine-str engine-str-answer)))


    (setq myurl (concat search-engine-str myword))

    ;;(browse-url myurl)
    (w3m-browse-url myurl) ;; using emacs-w3m
    ))


(defun kcao-lookup-answer ()
  (interactive)
  (kcao-lookup-word "answer"))

(defun kcao-lookup-gdict ()
  (interactive)
  (kcao-lookup-word "gdict"))


(global-set-key (kbd "<f6>") 'kcao-lookup-answer)
;;(global-set-key (kbd "<f7>") 'kcao-lookup-gdict)


(provide 'kcao-utils)
