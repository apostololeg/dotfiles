#export LC_ALL="ru_RU.UTF-8"
export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TIME="en_EN.UTF-8"
export LC_CTYPE=en_US.UTF-8

export LANG="ru_RU.UTF-8"
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export EDITOR=vim
export PAGER=less
export BLOCKSIZE=K

# хак для ssh-ключей под скрином
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != "/tmp/ssh-agent-$USER-screen" ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf "$SSH_AUTH_SOCK" "/tmp/ssh-agent-$USER-screen"
fi
