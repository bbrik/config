export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(brew brew-cask django git git-flow-avh osx postgres pip python sublime rsync cp npm fabric virtualenv virtualenvwrapper zsh-syntax-highlighting bower meteor gnu-utils)

source $ZSH/oh-my-zsh.sh

alias ls='ls --color'
alias dir='ls -lahF --group-directories-first'
alias lr='ls -hartl'
alias da='noglob django-admin.py'
alias pa='projadmin'
alias pain='projadmin ingest'
alias pg_start='postgres -D /usr/local/var/postgres'
alias config='`which git` --git-dir=$HOME/.myconf/ --work-tree=$HOME'

export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
