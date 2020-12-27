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

# brew
alias brup="brew up && brew outdated | cut -f 1 | xargs brew upgrade && brew cleanup && npm update"

# OS info
alias linuxinfo="lsb_release -a"

# pacman aliases
alias pac="sudo pacman"
alias pacu='pac -Syu'  # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pacr='pac -Rs'   # remove
alias pacs='pac -Ss'   # search
alias paci='pac -S'    # install
alias pacin='pac -Si'  # info
alias paco='pac -Qdt' # list orphans
alias pacro='paclo && pac -Rns $(pac -Qtdq)' # remove orphans
alias pacc='pac -Scc'  # clean cache
alias paclf='pac -Ql'  # list files
