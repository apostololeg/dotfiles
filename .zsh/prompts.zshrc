#!/bin/zsh

autoload -U colors
colors
setopt prompt_subst

get_git_prompt() {
    if [ -d .git ]; then
        local message=`git branch | awk '/^\*/ {print $2}'`
        local color=$GREEN

        git diff --quiet || color=$YELLOW
        [ -z "$message" ] || echo $color$message$NO_COLOR' '
    fi
}

get_hostname() {
    [ $SSH_CONNECTION ] && echo -e "%{$CYAN%}$(hostname -s) "
}

get_cwd() {
    echo -e "%{$DARKGRAY%}%~%{$NO_COLOR%}"
}

PROMPT_ICON="%{$NO_COLOR%}▲ "

PROMPT='$(get_hostname)$(get_cwd) $(get_git_prompt)$PROMPT_ICON'

function zle-line-init zle-keymap-select {
    zle reset-prompt
}
