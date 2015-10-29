#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# emacs
alias vv='emacsclient -t'
alias em='emacsclient -t'
alias emc='emacsclient -c'
alias emacsserver='emacs --color=never --daemon'
alias nemacs='emacs --color=never'

# ls
alias ls='ls -CF'
alias la='ls --color=auto --group-directories-first'

# transmission cli
alias btrans-init="sudo systemctl start transmission"
alias btrans-exit="sudo systemctl stop transmission"
alias btrans-list="transmission-remote -l"
alias btrans-add="transmission-remote -a"
