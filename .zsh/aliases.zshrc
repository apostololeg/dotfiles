alias l="ls -lAhG"
alias df="df -h"
alias vi="vim"

# version control
alias df="git diff > diff"
alias sd="svn diff > diff"
alias svnrevertal="svn st -q | awk '{print $2;}' | xargs svn revert"

# ssh
alias ssh="ssh -A"
#   @tadatuta`s dev
alias sscube="ssh sheff@178.20.152.67"

# brew
alias brup="brew up && brew outdated | cut -f 1 | xargs brew upgrade && brew cleanup && npm update"