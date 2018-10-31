set number

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'hzchirs/vim-material'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'leafgarland/typescript-vim'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Valloric/MatchTagAlways'
Plugin 'jwalton512/vim-blade'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
call vundle#end()            " required

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"===== Indentation =====
filetype plugin indent on    " required

let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.<Paste>
nnoremap <F12> :call PhpCsFixerFixFile()<CR>
"autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent

let g:indentLine_enabled = 1

let g:deoplete#enable_at_startup = 1

:map <C-1> 1gt
:imap <C-1> <C-O>1gt
:map <C-2> 2gt
:imap <C-2> <C-O>2gt
:map <C-3> 3gt
:imap <C-3> <C-O>3gt
:map <C-4> 4gt
:imap <C-4> <C-O>4gt
:map <C-5> 5gt
:imap <C-5> <C-O>5gt
:map <C-6> 6gt
:imap <C-6> <C-O>6gt
:map <C-7> 7gt
:imap <C-7> <C-O>7gt
:map <C-8> 8gt
:imap <C-8> <C-O>8gt
:map <C-9> 9gt
:imap <C-9> <C-O>9gt

imap ,c <C-o>:call NERDComment(0,"toggle")<C-m>
nmap ,c <C-o>:call NERDComment(0,"toggle")<C-m>

" Escape insert mode everytime you go double 'k' or double 'j'
imap jj <Esc>
imap kk <Esc>

" Reload file
nmap <F5> :e<CR>
nmap <C-A> :w<CR>:so %<CR>

" Sometimes I forget to leave insert mode to save my files, this is what saves me
imap :w<CR> <Esc>:w<CR>i

" This mapping is to create a blank line without having to do all the work needed for creating a blank line
nmap <Space><CR> i<CR>jj
   
" This mapping is to insert a blank space without having to do all the work needed for creating a blank space
nmap <Space><Space> i<Space>jj 

" Those are to indent code selected in visual mode, and stay in visual mode. Ain't that neat?
vmap <TAB> ><CR>gv
vmap <S-TAB> <<CR>gv

" You can indent with Tab and unindent with Shift + Tab
nnoremap <S-TAB> <<
nnoremap <TAB> >>
set tabstop=2 shiftwidth=2 expandtab

"===== Searching =====
" Highlight search matches
set hlsearch

" Start highlighting as you type the search
set incsearch

" Ignore case on searches
set ignorecase

" If you type upper and lower cased letters, they will be respected
set smartcase

" Setting tab size; Tabs are actually 2 spaces, but the size is the same
set tabstop=4 shiftwidth=4

" Allows backspace to      walk around better
set backspace=indent,eol,start

" Allow buffer switching without saving
set hidden 
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
set shortmess+=A


"===== TABS/SPLITS =====
" Create a new tab
nmap <Space>tt :tabe<CR>

" Go to next tab
nmap <Space>tn :tabn<CR>

" Go to previous tab
nmap <Space>tp :tabp<CR>

" Those are to make splits bigger/smaller
nmap <Space>k :res<Space>-10<CR>
nmap <Space>j :res<Space>+10<CR>

" Those are to make vertical splits bigger/smaller
nmap <Space>h :vertical<Space>resize<Space>-10<CR>
nmap <Space>l :vertical<Space>resize<Space>+10<CR>

" Those are to make given split as huge as it can be
nmap <Space>min<CR> :res<Space>-200<CR>
nmap <Space>max<CR> :res<Space>+200<CR>

" Those are to make given vertical split as huge as it can be
nmap <Space>vmin<CR> :vertical<Space>resize<Space>-200<CR>
nmap <Space>vmax<CR> :vertical<Space>resize<Space>+200<CR>

"===== Nerdtree =====
"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"How can I close vim if the only window left open is a NERDTree?    
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <Space>n :NERDTreeToggle<CR>

" This command will find the current file inside your file tree
nmap <C-f> :NERDTreeFind<CR>

" Setting ctags to go to function definition
set tags=tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"===== Control P =====
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set ignorecase

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Show hidden files
let NERDTreeShowHidden=1

"===== COMMANDS =====
cab W w
cab Wq wq
cab Wqa wqa
cab WqA wqa
cab WQa wqa
cab WQA wqa
cab wQA wqa
cab wqA wqa
cab wQ wq
cab WA wa
cab Q q
cab Qa qa
cab Vs vs
cab VS vs
cab vS vs
cab Sp sp
cab SP s
cab Sh sh
cab SH sh
cab sH sh
cab So so
cab sO so
cab SO so
cab U u

vmap <C-l> <C-w>w

" No much explanation needed here
set encoding=utf-8

" Show the commands you've been pressing on vim 
set showcmd

" Set a dir to send your swp files
set dir=~/tmp

" Copy and past clipboard
noremap <C-c> "+y
noremap <C-v> "+p

noremap <C-e> <leader>c<space>

"===== Theme =====
"let g:enable_bold_font = 1
"let g:enable_italic_font = 1
"colorscheme vim-material
"colorscheme materialtheme
"colorscheme hybrid_material 
set termguicolors
colorscheme quantum
let g:quantum_italics=1
"set background=dark

set guifont=DroidSansMono\ Nerd\ Font\ 11:h10
