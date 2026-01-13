#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function trunc_pwd()
{
    local wd_max_len=25
    local trunc_sym=".."
    local wd=${PWD##*/}
    wd_max_len=$(((wd_max_len < ${#wd}) ? ${#wd} : wd_max_len ))
    TRUNC_WD=${PWD/#$HOME/\~}
    local wd_offset=$((${#TRUNC_WD} - wd_max_len))

    if [ ${wd_offset} -gt "0" ]; then
        TRUNC_WD=${TRUNC_WD:$wd_offset:$wd_max_len}
        TRUNC_WD=${trunc_sym}/${TRUNC_WD#*/}
    fi
}

function bash_prompt() {
    function hex_to_rgb()
    {
      local hex=${1#\#}
      printf "%d;%d;%d" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2}
    }
    function rgb_to_background()
    {
        printf "\e[48;2;${1}m%s\e[0m" "$2" 
    }
    function rgb_to_foreground() 
    {
        printf "\e[38;2;${1}m%s\e[0m" "$2" 
    }

    TRIANGLE=$'\uE0B0'
    PS1_RGB_USER=$(hex_to_rgb '#D56DE5')
    PS1_RGB_HOST=$(hex_to_rgb '#7B83EA')
    PS1_RGB_WDBG=$(hex_to_rgb '#c7c6d0') 
    PS1_RGB_WDFG=$(hex_to_rgb '#221d44')
    # PS1="\u@\h:\w \$(date +%d-%m-%y\ %T) \\$ "
    PS1="$(rgb_to_background "$PS1_RGB_USER" '\u')$(rgb_to_background "$PS1_RGB_HOST" $(rgb_to_foreground "$PS1_RGB_USER" "$TRIANGLE"))$(rgb_to_background "$PS1_RGB_HOST" '\h')$(rgb_to_background "$PS1_RGB_WDBG" $(rgb_to_foreground "$PS1_RGB_HOST" "$TRIANGLE"))$(rgb_to_background "$PS1_RGB_WDBG" $(rgb_to_foreground "$PS1_RGB_WDFG" "$TRUNC_WD"))$(rgb_to_foreground "$PS1_RGB_WDBG" "$TRIANGLE") "
}

PROMPT_COMMAND=trunc_pwd
bash_prompt
unset bash_prompt

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

eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never --glob="!.git"'
export FZF_DEFAULT_OPTS='--height 50% --layout reverse'

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
