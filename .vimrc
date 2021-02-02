" Basic Configuration {{{
"set pastetoggle=<C-l>                                   " Ctrl-l to toggle paste mode
set nowrap                                              " don't wrap lines
set t_Co=256
set tabstop=4                                           " a tab is four spaces
set backspace=indent,eol,start                          " allow backspacing over everything in insert mode
set autoindent                                          " always set autoindenting on
set copyindent                                          " copy the previous indentation on autoindenting
set number                                              " always show line numbers
set shiftwidth=4                                        " number of spaces to use for autoindenting
set shiftround                                          " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                                           " set show matching parenthesis
set ignorecase                                          " ignore case when searching
set smartcase                                           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                                            " insert tabs on the start of a line according toggle
set hlsearch                                            " highlight search terms
set incsearch                                           " show search matches as you Types
set expandtab                                           " use softtabstop spaces instead of tab characters for indentation
set softtabstop=4                                       " indent by 4 spaces when pressing <TAB>
set smartindent                                         " automatically inserts indentation in some cases
set cindent                                             " like smartindent, but stricter and more customisable
set mouse=a                                             " allow to use mouse
set number relativenumber                               " hybrid line number
set nocompatible                                        " be iMproved, required
filetype plugin indent on                               " plugin and indentation
"call matchadd('ColorColumn', '\%81v', 100)             " Color the character at column 81
"call matchadd('ColorColumn', '\%121v', 100)            " Color the character at column 121
syntax on                                               " color for language syntax
set noswapfile                                          " No swap file allow
set clipboard=unnamed                               " Set default clipboard as no clipboard
set lazyredraw                                          " lazy mode for redrawing
set re=1                                                " rendering optimization
set ttyfast                                             " rendering optimization
set nocursorline                                        " remove current cursor line highlight
set statusline+=%#warningmsg#                           " status message line for language error
set statusline+=%*                                      " close tage for status line
set tags=./tags;                                        " setup default tags directory for ctag
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
colorscheme default
" }}}
"
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=darkgrey ctermbg=252
hi IndentGuidesEven guibg=darkgrey ctermbg=251
hi Search guibg=Blue guifg=Black ctermbg=Blue ctermfg=Black
let java_highlight_functions = 1
let java_highlight_all = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

" CtrlP-------------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env\|venv'                       " CtrlP ignore files
" AutoComplPop------------------------------------------------------------------
let g:acp_behaviorKeywordCommand = "\<C-n>"                                     " AutoComplPop key press
" Indent Line-------------------------------------------------------------------
let g:indentLine_setColors = 0                                                  " Set color for indent line
" Syntastic---------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1                                            " Allow syntastic to populate loc list
let g:syntastic_auto_loc_list = 1                                                       " Auto loc list 
let g:syntastic_php_checkers = ['php',  'phpmd']                                        " Checker plugins
let g:syntastic_php_phpcs_exec = '/home/giangle/.composer/vendor/bin/php-cs-fixer'     " Path to exec phpcs
let g:syntastic_php_phpcs_args = '--standard=psr2'                                      " Basic standard
let g:syntastic_php_phpmd_exec = '/home/giangle/.composer/vendor/bin/phpmd'     " phpmd executing path
let g:syntastic_php_phpmd_post_args = 'cleancode,design,unusedcode'                     " Arguments for phpmd
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': ['python'],
                            \ 'passive_filetypes': ['html', 'javascript', 'php',' vue'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '/home/giangle/checkstyle-8.19-all.jar'
let g:syntastic_java_checkstyle_conf_file = '/home/giangle/.checkstyle.xml'


inoremap <C-P> <C-x><C-o>|                                                      " Trigger OmniComp
nnoremap ; :|                                                                   " Map ; as :
let mapleader = ","                                                             " Mapping leader key
map r <C-r>|                                                                    " Map redo
map <leader>x <C-o>:x<cr>|                                                      " Save and quit
map <leader>q <C-o>:q<cr>|                                                      " Quit
map <leader>w <C-o>:w!<cr>|                                                     " Force write
map <leader>aq <C-o>:q!<cr>|                                                    " Force quit
nmap <leader>w :w!<cr>|                                                         " Write for nmap
map <silent> <leader><cr> :noh<cr>|                                             " Remove all highlight
nmap <silent> <leader>ev :e $MYVIMRC<CR>|                                       " Edit my vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>|                                      " Source my vimrc file
nnoremap + /\$\w\+_<CR>|                                                        " Find snakecase in php
nnoremap _ f_x~|                                                                " Convert snakecase to camel
nnoremap <leader>stm :s#_\(\l\)#\u\1#g<CR>|                                     " Convert all snakecase to camel
nnoremap <C-J> <C-W><C-J>|                                                      " Jump to below pane
nnoremap <C-K> <C-W><C-K>|                                                      " Jump to upper pane
nnoremap <C-L> <C-W><C-L>|                                                      " Jump to right pane
nnoremap <C-H> <C-W><C-H>|                                                      " Jump to left pane
map <S-.> <C-}>|                                                                " Indent mapping
imap jj <Esc>|                                                                  " jj as escape
imap hh <Esc>|                                                                  " hh as escape
imap kk <Esc>|                                                                  " kk as escape
let g:ctrlp_map = '<leader>f'|                                                  " Toggle ctrlp
"map <C-c> :tabnew<cr>
"map <C-x> :tabclose<cr>
"map <C-n> gt
"map <C-\> gT
"map <leader>tm :tabmove
" }}}
" Map r for redo {{{
" }}}
" Opens a new tab with the current buffer's path {{{
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>gt :!tig <cr>
" Change snake case to camel case in the current line {{{
map <leader>sc :s#_\(\l\)#\u\1#g<cr>
" }}}
noremap <space><space> :NERDTreeToggle<cr>|                                     " Toggle NERDTree
nmap <leader>tb :TableModeToggle<cr>                                            " Toggle table mode
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>                 " Toggle phpcs fixer for the current directory
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>                      " Toggle phpcs fixer for the current file
map <leader>b :CtrlPBuffer<CR>|                                                 " Toggle buffer
nmap <F8> :TagbarToggle<CR>|                                                    " Toggle tagbar
"noremap <C-l> :Phplint<CR></CR>|                                                " Toggle phplint
nmap gm :LivedownToggle<CR>|                                                    " Toggle livedown
nmap <leader>cq :SyntasticCheck<CR>|                                            " Toggle check syntastic
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-w> gg=G

