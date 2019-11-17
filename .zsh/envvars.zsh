# environmental variables
# -------------------

## language settings
## ------------------

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


## editor and pager
## ------------------

export EDITOR=vim
export PAGER=vimpager
export MANPAGER=vimpager


## XDG Base Directory Specification
## ------------------

export XDG_CONFIG_HOME=$HOME/.config


## PATHS
## ------------------

### PATH
### -----------------

export PATH=$PYTHONPACKAGES:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH
export PATH=/usr/local/opt/openssl/bin/:$PATH
export PATH=$HOME/.anyenv/bin:$PATH


### OTHER PATH
### -----------------

export GOPATH=$HOME/dev
