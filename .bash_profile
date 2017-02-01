# .bash_profile

# Export
if [ -f ~/.export ]; then
    source ~/.export
fi

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# bash git prompt
if [ ! -d ~/.bash-git-prompt/ ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi
source ~/.bash-git-prompt/gitprompt.sh

# bash completion
# install brew auto_completion first
source $(brew --prefix)/etc/bash_completion

if [ -d ~/.bash-completion.d/ ]; then
    for file in `ls ~/.bash-completion.d`; do
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

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# delete .DS_Store files
find ${HOME} -name .DS_Store -delete

# Tmux
if [ "$(pgrep -U `whoami` tmux | wc -l)" -eq "0" ]; then
    tmux new-session -d -s main
fi

if [ -z $TMUX ]; then
    tmux attach-session -t main
fi
