if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
    # exec Hyprland
    exec startx
end

zoxide init fish | source
starship init fish | source

# man
set -gx MANPAGER "nvim +Man!"

# go proxy
set -gx GOPROXY "https://goproxy.cn"
set -gx GO111MODULE on

set -gx EDITOR nvim

#pacman
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# apps
alias ra=yazi
alias lg=lazygit

# misc
alias n=neofetch
alias keymap="xmodmap ~/.Xmodmap"
alias pro="export https_proxy=http://127.0.0.1:7899;export http_proxy=http://127.0.0.1:7899;export all_proxy=socks5://127.0.0.1:7898"
alias pyenv="source env/bin/activate.fish"
alias pyquit="deactivate"
alias py=python
alias hx=helix
