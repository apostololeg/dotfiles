set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/gmarik/vundle.git'

" Solarized Colorscheme for Vim
"Bundle 'git://github.com/altercation/vim-colors-solarized.git'

" Indent Guides is a plugin for visually displaying indent levels in Vim
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'

" This plugin causes all trailing whitespace to be highlighted in red
" To fix the whitespace errors, just call :FixWhitespace.
Bundle 'git://github.com/bronson/vim-trailing-whitespace.git'

" Vim plugin for intensely orgasmic commenting
Bundle 'git://github.com/scrooloose/nerdcommenter.git'

filetype plugin indent on
