# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# ---------------------------------------

# BELOW THIS LINE COMES FROM OH-MY-ZSHRC file created by the installation

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dima/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# THIS IS THE END OF OH-MY-ZSHRC file created by the installation
# -------------------------------------------



if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load colors so we can access $fg and more.
autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# Enable comments when working in an interactive shell.
setopt interactive_comments

# Prompt. Using single quotes around the PROMPT is very important, otherwise
# the git branch will always be empty. Using single quotes delays the
# evaluation of the prompt. Also PROMPT is an alias to PS1.
# git_prompt() {
#    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
#    local branch_truncated="${branch:0:30}"
#   if (( ${#branch} > ${#branch_truncated} )); then
#        branch="${branch_truncated}..."
#    fi

 #   [ -n "${branch}" ] && echo " (${branch})"
# }
# setopt PROMPT_SUBST
# PROMPT='%B%{$fg[green]%}%n@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '

# History settings.
export HISTFILE="${XDG_CACHE_HOME}/zsh/.history"
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000        # History lines stored in mememory.
export SAVEHIST=50000        # History lines stored on disk.
setopt INC_APPEND_HISTORY    # Immediately append commands to history file.
setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space.
setopt HIST_REDUCE_BLANKS    # Remove unnecessary blank lines.

# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"

# Use modern completion system. Other than enabling globdots for showing
# hidden files, these ares values in the default generated zsh config.
autoload -U compinit
compinit
_comp_options+=(globdots)

zstyle ':completion:*' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

# dircolors is a GNU utility that's not on macOS by default. With this not
# being used on macOS it means zsh's complete menu won't have colors.
command -v dircolors > /dev/null 2>&1 && eval "$(dircolors -b)"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Use emacs keybindings even if your $EDITOR is set to Vim.
# bindkey -e

# Ensure home / end keys continue to work.
bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line
bindkey '\e[8~' end-of-line
bindkey '\e[3~' delete-char

# Enable FZF (this replaces needing ~/.fzf.zsh in your home directory).
if [[ ! "${PATH}" == *${XDG_DATA_HOME}/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/${XDG_DATA_HOME}/fzf/bin"
fi
[[ $- == *i* ]] && . "${XDG_DATA_HOME}/fzf/shell/completion.zsh" 2> /dev/null

# Need to double check the below. I do not have this directory
# . "${XDG_DATA_HOME}/fzf/shell/key-bindings.zsh"

# Enable asdf to manage various programming runtime versions.
[ -f "${XDG_DATA_HOME}/asdf/asdf.sh" ] && . "${XDG_DATA_HOME}/asdf/asdf.sh"

# WSL 2 specific settings.
# if grep -q "microsoft" /proc/version &>/dev/null; then
    # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
#     export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
# fi

# WSL 1 specific settings.
# if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
#     if [ "$(umask)" = "0000" ]; then
#         umask 0022
#     fi

    # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
#     export DISPLAY=:0
# fi

# Allows your gpg passphrase prompt to spawn (useful for signing commits).
# export GPG_TTY="$(tty)"

# Configure FZF.
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--color=dark"

# zsh-autosuggestions settings.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Load / source zsh plugins.
# Check: I do not have this directory
# . "${XDG_DATA_HOME}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
# . "${XDG_DATA_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


###############################################################
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

DONE="ALL OK"
URGENT="!"
OVERDUE="Overdue"
DUETODAY="Today"
DUETOMORROW="Tomorrow"

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
# declare -a projects=('ProjectX' 'ProjectY');

# http://stackoverflow.com/a/16553351
# get length of an array
# nrOfProjects=${#projects[@]}
# urgencyPrio=4

# echo "Setting up TaskWarrior and TimeWarrior with ${nrOfProjects} projects..."
echo "DONE = $DONE / URGENT = $URGENT / OVERDUE = $OVERDUE / DUETODAY = $DUETODAY  / DUETOMORROW = $DUETOMORROW"

# Loop will set up task next, task add, task log and timew start for all projects listed above
#for (( i = 0; i < $nrOfProjects; i++ ));
#do
#  echo "Project $i = ${projects[i]}"
#  alias tn$i="task next project:${projects[i]} +READY"
#  alias tnu$i="tn${i} urgency \> ${urgencyPrio}"
#  alias ta$i="task add project:${projects[i]}"
#  alias tl$i="task log project:${projects[i]}"
#  alias twst$i="timew start ${projects[i]}"
#done;

# General TaskWarrior commands
alias t='task'
alias tn='task next +READY'
alias tnu="task next urgency \> ${urgencyPrio}"
alias ta='task add'
alias tan='task annotate'
alias tl='task log'
alias tac='task active'
# alias tap='task add project:Personal'
# alias taw='task add project:Work'

# TaskWarrior reports
# Tip: use `task timesheet` for a full report
alias tt='task modified:today completed'
alias ty='task modified:yesterday completed'
alias tey='task end.after:yesterday completed'
# alias twork='task context work'
# alias tpers='task context personal'

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


