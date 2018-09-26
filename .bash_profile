export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias gs='git status'
alias vimrc='vim ~/.vimrc'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Git
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT_COMMAND='\W$(__git_ps1 " (%s)") \$ '

export PROMPT_COMMAND='__git_ps1 "\W" " "'
