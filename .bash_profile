export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias gs='git status'
alias vimrc='vim ~/.vimrc'
source ~/.git-completion.bash
source ~/.git-prompt.sh

PS1='\W \e[0;31m$(__git_ps1 "(%s)")\e[m 💰 '
