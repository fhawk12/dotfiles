if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
    # exec Hyprland
    exec startx
end

# haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/fhawk/.ghcup/bin $PATH # ghcup-env

# rustup shell setup
if not contains "$HOME/.cargo/bin" $PATH
    # Prepending path in case a system-installed rustc needs to be overridden
    set -x PATH "$HOME/.cargo/bin" $PATH
end

zoxide init fish | source
starship init fish | source

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

alias la='ll -a'
alias ls='eza --group-directories-first --icons'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pro="export https_proxy=http://127.0.0.1:7899;export http_proxy=http://127.0.0.1:7899"

#function nvim
#  if test (count $argv) -eq 0
#    set selected_file (fzf --prompt="Select a file: " --preview="bat --style=numbers --color=always --line-range :500 {}")
#    if test -n "$selected_file"
#      command nvim "$selected_file"
#    end
#  else
#    command nvim $argv
#  end
#end
