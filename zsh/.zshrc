# Install Zap plugin manager
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
#
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

plug "Aloxaf/fzf-tab"
plug "wintermi/zsh-rust"

# Load and initialise completion system
autoload -Uz compinit
compinit

zstyle ':fzf-tab:complete:*:options' fzf-preview 
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

eval "$(zoxide init zsh)"

export EDITOR=nvim
export MANPAGER="nvim +Man!"

# alias
alias g=git
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gps="git push"

alias pro="export https_proxy=http://127.0.0.1:7899;export http_proxy=http://127.0.0.1:7899"
