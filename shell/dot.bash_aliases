
# mind the whitespace
alias sudo='sudo '

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
alias emacsd='emacs --daemon'
alias nemacsd='emacs --color=never --daemon'
alias nemacs='emacs --color=never'
alias emacs-exit='emacsclient -e "(kill-emacs)"'

# ls
alias ls='ls -CF'
alias la='ls --color=auto --group-directories-first'

# transmission cli
alias xbtinit="sudo systemctl start transmission-daemon"
alias xbtexit="sudo systemctl stop transmission-daemon"
alias xbtlist="transmission-remote -l"
alias xbtadd="transmission-remote -a"

# you-get
alias youget.xx='python3 ~/tools/you-get/you-get'

# media-omb
alias dlna-enp1s0='mediatomb -e enp1s0'
