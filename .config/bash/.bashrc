# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/dotfiles/.config/bash/.bash_aliases ]; then
    . ~/dotfiles/.config/bash/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set -o vi

export EDITOR=vim
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/dotfiles/scriptd"

# Support for Language Input via iBus
# export GTK_IM_MODULE="ibus"
# export QT_IM_MODULE="ibus"
# export XMODIFIERS="@im=ibus"
# export PATH=/home/dima/.cargo/bin:$PATH


# The below section is taken from 
# https://gist.github.com/johanbove
# as he has a lot of good dot files for TaskWarrier. 

# This comes to add indicator to the bash prompt with TaskWarrier
# https://gist.github.com/johanbove/328506117db2edff7f5c99d05afde0ec
# See https://gist.github.com/pjf/051aa4ef326d493beec950823f7edfd8#file-bashrc
# Make our prompt awesome. :)
# source ~/.bash_colours
# source ~/.git-prompt.sh

TICK="✓"
CROSS="✗"

DONE="🖖"
URGENT="🔥"
OVERDUE="👎"
DUETODAY="🔔"
DUETOMORROW="⏰"

# TaskWarrior integration
# Inspired by Paul Fenwick (https://gist.github.com/pjf)
function task_indicator {
  if [ `task +READY +OVERDUE count` -gt "0" ]; then
     echo "$OVERDUE"
  elif [ `task +READY +TODAY count` -gt "0" ]; then
     echo "$DUETODAY"
  elif [ `task +READY +TOMORROW count` -gt "0" ]; then
     echo "$DUETOMORROW"
  elif [ `task +READY urgency \> 10 count` -gt "0" ]; then
     echo "$URGENT"
  else
     echo "$DONE"
  fi
 }

# Git Integration
function git_branch_status () {
BRANCH=`git rev-parse --abbrev-ref HEAD 2> /dev/null`;
  if [ -n "$BRANCH" ]; then
     DIRTY=`git status --porcelain --untracked-files=no 2> /dev/null`;
       if [ -n "$DIRTY" ]; then
          echo "$BRed $CROSS";
       else
          echo "$BGreen $TICK";
       fi;
  fi;
 }

# Updates the Prompt correctly
function update_PS1 () {

#PS1='$()'"\W$BYellow$(__git_ps1) $(task_indicator) $Color_Off \$ "
PS1="$(git_branch_status) \W$BYellow$(__git_ps1) $(task_indicator) $Color_Off \$ "
}

shopt -u promptvars
PROMPT_COMMAND=update_PS1

## TaskWarrior
## <https://taskwarrior.org/docs/>

# Declares an array of projects in bash
# The position in the array counts for the id and starts counting at 1
declare -a projects=('ProjectX' 'ProjectY');

