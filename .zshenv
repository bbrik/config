
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export PAGER=`which most`
export EDITOR=`which nano`
export VISUAL=`which nano`

export PGDATA="/usr/local/var/postgres"
export PGUSER="bbrik"
export PGDATABASE="template1"
export PGDATESTYLE="DMY"
export PGPORT="5433"

export PYTHONDONTWRITEBYTECODE=True
