" Basic Configuration {{{
" Ctrl-l to toggle paste mode {{{
set pastetoggle=<C-l>
" }}}
" don't wrap lines {{{
set nowrap
" }}}
" a tab is four spaces {{{
set tabstop=4
" }}}
" allow backspacing over everything in insert mode {{{
set backspace=indent,eol,start
" }}}
" always set autoindenting on {{{
set autoindent
" }}}
" copy the previous indentation on autoindenting  {{{
set copyindent
" }}}
" always show line numbers {{{
set number
" }}}
" number of spaces to use for autoindenting {{{
set shiftwidth=4
" }}}
" use multiple of shiftwidth when indenting with '<' and '>' {{{
set shiftround
" }}}
" set show matching parenthesis {{{
set showmatch
" }}}
" ignore case when searching {{{
set ignorecase
" }}}
" ignore case if search pattern is all lowercase, case-sensitive otherwise {{{
set smartcase
" }}}
" insert tabs on the start of a line according toggle {{{
set smarttab
" }}}
" highlight search terms {{{
set hlsearch
" }}}
" show search matches as you Types {{{
set incsearch
" }}}
" use softtabstop spaces instead of tab characters for indentation {{{
set expandtab
" }}}
" indent by 4 spaces when pressing <TAB> {{{
set softtabstop=4
" }}}
" automatically inserts indentation in some cases {{{
set smartindent
" }}}
" like smartindent, but stricter and more customisable {{{
set cindent
set mouse=a
" }}}
" hybrid line number {{{
set number relativenumber
" }}}
" be iMproved, required {{{
set nocompatible
" }}}
" plugin and indentation {{{
filetype plugin indent on
" }}}
" Color the character at column 81 {{{
call matchadd('ColorColumn', '\%81v', 100)
" }}}
" Color the character at column 121 {{{
call matchadd('ColorColumn', '\%121v', 100)
" }}}
" Turn on syntax {{{
syntax on
" }}}
" No swap file allow {{{
set noswapfile
" }}}
" Set default clipboard as no clipboard {{{
set clipboard=unnamed
" }}}
" }}}

let g:acp_behaviorKeywordCommand = "\<C-n>"
let g:vimwiki_use_calendar = 1
set lazyredraw
set re=1
set ttyfast
set nocursorline
set stl+=%{ConflictedVersion()}

set statusline+=%#warningmsg#
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"set synmaxcol=128
"syntax sync minlines=256
" Mapping {{{
" Leader key {{{
let mapleader = ","
" }}}
vmap Q gq
nmap Q gqap

" Basic operation {{{
map <leader>x <C-o>:x<cr>
map <leader>q <C-o>:q<cr>
map <leader>w <C-o>:w!<cr>
map <leader>aq <C-o>:q!<cr>
nmap <leader>w :w!<cr>
inoremap <leader>x <C-o>:x<cr>
inoremap <leader>q <C-o>:q<cr>
inoremap <leader>w <C-o>:w!<cr>
inoremap <leader>aq <C-o>:q!<cr>
" }}}
" Clear search highlight {{{
map <silent> <leader><cr> :noh<cr>
" }}}
" Remap : key {{{
nnoremap ; :
" }}}
" Edit vim files {{{
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}
" Convert snake case to camel case {{{
nnoremap + /\$\w\+_<CR>
nnoremap _ f_x~
nnoremap <leader>stm :s#_\(\l\)#\u\1#g<CR>
" }}}
" Pane navigation {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Inden mapping  {{{
map <S-.> <C-}>
" }}}
" Escape key remap {{{
imap jj <Esc>
" }}}
" Tabs operations and navigation {{{
map <C-c> :tabnew<cr>
map <C-x> :tabclose<cr>
"map <C-n> gt
"map <C-\> gT
map <leader>tm :tabmove
" }}}
" Map r for redo {{{
map r <C-r>
" }}}
" Opens a new tab with the current buffer's path {{{
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>gt :!tig <cr>
" }}}
" }}}
"
" Change snake case to camel case in the current line {{{
map <leader>cc :s#_\(\l\)#\u\1#g<cr>
" }}}

" Autocmd {{{
augroup vimrc_autocmd
  autocmd!
" File Types Based Configuration {{{
  autocmd filetype html,xml set listchars-=tab:>.
  autocmd Filetype sass setlocal noexpandtab tabstop=2
au BufRead,BufNewFile *.md setlocal textwidth=80
" }}}