# http://stackoverflow.com/a/16553351
# get length of an array
nrOfProjects=${#projects[@]}
urgencyPrio=4

echo "Setting up TaskWarrior and TimeWarrior with ${nrOfProjects} projects..."
echo "DONE = $DONE / URGENT = $URGENT / OVERDUE = $OVERDUE / DUETODAY = $DUETODAY  / DUETOMORROW = $DUETOMORROW"

# Loop will set up task next, task add, task log and timew start for all projects listed above
for (( i = 0; i < $nrOfProjects; i++ ));
do
  echo "Project $i = ${projects[i]}"
  alias tn$i="task next project:${projects[i]} +READY"
  alias tnu$i="tn${i} urgency \> ${urgencyPrio}"
  alias ta$i="task add project:${projects[i]}"
  alias tl$i="task log project:${projects[i]}"
  alias twst$i="timew start ${projects[i]}"
done;

# General TaskWarrior commands
alias t='task'
alias tn='task next +READY'
alias tnu="task next urgency \> ${urgencyPrio}"
alias ta='task add'
alias tan='task annotate'
alias tl='task log'
alias tac='task active'
alias tap='task add project:Personal'
alias taw='task add project:Work'

# TaskWarrior reports
# Tip: use `task timesheet` for a full report
alias tt='task modified:today completed'
alias ty='task modified:yesterday completed'
alias tey='task end.after:yesterday completed'
alias twork='task context work'
alias tpers='task context personal'

# Show task I completed in the last week
alias tclw='task end.after:today-1wk completed'

## TimeWarrior
# alias twst='timew start'
# alias twstop='timew stop'
# alias tws='timew summary :week'
# alias twlw='timew summary :lastweek'
# alias twd='timew summary :day'

## Backups
#alias backupTasks='tar -czf ~/Documents/99_Zips/task.tar.gz ~/.task ~/.timewarrior'
#alias backupTasks='sh -c ~/MyScripts/backupTasks.sh'
#alias backupDotFiles='sh -c ~/MyScripts/backupDotFiles.sh'

# GIT
alias gc='git checkout'
alias gf='git fetch'
alias gs='git status'
alias gl='git log --oneline'
alias gp='git pull'

alias gbl='git for-each-ref --sort=committerdate refs/heads/ --format="%(color: red)%(committerdate:short) %(color:cyan)%(refname:short)"'

# This section is to set bash colors. It is originally in a different file .bash_colors but I put it together here for now. 

# Inspired by Paul Fenwick (https://gist.github.com/pjf)
# See https://gist.github.com/pjf/051aa4ef326d493beec950823f7edfd8#file-bashrc
# Reset
Color_Off='\[\e[0m\]'      # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'       # Black
Red='\[\e[0;31m\]'         # Red
Green='\[\e[0;32m\]'       # Green
Yellow='\[\e[0;33m\]'      # Yellow
Blue='\[\e[0;34m\]'        # Blue
Purple='\[\e[0;35m\]'      # Purple
Cyan='\[\e[0;36m\]'        # Cyan
White='\[\e[0;37m\]'       # White

# Bold
BBlack='\[\e[1;30m\]'      # Black
BRed='\[\e[1;31m\]'        # Red
BGreen='\[\e[1;32m\]'      # Green
BYellow='\[\e[1;33m\]'     # Yellow
BBlue='\[\e[1;34m\]'       # Blue
BPurple='\[\e[1;35m\]'     # Purple
BCyan='\[\e[1;36m\]'       # Cyan
BWhite='\[\e[1;37m\]'      # White

# Underline
UBlack='\[\e[4;30m\]'      # Black
URed='\[\e[4;31m\]'        # Red
UGreen='\[\e[4;32m\]'      # Green
UYellow='\[\e[4;33m\]'     # Yellow
UBlue='\[\e[4;34m\]'       # Blue
UPurple='\[\e[4;35m\]'     # Purple
UCyan='\[\e[4;36m\]'       # Cyan
UWhite='\[\e[4;37m\]'      # White

# Background
On_Black='\[\e[40m\]'      # Black
On_Red='\[\e[41m\]'        # Red
On_Green='\[\e[42m\]'      # Green
On_Yellow='\[\e[43m\]'     # Yellow
On_Blue='\[\e[44m\]'       # Blue
On_Purple='\[\e[45m\]'     # Purple
On_Cyan='\[\e[46m\]'       # Cyan
On_White='\[\e[47m\]'      # White

# High Intensity
IBlack='\[\e[0;90m\]'      # Black
IRed='\[\e[0;91m\]'        # Red
IGreen='\[\e[0;92m\]'      # Green
IYellow='\[\e[0;93m\]'     # Yellow
IBlue='\[\e[0;94m\]'       # Blue
IPurple='\[\e[0;95m\]'     # Purple
ICyan='\[\e[0;96m\]'       # Cyan
IWhite='\[\e[0;97m\]'      # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'     # Black
BIRed='\[\e[1;91m\]'       # Red
BIGreen='\[\e[1;92m\]'     # Green
BIYellow='\[\e[1;93m\]'    # Yellow
BIBlue='\[\e[1;94m\]'      # Blue
BIPurple='\[\e[1;95m\]'    # Purple
BICyan='\[\e[1;96m\]'      # Cyan
BIWhite='\[\e[1;97m\]'     # White

# High Intensity backgrounds
On_IBlack='\[\e[0;100m\]'  # Black
On_IRed='\[\e[0;101m\]'    # Red
On_IGreen='\[\e[0;102m\]'  # Green
On_IYellow='\[\e[0;103m\]' # Yellow
On_IBlue='\[\e[0;104m\]'   # Blue
On_IPurple='\[\e[0;105m\]' # Purple
On_ICyan='\[\e[0;106m\]'   # Cyan
On_IWhite='\[\e[0;107m\]'  # White
