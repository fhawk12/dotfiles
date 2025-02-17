if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
  # exec Hyprland
fi

# history
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Load and initialise completion system
autoload -Uz compinit
zstyle ":completion:*" menu select
compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx

export PATH=$PATH:/usr/local/bin

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
alias gdf="git diff"

alias ls='eza --group-directories-first --icons'
alias ll="ls -l"
alias la="ls -a"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

alias pro="export https_proxy=http://127.0.0.1:7899;export http_proxy=http://127.0.0.1:7899"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
