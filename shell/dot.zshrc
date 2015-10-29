# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# key binding
bindkey -e

# compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

# prompt
PROMPT='|= %c %# '
#autoload -Uz promptinit
#promptinit
#prompt fade

# path
# set in ~/.zshenv
path=(~/bin $path)
typeset -U path

# pushd
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# update terminal title when wd changed
case $TERM in
    xterm*|gnome*)
        chpwd_title() {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    screen)
        chpwd_title() {
            print -Pn "\e_%n@%m: %c\e\\" # screen location
        }
        ;;
esac

# func chain when wd changed
chpwd_functions+=(chpwd_title)


# misc
setopt nohup
setopt INTERACTIVE_COMMENTS
limit coredumpsize 0
ttyctl -f
