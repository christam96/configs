# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Custom aliases
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias la='ls -A'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -ha'
alias open='xdg-open'
alias nmutt='neomutt'
shopt -s autocd

# Custom colours
PS1="\[$(tput bold)\]"; # Make bold
PS1+="\[$(tput setaf 225)\]["; # Pink '['
PS1+="\[$(tput setaf 117)\]\t "; # Blue time
PS1+="\[$(tput setaf 225)\]\u@Fedora"; # Pink user@host
PS1+=" \[$(tput setaf 226)\]\w 🍉"; # Yellow present working directory
PS1+="\[$(tput setaf 225)\]]"; # Pink ']'
PS1+="\[$(tput sgr0)\]  "; # Return to default colour scheme
export PS1;
LS_COLORS=$LS_COLORS:'di=1;97:' ; export LS_COLORS

# Exports
export HISTCONTROL=ignoreboth # ignores duplicates in command history

# Uncomment to enable powerline-shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Enable Vim keybindings
set -o vi

# Run Vim X11 instead of Vim for clipboard functionality
alias vim='vimx'

# Custom key bindings
bind '"\C-f":"vim_with_fzf\n"'
bind '"\C-o":"cd_with_fzf\n"'
vim_with_fzf() {
    fd -t f -H -I | fzf -m | xargs -ro -d "\n" vimx 2>&-
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
