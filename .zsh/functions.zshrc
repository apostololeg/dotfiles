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

pidonport() {
    lsof -i :$1
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

# Enhanced pkill that can handle ports too
# Usage: pkill process_name  OR  pkill :3000  OR  pkill port:3000
pkill() {
    if [[ $1 =~ ^:?([0-9]+)$ ]] || [[ $1 =~ ^port:([0-9]+)$ ]]; then
        # Extract port number
        local port
        if [[ $1 =~ ^:([0-9]+)$ ]]; then
            port=${match[1]}
        elif [[ $1 =~ ^port:([0-9]+)$ ]]; then
            port=${match[1]}
        else
            port=${1#:}
        fi
        
        echo "🔍 Looking for processes on port $port..."
        local pids=$(lsof -ti:$port 2>/dev/null)
        
        if [[ -z $pids ]]; then
            echo "❌ No processes found on port $port"
            return 1
        else
            echo "⚡ Found processes: $pids"
            echo "💀 Killing processes on port $port..."
            echo $pids | xargs kill
            if [[ $? -eq 0 ]]; then
                echo "✅ Successfully killed processes on port $port"
            else
                echo "🔥 Normal kill failed, trying force kill..."
                echo $pids | xargs kill -9
                echo "✅ Force killed processes on port $port"
            fi
        fi
    else
        # Use regular pkill for process names
        echo "🔍 Killing processes matching: $1"
        command pkill "$@"
    fi
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
