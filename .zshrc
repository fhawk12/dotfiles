# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fhawk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#                           _
# _ __ ___  _   _   _______| |__
#| '_ ` _ \| | | | |_  / __| '_ \
#| | | | | | |_| |  / /\__ \ | | |
#|_| |_| |_|\__, | /___|___/_| |_|
#           |___/
#
#


typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
eval "bash ~/scripts/suckless"

eval "$(zoxide init zsh)"

export EDITOR=nvim


# keyboard layout
alias colemak="setxkbmap us -variant colemak"
alias us="setxkbmap us"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# git command
alias clone="git clone"
alias commit="git commit -m"
alias addup="git add -u"
alias addall="git add ."
alias switch="git switch"
alias branch="git branch"
alias pull='git pull origin'
alias push='git push origin'
alias gst="git status" # 'status' is protected name so using 'gst' instead

# app
alias ra="ranger"
alias jo="joshuto"

#pacman
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# misc
alias keymap="cd ~; xmodmap .Xmodmap"
alias pro="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890"
alias fh="neofetch"
alias lg="lazygit"



