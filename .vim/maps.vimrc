" to define a mapping which uses the mapleader variable, the special string <Leader> can be used
let mapleader=','

" переключение режима вставки
set pastetoggle=<C-v>

" открывает по gf в новой вкладке
map gf <C-W>gf

"переключение между табами ( предыдущий / следующий )
map <C-H> :tabprevious<cr>
map <C-L> :tabnext<cr>
map <C-T> :tabnew<cr>:vi 

" MRU / open recent files list
nmap <Leader>m :MRU<cr>

" переключение табов по alt+цифра
map <esc>1 1gt
map <esc>2 2gt
map <esc>3 3gt
map <esc>4 4gt
map <esc>5 5gt
map <esc>6 6gt
map <esc>7 7gt
map <esc>8 8gt
map <esc>9 9gt

" сохранить
nmap <F1> :w<cr>
vmap <F1> <esc>:w<cr>
imap <F1> <C-O>:w<cr>
cmap <F1> <esc><esc>:w<cr>

" сохранить и выйти
nmap <F2> :wq<cr>
vmap <F2> <esc>:wq<cr>
imap <F2> <C-O>:wq<cr>
cmap <F2> <esc><esc>:wq<cr>

" выйти
nmap <F3> :q!<cr>
vmap <F3> <esc>:q!<cr>
imap <F3> <C-O>:q!<cr>
cmap <F3> <esc><esc>:q!<cr>

" выйти сквозь трупы
nmap <F4> :qa!<cr>
vmap <F4> <esc>:qa!<cr>
imap <F4> <C-O>:qa!<cr>
cmap <F4> <esc><esc>:qa!<cr>

" свернуть в шелл
nmap <C-D> :sh<cr>
vmap <C-D> <esc>:sh<cr>
imap <C-D> <C-O>:sh<cr>
cmap <C-D> <esc><esc>:sh<cr>

" переключить на сплит справа
nmap <s-right> <c-w><right>
imap <s-right> <esc><c-w><right>
vmap <s-right> <esc><c-w><right>

" переключить на сплит слева
nmap <s-left> <c-w><left>
imap <s-left> <esc><c-w><left>
vmap <s-left> <esc><c-w><left>

" переключить на сплит сверху
nmap <s-up> <c-w><up>
imap <s-up> <esc><c-w><up>
vmap <s-up> <esc><c-w><up>

" переключить на сплит снизу
nmap <s-down> <c-w><down>
imap <s-down> <esc><c-w><down>
vmap <s-down> <esc><c-w><down>

" Tagbar
nmap <F8> :TagbarToggle<CR>
