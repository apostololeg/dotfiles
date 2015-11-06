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
# Git
source ~/.gitrc
# настройки для конкретной машинки
source ~/.profile
# настройки для osx
source ~/.osx

# подключаем autojump
[[ -s brew && -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# подключаем все кастомные настройки
[ -d ~/.dotfiles/customs ] &&
    for CUSTOM_FOLDER in ~/.dotfiles/customs/*; do
        source $CUSTOM_FOLDER.zshrc;
    done

# gulp autocompletion
eval "$(gulp --completion=zsh)"
