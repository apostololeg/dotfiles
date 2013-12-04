alias l="ls --color=tty -la"
alias ll="ls --color=tty"
alias df="df -h"
alias vi="vim"

# version control
alias svnrevertal="svn st -q | awk '{print $2;}' | xargs svn revert"

# ssh
alias ssh="ssh -A"

# sshfs processes
alias saux="ps aux | grep sshfs"
