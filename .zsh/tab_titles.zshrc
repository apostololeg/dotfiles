if [ $SSH_CONNECTION ]; then
    precmd () {print -Pn "\e]0;%m:%~\a"}
else
    precmd () {print -Pn "\e]0;%~\a"}
fi
