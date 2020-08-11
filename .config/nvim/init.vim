"##################################################
"
" neovim configuration
"
"##################################################
"  Author: Tomislav Nikic
"  Email: hello@tmslvnkc.com

" Fish
if &shell =~# 'fish$'
    set shell=sh
endif

" Language setup
set undofile
set encoding=utf-8

" Leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" Highlight
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Mouse
set mouse=a
set mousehide

" Editor settings
set ignorecase
set number
set conceallevel=1
set relativenumber

" Tab settings
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
nnoremap p ]p

" Mappings
nnoremap ,<space> :nohlsearch<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" Filetype settings
filetype plugin indent on
filetype on
filetype indent on

" Plugins
call plug#begin("$XDG_DATA_HOME/nvim/plugged")

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-test/vim-test'

Plug 'dag/vim-fish'

Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'

Plug 'sainnhe/forest-night'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" File tree
map - :NERDTreeToggle<CR>
map _ :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" Theme
syntax enable
set termguicolors
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night

" Lightline
let g:lightline = { 'colorscheme': 'forest_night' }

" File search
nnoremap <Leader>[ :Files<Cr>
nnoremap <Leader>] :Rg<Cr>

" Linter
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'ruby': ['solargraph','ruby','rubocop'],
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

" Ale
nnoremap <Leader>' :ALEGoToDefinition<Cr>

" Testing
nmap <silent> <C-t> :TestFile<CR>
let test#strategy = "neovim"
let test#project_root = "~/code/gitlab/product/qa"
let test#filename_modifier = ':p'
let test#ruby#bundle_exec = 0
let test#ruby#rspec#executable = 'CHROME_HEADLESS=false bundle exec bin/qa Test::Instance::All http://kiwano.do.gitlap.com:3000 --'
