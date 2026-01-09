#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --color=fg:#f0f3f6,bg:#0a0c10,hl:#0a0c10 --color=fg+:#f0f3f6,bg+:#0f1b28,hl+:#ffb757 --color=info:#f0b72f,prompt:#71b7ff,pointer:#b780ff --color=marker:#26cd4d,spinner:#ffffff,header:#454a51'

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