augroup vimrc_autocmd
  autocmd!
  autocmd filetype html,xml set listchars-=tab:>.
  autocmd FileType java map <leader>ca :call JCommentWriter()<CR> 
  autocmd FileType php map <leader>ca :call JCommentWriter()<CR> 
au BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd FileType css,javascript,javascript.jsx,javascript.vue,yml,yaml setlocal tabstop=2 shiftwidth=2
  autocmd FileType vue setlocal tabstop=2 shiftwidth=2
autocmd FileType gitcommit set colorcolumn=73
augroup END
" Plugin Installation
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
"Plugin 'VundleVim/Vundle.vim'

" ----- Unused plugins
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'bling/vim-airline'
"Plug 'Quramy/tsuquyomi'
"Plug 'nightsense/office'                                           " Support office-dark Colorscheme
"Plug 'easymotion/vim-easymotion'
"Plug 'itchyny/calendar.vim'
"Plug 'joonty/vim-phpqa'
"Plug 'tbabej/taskwiki'                                             " Combine taskwarrior and vimwiki
"Plug 'w0rp/ale'
"Plug 'leafgarland/typescript-vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'gregsexton/gitv', {'on': ['Gitv']}
"Plug 'mzlogin/vim-markdown-toc'
"Plug 'craigemery/vim-autotag'
"Plug 'benmills/vimux'

" ------ Installed plugins
Plug 'scrooloose/nerdcommenter'                                     " Fast commenter 
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}                " File management
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}                    " Tagged function and variables
Plug 'jiangmiao/auto-pairs'                                         " Automatically create pair 
Plug 'kien/ctrlp.vim'                                               " Fuzzy finder
Plug 'joonty/vdebug', {'for': 'php'}                                " Debug plugin for php, python and ruby
Plug 'tpope/vim-surround'                                           " Quickly surround text with tags, signs
Plug 'airblade/vim-gitgutter'                                       " Display difference in line
Plug 'Shougo/vimproc.vim'                                           " Forgot
Plug 'itchyny/calendar.vim'                                         " Calendar for vim
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}                     " PHP Coding Style Fixer
Plug 'mxw/vim-jsx', {'for': ['js', 'jsx', 'html']}
"Plug 'vimwiki/vimwiki'                                              " Personal wiki system
"Plug 'tbabej/taskwiki'
Plug 'dhruvasagar/vim-table-mode', {'on':'TableModeToggle'}
Plug 'tpope/vim-fugitive'                                           " Fugitive git
Plug 'christoomey/vim-conflicted', {'on': 'Conflicted'}             " Display and resolve conflict
Plug 'vim-syntastic/syntastic', {'on': 'SyntasticCheck'}            " Asyn linting tool
Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx', 'html']}
Plug 'vim-scripts/AutoComplPop'
"Plug 'SirVer/ultisnips'                                             " UltiSnip for snippets
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'shime/vim-livedown'
Plug 'nvie/vim-flake8'                                          " Flake8 for python
"Plug 'christoomey/vim-tmux-navigator'                           " Navigator in vim with tmux
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/gv.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iberianpig/tig-explorer.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
"Plug 'dbakker/vim-projectroot'
call plug#end()            " required

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" ------ Project Root configuration
"let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git', '.hg', '.svn', '.bzr','_darcs','build.xml']
" ------ Vim AG configuration
let g:ag_working_path_mode="r"

" ------ CtrlP configuration
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" PHP CS Fixer Configuration
let g:php_cs_fixer_path = "/home/giangle/.composer/vendor/bin/php-cs-fixer"
"let g:php_cs_fixer_level = "psr2"
"let g:php_cs_fixer_config_file = '/home/giangle/.php_cs' 
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "/usr/bin/php" 
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 1
"let g:php_cs_fixer_config = //"default"

" ---- tig-explorer
" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>
" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>
" open tig grep
"nnoremap <Leader>g :TigGrep<CR>
" resume from last grep
"nnoremap <Leader>r :TigGrepResume<CR>
" open tig grep with the selected word
"vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
" open tig grep with the word under the cursor
"nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
" open tig blame with current file
"nnoremap <Leader>b :TigBlame<CR>

" ---- UltiSnip
let g:UltiSnipsExpandTrigger="C-q"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=['~/.vim/utilsnips_rc/']
let g:UltiSnipsEditSplit="vertical"

let g:taskwiki_markup_syntax = 'markdown'
" ------- VDebug Configuration
let g:vdebug_options = {
\ 'path_maps': {
\   "/GitHub":"/ozv",
\   "/vagrant/":"/home/giangle/Development/pav/ozv/comic"
\ }
\}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0

" ---- Java Autocomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Vim markdown preview Configuration

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" ALE PHP
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" ---- NERDTRee 
let NERDTreeIgnore = ['\.pyc$']
" --- Go tagbar config
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
