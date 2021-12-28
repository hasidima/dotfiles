vdiff () {
    if [ "${#}" -ne 2 ] ; then
        echo "vdiff requires two arguments"
        echo "  comparing dirs:  vdiff dir_a dir_b"
        echo "  comparing files: vdiff file_a file_b"
        return 1
    fi

    local left="${1}"
    local right="${2}"

    if [ -d "${left}" ] && [ -d "${right}" ]; then
        vim +"DirDiff ${left} ${right}"
    else
        vim -d "${left}" "${right}"
    fi
}

dtags () {
    local image="${1}"

    wget -q "https://registry.hub.docker.com/v1/repositories/${image}/tags" -O - \
        | tr -d '[]" ' | tr '}' '\n' | awk -F: '{print $3}'
}

pw () {
    pwgen -sync "${1:-48}" -1 | if command -v pbcopy > /dev/null 2>&1; then pbcopy; else xclip; fi
}

weather () {
    curl "https://wttr.in/${1}"
}


if command -v brew > /dev/null 2>&1; then
    alias ls="ls -G"
    alias grep="grep -G"
    alias fgrep="fgrep -G"
    alias egrep="egrep -G"
else
    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"


# Aliases to configure dot files
# alias cfv="${EDITOR} ${HOME}/.vimrc"
# alias cft="${EDITOR} ${HOME}/.tmux.conf"
# alias cfb="${EDITOR} ${HOME}/.bashrc"

# alias drun='docker run --rm -it -v "${PWD}":/app -w /app'



alias octal="stat -c '%a %n'"

alias follow="namei -om"

alias diff="diff --color -u"

# alias 755d="find . -type d -exec chmod 755 {} \;"

# alias 644f="find . -type f -exec chmod 644 {} \;"

# alias vss="sort -u ${HOME}/.vim/spell/en.utf-8.add -o ${HOME}/.vim/spell/en.utf-8.add"

# alias vdt="rm /tmp/%*"

alias gi="git init && git symbolic-ref HEAD refs/heads/main"

alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

alias gcl="git diff --name-only --diff-filter=U"


# A way to define and run tasks in a project. It's like make except it's pure
# Bash so there's no make limitations like not being able to forward arguments.
# alias run=./run


alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias zet="TZ=GM date +%Y%m%d%H%M%S | pbcopy && pbpaste"
alias zetd="TZ=GMT date +%Y%m%d | pbcopy && pbpaste"

alias qqdd="date +%Y-%m-%d | pbcopy && pbpaste"
alias qqdt="date +%Y-%m-%d_%H%M | pbcopy && pbpaste"
alias zetfile='d="$(TZ=GMT date +"%Y%m%d%H%M%S")" && mkdir "$d" && cd "$d" && vim readme.md'

# This is an alternative to create zetfile but stay in the current directory rather than moving to the directory of the created file
alias zetfile2='d="$(date +"%Y%m%d%H%M%S")" && mkdir "$d" && pushd "$d" && vim readme.md; popd'


set -o vi

alias myip="curl http://ipecho.net/plain; echo"

# Brouse and preview the files
alias fzfp="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

alias fzfh="fzf --preview='head -n 30 {}'"

# The below has a problem of creating files and folders with time from the clipboard but it is not correct. Need to research on this.

# alias mkdirzet="mkdir $(date +"%Y%m%d%H%M%S")"
# alias mkdirqqdd="mkdir $(date +"%Y-%m-%d")"
# alias mkdirqqdt="mkdir $(date +"%Y-%m-%d_%H%M")"
# alias touchqqdt="touch $(date +"%Y-%m-%d_%H%M").md"
# alias touchzet="touch $(date +"%Y%m%d%H%M%S").md"
# alias touchqqdd="touch $(date +"%Y-%m-%d").md"



# Setup Vim as my editor
export EDITOR=vim
PATH="$PATH:$HOME/bin"

# Support for Language Input via iBus
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
