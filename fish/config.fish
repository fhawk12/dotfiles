if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EDITOR=nvim
set -gx PATH /home/fhawk/.local/bin $PATH

alias gc="git clone "
alias gst="git status"

alias lg=lazygit
alias ra=ranger
alias fh=neofetch
alias keymap="cd ~; xmodmap .Xmodmap"
alias colemak="setxkbmap us -variant colemak"
alias us="setxkbmap us"

alias pro="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
    exec startx
end

