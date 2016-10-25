" UI {{{
colorscheme desert
syntax enable
" Line number {{{
highlight LineNr term=italic cterm=NONE ctermfg=DarkGrey ctermbg=NONE
set relativenumber
set number
" }}}
set showcmd
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=marker
" }}}

" Tabs and spaces {{{
set tabstop=2
set softtabstop=2
set expandtab
" }}}

" Search {{{
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" }}}

" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Useability {{{
set mouse=""
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2
" }}}

" Functions {{{
" remove trailing spaces after saving
autocmd BufWritePre * %s/\s\+$//e
" }}}

" Plugins {{{
" Gundo {{{
"source ~/.vim/gundo/autoload/gundo.vim
"nnoremap <leader>u :GundoToggle<CR>
" }}}
" }}}
