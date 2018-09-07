HIDE_OUTPUT=/dev/null 2>&1

# очистка формулы и неиспользуемых зависимостей
brcl() {
    [ -z $1 ] ||
        brew rm $1 && brew rm $(join <(brew leaves) <(brew deps $1))
}


# ARCHIVES
# распаковка из архива
unpack() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       unrar x $1 ;;
            *.gz)        gunzip $1 ;;
            *.tar)       tar xf $1 ;;
            *.tbz2)      tar xjf $1 ;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1 ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1 ;;
            *.tbz)       tar xjvf ;;
            *)           echo "'$1' - unknown file format" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# упаковка в архив
pack() {
    if [ $2 ] ; then
        case $2 in
            tbz)        tar cjvf $1.tar.bz2 $1 ;;
            tgz)        tar czvf $1.tar.gz $1 ;;
            tar)        tar cpvf $1.tar $1 ;;
            bz2)        bzip $1 ;;
            gz)         gzip -c -9 -n $1 > $1.gz ;;
            zip)        zip -r $1.zip $1 ;;
            7z)         7z a $1.7z $1 ;;
            *)          echo "'$2' - unknown file format" ;;
        esac
    else
        echo "'$1' is undefined format"
    fi
}


# SHELL
# рекурсивное удаение по маске
rrmm() {
    find . -name $1 -print0 | xargs -0 rm -rf
}

# поиск по содержимому файлов: f "*.js" "click"
f() {
    find . -type f -name $1 | xargs grep -l $2
}

# SCREEN
# мультискрин: multiscreen name user
multiscreen() {
    echo "multiuser on" >> multiscreen.conf
    echo "acladd $2" >> multiscreen.conf
    screen -c multiscreen.conf -S $1
    rm multiscreen.conf
}

# убиваем конкретный screen
skill() {
    screen -S $1 -X quit
}


pkillall() {
    sudo kill -9 $(ps aux | grep -e $1 | awk '{ print $2 }')
}


# подключение удаленного диска
SSM__mount_root=~/Sites/_mounted;
SSM_params() {};

ssmount() {
    SSM_repopath=$1;
    SSM_home=/home/`whoami`/;

    SSM_volname=$1
    [ -z $2 ] || SSM_volname=$2;

    [ -z $DEFAULT_DEV ] || SSM_dev=$DEFAULT_DEV;

    # генерим парамерты
    SSM_params $1 $2;

    # проверяем начилие всех необходимых настроек
    [[ -z $SSM_dev && -z $SSM_repopath && -z $SSM_volname ]] && return;

    # локально создаём папку, в которую будем маунтить
    SSM_local_path=$SSM__mount_root/$SSM_volname;
    [ -d $SSM_local_path ] || mkdir $SSM_local_path;

    # логируем составленную комманду
    echo "\n\tsshfs -C ${SSM_dev}:${SSM_home}${SSM_repopath} $SSM_local_path\n";

    sshfs -C ${SSM_dev}:${SSM_home}${SSM_repopath} $SSM_local_path \
        -o volname=$SSM_volname \
        -o transform_symlinks \
        -o follow_symlinks \
        -o reconnect \
        -o cache=no \
        -o compression=yes \
        -o Ciphers=arcfour \
        -o noappledouble \
        -o no_check_root \
        -o hard_remove \
        -o sync_read \
        -o idmap=user \
        -o workaround=nodelaysrv \
        -s
}
