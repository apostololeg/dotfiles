# aliases
source ~/.zsh/aliases.zshrc
# functions
source ~/.zsh/functions.zshrc
# включаем цвета
source ~/.zsh/colors.zshrc
# заголовки табиков
source ~/.zsh/tab_titles.zshrc
# приглашалки
source ~/.zsh/prompts.zshrc
# completitions
source ~/.zsh/completions.zshrc
# bind's
source ~/.zsh/binds.zshrc
# хаки и прочее
source ~/.zsh/system.zshrc
# antigen
# source ~/.antigenrc
# npm
source ~/.nvmrc
# Git
source ~/.gitrc
# настройки для конкретной машинки
source ~/.profile
# настройки для osx
source ~/.osx
# ограничение использования CPU для некоторых процессов
source ~/.cpulimits

# подключаем autojump
[[ -s brew && -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# подключаем все кастомные настройки
[ -d ~/.dotfiles/customs ] &&
    for CUSTOM_FOLDER in ~/.dotfiles/customs/*; do
        source $CUSTOM_FOLDER.zshrc;
    done

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
CASE_SENSITIVE=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/oleh/prj/OH/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/oleh/prj/OH/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/oleh/prj/OH/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/oleh/prj/OH/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/oleh/prj/OH/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/oleh/prj/OH/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# Created by `pipx` on 2024-10-07 17:12:28
export PATH="$PATH:/Users/oleh/.local/bin"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
