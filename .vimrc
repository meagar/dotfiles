set number
syntax on
set ruler
set ts=2
set sw=2
set et

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

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
"
" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
  call add(g:pathogen_disabled, 'Command-T')
endif

call pathogen#infect()

nnoremap <cr> :nohlsearch<cr><cr>

set wildignore+="vendor/bundle/**"
set wildignore+="tmp/**"

set rtp+=$GOROOT/misc/vim

