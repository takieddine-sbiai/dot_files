# .bash_profile

# Export
if [ -f ~/.export ]; then
    source ~/.export
fi

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Git 
if [ -f ~/.git-prompt ]; then
    source ~/.git-prompt
fi
PS1="\[\033[32m\]\@ \[\033[33m\]\w\$(__git_ps1 \" (\[\033[36m\]%s\[\033[33m\])\") \n\$\[\033[0m\] "

# bash completion
if [ -d ~/.bash-completion.d/ ]; then
    for file in `ls .bash-completion.d`; do
	source ~/.bash-completion.d/${file}
    done
fi

# GPG
if [ "$(pgrep -U `whoami` gpg-agent | wc -l)" -gt "1" ]; then
    pkill -U `whoami` gpg-agent
elif [ "$(pgrep -U `whoami` gpg-agent | wc -l)" -eq "0" ]; then
    gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info"
fi
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
fi

# Tmux
if [ "$(pgrep -U `whoami` tmux | wc -l)" -eq "0" ]; then
    tmux new-session -d -s main
fi

if [ -z $TMUX ]; then
    tmux attach-session -t main
fi
