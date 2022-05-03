# environmental variables
# -------------------

## language settings
## ------------------

export LANG=ja_JP.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


## history size
## ------------------

export HISTSIZE=10000


## editor and pager
## ------------------

export EDITOR=$(which nvim)


## XDG Base Directory Specification
## ------------------

export XDG_CONFIG_HOME=$HOME/.config


## fzf
## ------------------

export FZF_DEFAULT_OPTS="--reverse -m --ansi --cycle --select-1 --exit-0 --bind=ctrl-a:down,ctrl-s:up"

## PATHS
## ------------------

export H=$HOME

### PATH
### -----------------

export PATH=$PYTHONPACKAGES:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH
export PATH=/usr/local/opt/openssl/bin/:$PATH
export PATH=$HOME/.tmux/bin:$PATH


### OTHER PATH
### -----------------

export GOPATH=$HOME/dev
