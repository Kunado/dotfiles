# -------------------
# aliases
# -------------------

## ----------
## general
## ----------

alias ls="ls -G"
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias tree="tree -NC"
alias date="gdate"
alias env_template='cat .env | sed s/=.*/=/g > .env.template'
alias soniq='sort | uniq'
alias killp='kill $(ps | tail -n +2 | peco | awk '\''{print $1}'\'')'

## ----------
## git
## ----------

alias delb="git branch | peco | xargs git branch -D"
alias chb="git branch | peco | xargs git checkout"
alias commithash='git log --oneline | peco | awk '\''{print $1}'\'''
alias github='hub browse $(git remote -v | head -1 | awk '\''{print $2}'\'' | cut -d "/" -f 4,5)'


## ----------
## docker
## ----------

alias dc="docker-compose"
alias imagetag='docker image ls | awk '\''{printf "%s:%s\n", $1, $2}'\'' | peco'
alias killall='docker ps | awk "{print $1}" | sed "1d" | xargs docker kill'


## ----------
## ghq
## ----------

alias openrepo='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias browse='chrome $(git remote -v | awk '\''{print $2}'\'' | sed -n 1p | sed s#.*github.com.#https://github.com/#g | sed s\/\.git$//g)'
alias repopath='{ghq root; ghq list | peco} | sed -e "N;s#\n#/#g"'
alias ghqroot='cd $(ghq root)'


## ----------
## vim
## ----------

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

## ----------
## other
## ----------

alias latexmk="latexmk -pvc"
alias ghci="stack ghci"
alias hl="highlight"
alias echopaths="echo $PATH | tr ':' '\n'"

## ----------
## alias for GUI apps
## ----------

alias chrome="open -g -a /Applications/Google\ Chrome.app"
alias skim="open -a skim"
