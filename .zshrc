# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# >>> antigen initialize >>>

source /opt/homebrew/share/antigen/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Auto-suggestions bundle
antigen bundle zsh-users/zsh-autosuggestions

# Load antigen theme
# Favourites:
#   Single-line: af-magic, apple, peepcode, robbyrussell, simple
#   Multi-line: 3den, fino-time, fox, frisk, smt, strug, xiong-chiamiov-plus 
antigen theme xiong-chiamiov-plus

# Tell antigen you're done
antigen apply

# <<< conda initialize <<<


export PATH="$PATH:/Users/chris/.local/bin"


bindkey -v
alias clr="clear"
alias btq="cd Documents/BTQ/"
alias research="cd Documents/Research/Blockchain\ GNN\ Research"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chris/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chris/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/chris/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chris/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f "/Users/chris/.ghcup/env" ] && source "/Users/chris/.ghcup/env" # ghcup-env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
