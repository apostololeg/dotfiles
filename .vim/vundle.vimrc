set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/gmarik/vundle.git'

" Solarized Colorscheme for Vim
Bundle 'git://github.com/altercation/vim-colors-solarized.git'

" Indent Guides is a plugin for visually displaying indent levels in Vim
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'

" Aims to be a concise vim script that implements some of TextMate's
" snippets features
Bundle 'git://github.com/msanders/snipmate.vim.git'

" Vastly improved vim's javascript indentation
Bundle 'git://github.com/pangloss/vim-javascript.git'

" Add CSS3 syntax support to vim's built-in syntax/css.vim
Bundle 'git://github.com/hail2u/vim-css3-syntax.git'

" HTML5 omnicomplete funtion and syntax for Vim
Bundle 'git://github.com/othree/html5.vim.git'

" A Personal Wiki For Vim Plugin
Bundle 'git://github.com/vim-scripts/vimwiki.git'

" Vim Markdown runtime files
Bundle 'git://github.com/tpope/vim-markdown.git'

" This plugin causes all trailing whitespace to be highlighted in red
" To fix the whitespace errors, just call :FixWhitespace.
Bundle 'git://github.com/bronson/vim-trailing-whitespace.git'

" Included are syntax, indent, and filetype plugin files
" for git, gitcommit, gitconfig, gitrebase, and gitsendemail
Bundle 'git://github.com/tpope/vim-git.git'

" Vim plugin for intensely orgasmic commenting
Bundle 'git://github.com/scrooloose/nerdcommenter.git'

" The Command-T plug-in provides an extremely fast, intuitive mechanism for
" opening files and buffers with a minimal number of keystrokes
Bundle 'git://git.wincent.com/command-t.git'

" Most Resent Used files
Bundle 'git://github.com/vim-scripts/mru.vim.git'

filetype plugin indent on
