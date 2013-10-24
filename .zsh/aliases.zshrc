alias l="ls -lAhG"
alias df="df -h"
alias vi="vim"

# version control
alias svnrevertal="svn st -q | awk '{print $2;}' | xargs svn revert"

# ssh
alias ssh="ssh -A"

# brew
alias brup="brew up && brew outdated | cut -f 1 | xargs brew upgrade && brew cleanup && npm update"

# sshfs processes
alias saux="ps aux | grep sshfs"
