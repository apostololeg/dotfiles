# check for trash: console.log(), alert()...
function trash () {
    svn diff | grep 'console.'
    svn diff | grep 'alert'
}

# make new repo from curent folder
function rerepo () {
    rm -rf .git
    git init
    git add .
    git ci -m "init"
    git remote add origin $1 && git push -u origin master
}

# change origin of git repo
function reorigin () {
    git remote rm origin
    git remote add origin $1
}

# распаковка из архива
unpack () {
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
pack () {
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

# рекурсивное удаение по маске
function rrmm() {
    find . -name $1 -print0 | xargs -0 rm -rf
}

# поиск по содержимому файлов: f "*.js" "click"
function f() {
    find . -type f -name "$1" -and -not -name "*.svn*" -exec grep -i -l "$2" {} \;
}

# мультискрин: multiscreen name user
function multiscreen() {
    echo "multiuser on" >> multiscreen.conf
    echo "acladd $2" >> multiscreen.conf
    screen -c multiscreen.conf -S $1
    rm multiscreen.conf
}

# убиваем конкретный screen
function skill() {
    screen -S $1 -X quit
}
