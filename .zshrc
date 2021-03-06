export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(brew django git postgres pip python rsync cp fabric virtualenv virtualenvwrapper zsh-syntax-highlighting meteor gnu-utils)

source $ZSH/oh-my-zsh.sh

alias ls='ls --color -N --group-directories-first'
alias dir='ls -lAhF'
alias lr='ls -hArtl'
alias da='noglob django-admin.py'
alias pa='projadmin'
alias pain='projadmin ingest'
alias pg_start='postgres -D /usr/local/var/postgres'
alias config='`which git` --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias m='meteor'
alias rsy='rsync -ah --no-i-r --info=progress2'

export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(dircolors ~/.dircolors)";

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
