#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# to enable __git_ps1
. ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1

# https://github.com/andresgongora/bash-tools/blob/62db15580482853cb3cfb177420e069d1574cf3f/bash-tools/shorten_path.sh
function shorten_path()
{
	local path="$PWD"
	local max_length=25
	local trunc_symbol=${3:-"…"}

	if   [ -z "$path" ]; then
		echo ""
		exit
	fi

	local path=${path/#$HOME/\~}

	local dir=${path##*/}
	local dir_length=${#dir}
	local path_length=${#path}
	local print_length=$(( ( max_length < dir_length ) ? dir_length : max_length ))

	if [ $path_length -gt $print_length ]; then
		local offset=$(( $path_length - $print_length ))
		local truncated_path=${path:$offset}
		local clean_path="/${truncated_path#*/}"
        local removed_path=${path%%"$clean_path"}

        if [ "$removed_path" == "~" ]; then
            local short_path="~${clean_path}"
        else
		    local short_path=${trunc_symbol}${clean_path}
        fi
	else
		local short_path=$path
	fi

	echo $short_path
}
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
function git_status_color()
{
    if git rev-parse --is-inside-work-tree>/dev/null 2>&1; then
        if ! git diff --quiet 2>/dev/null; then
            echo "$RGB_USER"
        else
            echo "$RGB_HOST"
        fi
    else
        echo ""
    fi
}

TRIANGLE=$'\uE0B0'
RGB_USER=$(hex_to_rgb "#eb6f92")
RGB_HOST=$(hex_to_rgb "#31748f")
RGB_WDBG=$(hex_to_rgb "#e0def4")
RGB_WDFG=$(hex_to_rgb "#191724")

function git_prompt()
{
    # \001 = \[, \002 = \]
    local ps1=""
    local git_info="$(__git_ps1 '(%s)')"
    if git rev-parse --is-inside-work-tree>/dev/null 2>&1; then
        local status_color=$(git_status_color)
        ps1+="\001$(reset)$(rgb_to_fg "$RGB_WDBG")$(rgb_to_bg "$status_color")\002$TRIANGLE"
        ps1+="\001$(reset)$(rgb_to_bg "$status_color")\002$git_info"
        ps1+="\001$(reset)$(rgb_to_fg "$status_color")\002$TRIANGLE"
    else
        ps1+="\001$(reset)$(rgb_to_fg "$RGB_WDBG")\002$TRIANGLE"
    fi
    # printf to emit control characters
    printf "$ps1"
}

# PS1="\u@\h:\w \$(date +%d-%m-%y\ %T) \\$ "
# each color printed section should be guarded with \[ \]
PS1="\[$(rgb_to_bg "$RGB_USER")\]\u " # user
PS1+="\[$(rgb_to_fg "$RGB_USER")$(rgb_to_bg "$RGB_HOST")\]$TRIANGLE"
PS1+="\[$(reset)$(rgb_to_bg "$RGB_HOST")\]\h " # host
PS1+="\[$(rgb_to_fg "$RGB_HOST")$(rgb_to_bg "$RGB_WDBG")\]$TRIANGLE"
# \$(shorten_path) so that it gets dynamically updated
PS1+="\[$(rgb_to_fg "$RGB_WDFG")\]\$(shorten_path) " # working directory
PS1+="\$(git_prompt)"
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

FZF_FG="#e0def4"
FZF_FGP="#e0def4"
FZF_BG="#191724"
FZF_BGP="#31748f"
FZF_HL="#eb6f92"
FZF_BORDER="#31748f"
FZF_HEADER="#31748f"
FZF_GUTTER="#191724"
FZF_SPINNER="#eb6f92"
FZF_INFO="#e0def4"
FZF_POINTER="#eb6f92"
FZF_MARKER="#eb6f92"
FZF_PROMPT="#e0def4"

eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never --glob="!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout reverse"
export FZF_DEFAULT_OPTS+=" --color=fg:"$FZF_FG",bg:"$FZF_BG",hl:"$FZF_HL""
export FZF_DEFAULT_OPTS+=" --color=fg+:"$FZF_FGP",bg+:"$FZF_BGP",hl+:"$FZF_HL""
export FZF_DEFAULT_OPTS+=" --color=border:"$FZF_BORDER",header:"$FZF_HEADER",gutter:"$FZF_GUTTER""
export FZF_DEFAULT_OPTS+=" --color=spinner:"$FZF_SPINNER",info:"$FZF_INFO""
export FZF_DEFAULT_OPTS+=" --color=pointer:"$FZF_POINTER",marker:"$FZF_MARKER",prompt:"$FZF_PROMPT""

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
# cuda
export PATH="/opt/cuda/bin:$PATH"

fastfetch
