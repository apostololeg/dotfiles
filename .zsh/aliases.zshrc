alias l="ls -la"
alias ll="ls"
alias df="df -h"
alias vi="vim"

# version control
alias svnrevertal="svn st -q | awk '{print $2;}' | xargs svn revert"

# ssh
alias ssh="ssh -A"

# sshfs processes
alias saux="ps aux | grep sshfs"

# screen
alias sc="screen -dRR"

# OS info
alias linuxinfo="lsb_release -a"
