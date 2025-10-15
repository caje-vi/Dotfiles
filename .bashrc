#!/bin/bash

PATH="$HOME/.local/bin${PATH:+:${PATH}}" # Add .local/bin to $PATH
HISTFILE="$XDG_DATA_HOME"/bash/history # Change bash history location
HISTCONTROL=ignoredups:erasedups  # No duplicate entries

shopt -s autocd #cd using only the dir name
set -o vi
export EDITOR='nvim'
export VISUAL='nvim'
export READER='zathura'
export TERMINAL='alacritty'
export BROWSER='firefox'
export pager='less'

export PS1=" \[\e[00;34m\]λ \W \[\e[0m\]"

##### CAPS #####
  setxkbmap -option caps:escape &>/dev/null

###### ALIAS ######

alias \
    untar="tar -zxvf" \
    cl="clear" \
    la="ls -a " \
    ls="ls --color=auto"\
    lt="ls --human-readable --size -1 -S --classify" \
    cp="cp -riv" \
    mv="mv -iv" \
    rm="rm -v" \
    mkdir="mkdir -pv" \
    g="git" \
    t="tmux"\
    sdn="shutdown -h now" \
    v="nvim" \
    nv="nvim" \
    nb="newsboat"\
    z="v $(date -u +%Y%m%d%H%M%S).md" \
    config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"\
    book="/usr/bin/git --git-dir=$HOME/.bookmarks/ --work-tree=$HOME"\
    chrome="google-chrome-stable"\
    browser="google-chrome-stable"\

\

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pokemon-colorscripts -r
