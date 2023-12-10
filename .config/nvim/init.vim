set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " relative line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
setlocal spell spelllang=en_us
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin("~/.vim/plugged")
" Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
" Plug 'ludovicchabant/vim-gutentags' " ctags
call plug#end()

lua require('Comment').setup()
lua require'lspconfig'.ruby_ls.setup{}
" automatically show NERDTree
" au VimEnter *  NERDTree

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
colorscheme tokyonight-night

" My stuff from vim

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
highlight ColorColumn guibg=#191923

match ExtraWhitespace /\s\+$/

set ruler
set colorcolumn=101
set smartcase
set foldmethod=indent

" vim.lsp.start({
"   name = 'ruby-lsp',
"   cmd = {'ruby-lsp'},
"   root_dir = vim.fs.dirname(vim.fs.find({'Gemfile'}, { upward = true })[1]),
" })