" Auto toggle hybrid line number {{{
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" }}}
" Auto toggle for goyo {{{
"function! s:goyo_enter()
  "silent !tmux set status off
  "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "set noshowmode
  "set noshowcmd
  "set scrolloff=999
  "set norelativenumber
  "set nonumber
  "Limelight
"endfunction
"function! s:goyo_leave()
  "silent !tmux set status on
  "silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  "set showmode
  "set showcmd
  "set scrolloff=5
  "set relativenumber
  "Limelight!
"endfunction
"autocmd! User GoyoEnter nested call <SID>goyo_enter()
"autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}
" }}}

" Plugin Mapping {{{
" Mapping NERDTree {{{
noremap <space><space> :NERDTreeToggle<cr>
" }}}
" Mapping TableMode {{{
nmap <leader>tb :TableModeToggle<cr>
" }}}
" Mapping Php Cs Fixer {{{
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
" }}}
" Mapping CtrlP {{{
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>f'
" }}}
" Mapping Vimwiki {{{
nmap <Leader>as <Plug>VimwikiIndex
nmap <Leader>ai <Plug>VimwikiDiaryIndex
nmap <Leader>dt <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
nmap <Leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
" }}}
" Mapping Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" }}}

" Plugin Installation {{{
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
"Plugin 'VundleVim/Vundle.vim'

" ----- Unused plugins
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-airline'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'Quramy/tsuquyomi'

" ------ Installed plugins
Plug 'scrooloose/nerdcommenter'                                 " Fast commenter 
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}            " File management
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}                " Tagged function and variables
Plug 'jiangmiao/auto-pairs'                                     " Automatically create pair 
Plug 'kien/ctrlp.vim'                                           " Fuzzy finder
Plug 'nightsense/office'                                        " Support office-dark Colorscheme
Plug 'joonty/vdebug', {'for': 'php'}                            " Debug plugin for php, python and ruby
Plug 'tpope/vim-surround'                                       " Quickly surround text with tags, signs
"Plugin 'tpope/vim-fugitive'
"Plugin 'easymotion/vim-easymotion'
"Plug 'itchyny/calendar.vim'
Plug 'Shougo/vimproc.vim'                                       " Forgot
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}                 " PHP Coding Style Fixer
Plug 'vimwiki/vimwiki'                                          " Personal wiki system
Plug 'tbabej/taskwiki'                                          " Combine taskwarrior and vimwiki
Plug 'tpope/vim-fugitive'                                       " Fugitive git
Plug 'christoomey/vim-conflicted', {'on': 'Conflicted'}         " Display and resolve conflict
Plug 'vim-syntastic/syntastic'                                  " Asyn linting tool
"Plug 'w0rp/ale'
"Plugin 'leafgarland/typescript-vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'rking/ag.vim', {'on': 'Ag'}
"Plugin 'mzlogin/vim-markdown-toc'
Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'markdown'}  " Preview markdown file
"Plugin 'junegunn/goyo.vim'
"Plugin 'junegunn/limelight.vim'
"Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'nvie/vim-flake8'                                          " Flake8 for php
Plug 'christoomey/vim-tmux-navigator'                           " Navigator in vim with tmux
"Plugin 'benmills/vimux'
call plug#end()            " required
"
" }}}

" Vim Colorscheme {{{
colorscheme office-dark 
" }}}

" Plugin Configuration {{{
" General Configuration {{{
" Vim AG configuration {{{
let g:ag_working_path_mode="r"
" }}}

" CtrlP configuration {{{
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }}}

" Vim Markdown Preview {{{
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
" }}}
" }}}

" PHP CS Fixer Configuration {{{
let g:php_cs_fixer_path = "/Users/giangle/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_config_file = '/Users/giangle/.php_cs' 
"let g:php_cs_fixer_config = //"default"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "/usr/local/bin/php" 
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 1
" }}}

" Vimwiki Configuration {{{
let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md' ,'path_html': '~/vimwiki/public/'}]
let g:taskwiki_use_python2="yes"
"let g:vimwiki_use_calendar='1'
let g:vimwiki_folding='expr'
" }}}

" VDebug Configuration {{{
" Hapitas project configuration
let g:vdebug_options = {
\ 'path_maps': {"/GitHub": "/ozv"}
\}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0
" }}}
" 
" {{{ Vim markdown preview Configuration
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<M-m>'
" }}}
"
" {{{ ALE PHP
"
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" }}}
" }}}
" vim: foldmethod=marker
