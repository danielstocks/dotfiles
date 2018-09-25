export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias gs='git status'
alias vimrc='vim ~/.vimrc'
source ~/.git-completion.bash
source ~/.git-prompt.sh

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PS1='\W$(__git_ps1 " (%s)") \$ '
