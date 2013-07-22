# открываем последний screen
#screen -x

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

    # local
    #export PATH=~/bin/:$PATH
    export PATH=~/bin/:$PATH:./node_modules/.bin
    export NODE_PATH=$HOME/node_modules

    # remote
    #export PATH=~/bin/:/usr/local/share/npm/bin:$PATH
    #export NODE_PATH=/usr/local/lib/node_modules

#source ~/.profile

# настройки для osx
source ~/.osx

# подключаем все кастомные настройки
[ -d ~/.dotfiles/customs ] &&
    for CUSTOM_FOLDER in ~/.dotfiles/customs/*; do
        source $CUSTOM_FOLDER.zshrc;
    done
