# Install Zap plugin manager
# https://www.zapzsh.com/
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
#
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
    # exec Hyprland
fi

# Plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

plug "wintermi/zsh-rust"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/fhawk/go/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# alias
alias g="git"
alias gst="git status"

alias pro="export https_proxy=http://127.0.0.1:7899;export http_proxy=http://127.0.0.1:7899"