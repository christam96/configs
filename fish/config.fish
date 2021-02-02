set -g -x fish_greeting ''

# Custom aliases
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias la='ls -A'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -ha'
alias open='xdg-open'
alias clear='clear && colorscript -r'
alias vi='vim'
alias zathura='zathura --fork'
alias cd..='cd ..'
alias pdw="pwd"
alias update='sudo apt update && sudo apt upgrade -y'

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

fish_vi_key_bindings

starship init fish | source
