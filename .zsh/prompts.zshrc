# слева
if [ $SSH_CONNECTION ]; then
    PS1=%{$GREEN%}"`hostname -s`  "%{$NO_COLOR%}%
else
    PS1=%{$BLUE%}"^_^  "%{$NO_COLOR%}%
fi

# справа
RPS1="%{$BLACK%} %~%{$NO_COLOR%}%"
function zle-line-init zle-keymap-select {
    zle reset-prompt
}
