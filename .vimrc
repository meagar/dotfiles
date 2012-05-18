set number
syntax on
set ruler
set ts=2
set sw=2

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml,javascript set ai sw=2 sts=2 et
augroup END

set ignorecase
set smartcase

set foldmethod=indent

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
match ExtraWhitespace /\s\+$/

set vb t_vb=
autocmd VimEnter * set vb t_vb=

set hlsearch

au BufRead,BufNewFile *.thor set filetype=ruby

call pathogen#infect()
