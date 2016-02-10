
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH="/usr/local/man:$MANPATH"


export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(brew brew-cask django git git-flow-avh osx postgres pip python sublime rsync cp npm fabric virtualenv virtualenvwrapper zsh-syntax-highlighting bower meteor)

source $ZSH/oh-my-zsh.sh


export PAGER=`which most`
export EDITOR=`which nano`
export VISUAL=`which nano`

export PGDATA="/usr/local/var/postgres"
export PGUSER="bbrik"
export PGDATABASE="template1"
export PGDATESTYLE="DMY"
export PGPORT="5433"

export PYTHONDONTWRITEBYTECODE=True


alias dir='ls -lahF --group-directories-first'
alias da='noglob django-admin.py'
alias pa='projadmin'
alias pain='projadmin ingest'
alias pg_start='postgres -D /usr/local/var/postgres'
alias config='`which git` --git-dir=$HOME/.myconf/ --work-tree=$HOME'

export LANG=en_US.UTF-8
