#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# https://github.com/andresgongora/bash-tools/blob/62db15580482853cb3cfb177420e069d1574cf3f/bash-tools/shorten_path.sh
function hex_to_rgb()
{
  local hex=${1#\#}
  printf "%d;%d;%d" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2}
}
function rgb_to_bg()
{
    printf "\e[48;2;%sm" "$1" 
}
function rgb_to_fg() 
{
    printf "\e[38;2;%sm" "$1" 
}
function reset()
{
    printf "\e[0m"
}

TRIANGLE=$'\uE0B0'
RGB_USER=$(hex_to_rgb "#eb6f92")
RGB_HOST=$(hex_to_rgb "#31748f")
RGB_WDBG=$(hex_to_rgb "#e0def4") 
RGB_WDFG=$(hex_to_rgb "#191724")

# PS1="\u@\h:\w \$(date +%d-%m-%y\ %T) \\$ "
# each color printed section should be guarded with \[ \]
PS1="\[$(rgb_to_bg "$RGB_USER")\]\u " # user
PS1+="\[$(rgb_to_fg "$RGB_USER")$(rgb_to_bg "$RGB_HOST")\]$TRIANGLE"
PS1+="\[$(reset)$(rgb_to_bg "$RGB_HOST")\]\h "
PS1+="\[$(rgb_to_fg "$RGB_HOST")$(rgb_to_bg "$RGB_WDBG")\]$TRIANGLE"
PS1+="\[$(rgb_to_fg "$RGB_WDFG")\]\w " # working directory TODO: shorten path
PS1+="\[$(reset)$(rgb_to_fg "$RGB_WDBG")\]$TRIANGLE"
PS1+="\[$(reset)\] "


# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

export HISTCONTROL=erasedups:ignoredups:ignorespace

export CLICOLOR=1

alias grep="rg"

alias vim="nvim"
export EDITOR="nvim"

# interactive copy and move
alias cp="cp -i"
alias mv="mv -i"

FZF_FG="#9ccfd8"
FZF_FGP="#e0def4"
FZF_BG="#191724"
FZF_BGP="#26233a"
FZF_HL="#ebbcba"
FZF_BORDER=""
FZF_HEADER=""
FZF_GUTTER=""
FZF_PROMPT=""

# TODO: finish the rest of the fzf colors?
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never --glob="!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout reverse"
export FZF_DEFAULT_OPTS+="--color=fg:"$FZF_FG",bg:"$FZF_BG",hl:"$FZF_HL""
export FZF_DEFAULT_OPTS+="--color=fg+:"$FZF_FGP",bg+:"$FZF_BGP",hl+:"$FZF_FL""

function yay()
{
  if [ $# -eq 0 ]; then
    # update system
    paru -Syu
  else
    # install aur package
    paru -S -- "$@"
  fi
}

function yeet()
{
  if [ $# -eq 0 ]; then
    # clean cache
    paru -Scc
  else
    # remove aur package
    paru -Rns -- "$@"
  fi
}

# uv
export PATH="/home/jappe/.local/bin:$PATH"

fastfetch
