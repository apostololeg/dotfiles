" 256 цветов
set t_Co=256
" включить подсветку синтаксиса
syntax on
" фон
set background=dark
" цветовая схема
colorscheme solarized
"set number
"set numberwidth=3
set laststatus=0
set showtabline=2
" выделять строку под курсором
set cursorline
" выключить фолдинг
set nofoldenable
" выключить перенос строк
set nowrap

" подсветка bemhtml как javascript
au BufNewFile,BufRead *.bemhtml set filetype=javascript
au BufNewFile,BufRead *.zshrc set filetype=zsh

" Indent Guides
"autocmd VimEnter,Colorscheme * :IndentGuidesToggle
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Super Tab
let g:SuperTabDefaultCompletionType='context'
