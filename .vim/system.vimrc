" имя шелла для :!
set shell=zsh
" количество отмен
set undolevels=1000
" минимальное количество строк от курсора, после которого будет скролл
set scrolloff=7
" количество строк, на которое отматывает скролл
set scrolljump=5
" разрешать backspace везде в режиме редактирования
set backspace=indent,eol,start
" показывать меню автодополнения имён файлов
set wildmenu
" режим wildmenu, показывающий все папки и файлы списком
set wildmode=list:longest,full
" хаки для backspace под скрином
set t_kb=^V
" запретить создание *.swp файлов
set noswapfile
" запретить backup
set nobackup
" режим вставки / удобно вставлять скопированный текст из внешнего буфера
set paste
fixdel

if has('windows')

    function! MyTabLabel(n)
        let buflist = tabpagebuflist(a:n)
        let winnr = tabpagewinnr(a:n)
        let buflen = tabpagewinnr(a:n, '$')
        let bufname = fnamemodify(bufname(buflist[winnr - 1]), ':t')

        let label = ''
        let label .= bufname == '' ? 'Empty' : bufname
        let label .= ''

        return label
    endfunction

    function! MyTabLine()
        let s = ''

        for i in range(tabpagenr('$'))
            if i + 1 == tabpagenr()
                let s .= '%#TabLineSel#'
            else
                let s .= '%#TabLine#'
            endif

            let s .= '%' . (i + 1) . 'T'
            let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
        endfor

        let s .= '%#TabLineFill#%T'
        if tabpagenr('$') > 1
            let s .= '%=%#TabLine#%999Xx'
        endif

        return s
    endfunction

    set tabline=%!MyTabLine()
endif
