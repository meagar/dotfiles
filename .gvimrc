set number
syntax on
set ruler
set bs=2 " backspace over anything
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

set vb t_vb=
autocmd VimEnter * set vb t_vb=

set hlsearch

colorscheme ir_black

set go-=T
set go-=L
set go-=r

set gfn=Bitstream\ Vera\ Sans\ Mono:h11

autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map  j gj
autocmd BufRead *\.txt map  k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

au BufRead,BufNewFile *.thor set filetype=ruby

call pathogen#infect()

