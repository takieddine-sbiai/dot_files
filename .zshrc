# Export
source ~/.export

# Aliases
source ~/.aliases

plugins=(git docker aws tig)

# Tmux
if [[ "$(pgrep -U `whoami` tmux | wc -l)" -eq "0" ]]; then
    tmux new-session -d -s main
fi

if [ -z $TMUX ]; then
    tmux attach-session -t main
fi

source $ZSH/oh-my-zsh.sh
