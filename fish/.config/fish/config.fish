if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
    # exec Hyprland
    exec startx # dwm
    # exec river
    # exec niri
end

zoxide init fish | source
starship init fish | source

set -gx PATH $PATH /home/fhawk/.local/bin

# flutter
set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
set -gx CHROME_EXECUTABLE "google-chrome-stable"
fish_add_path -g -p /home/fhawk/.local/flutter/bin

# man
set -gx MANPAGER "nvim +Man!"

# GO Proxy
set -gx GOPROXY "https://goproxy.cn"
set -gx GO111MODULE on
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH /home/fhawk/go/bin

set -gx TERM st-256color
set -gx EDITOR nvim

# Pacman
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

alias lg='lazygit'
alias g='git'
alias gst='git status'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pro="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890"

alias zel='zellij'
alias set-colemak='setxkbmap us -variant colemak -option ctrl:nocaps'
