compinit

# кэширование
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# список автодополняльщиков
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# показывать все возможные варианты автодополнения
zstyle ':completion:*:expand:*' tag-order all-expansions
# игнорировать регистр
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# игнорировать дополнение закэшированных команд, которых нет
zstyle ':completion:*:functions' ignored-patterns '_*'
# меню выбора дополненных вариантов
zstyle ':completion:*' menu yes select
# в списке дополнения rm пропускать файлы *.old и *.back
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.old' '*?.back'
# игнорировать повторы в истории команд
zstyle ':completion:*:history-words' remove-all-dups yes
# показывать количество исправленных ошибок в corrections
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# разбивать дополнения на группы
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' group-name ''
# формат названия групп
zstyle ':completion:*:descriptions' format $'%{\e[01;32m%}completing %B%d%b%{\e[0m%}'

# no cd!!!
setopt auto_cd
# курсор всегда в конце дополненного слова
setopt always_to_end
# автоматически добавлять / в конец, если дополненное является директорией
setopt auto_param_slash
# дополнять и раскрывать имена файлов по звёздочке
setopt glob
# автодополнять первую точку в .dotfiles
setopt glob_dots
# автоматически добавлять / в конце автодополненных и раскрытых имён директорий
setopt mark_dirs
# если имена файлов начинаются с цифр, то сортировать по возрастанию
setopt numeric_glob_sort
# накапливать историю
setopt append_history
# не заёбывать, если в истории ничего не найдено
setopt no_hist_beep
# не добавлять команду в историю, если предыдущая команда была точно такой же
setopt hist_ignore_dups
# пытаться исправить всё, что набрано
setopt correct_all
