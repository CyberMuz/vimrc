" execute pathogen#infect() 

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-perl/vim-perl'
" Plugin 'arnar/vim-matchopen'
Plugin 'exu/pgsql.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" Github repos of the user 'vim-scripts'
" => can omit the username part
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'DirDiff.vim'
Plugin 'autoload_cscope.vim'
" Plugin 'Highlight-UnMatched-Brackets'

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" ...

call vundle#end()
filetype plugin indent on     " required!

set number
set autoindent
set smartindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" colorscheme jellybeans
colorscheme lucius

" set cinkeys=0{,0},:,0#,!,!^F
" let mapleader = \",\"
"map <leader>f :FufFile<CR>
"map <leader>c :FufCoverageFile<CR>
map <leader>n :NERDTree<CR>


" Map leader-p to save and execute current buffer in perl
map <leader>p :w<CR>:!perl %<CR>

:set pastetoggle=<F5>
map <F7> "+y
map <F8> :set paste<CR>i<C-R>+<Esc>:set nopaste<CR>
map <F9> <Esc>:w<CR><Esc>:!./normal_tran.sh<CR>
" map <F10> <Esc>mygg"+yG'yzz
map <F10> :%y+<CR>

" Mapping often used getter and setters for PowerZac
inoremap <leader>q $in_attribs->get("");<Esc>F"i
inoremap <leader>w $out_attribs->get("");<Esc>F"i
inoremap <leader>e $in_table->get("");<Esc>F"i
inoremap <leader>r $out_table->get("");<Esc>F"i
" Map leader-w to insert wget command for PZAC
inoremap <leader>w wget "http://localhost:8520/LOCATION/?message=

inoremap <leader>a $in_attribs->set("", );<Esc>F"i
inoremap <leader>s $out_attribs->set("", );<Esc>F"i
inoremap <leader>d $in_table->set("", );<Esc>F"i
inoremap <leader>f $out_table->set("", );<Esc>F"i

inoremap <leader>l Log::CoreLog::log_entry(, "");<Esc>F,i

let @n="wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwi'wwi'wi'wwi'wi'wwi'wwwwwwwwwwwwwwwwwwwwwwwwwi'wwi'wwwwi'wwwwwwwwwwwwwi'wi'wwwwwwwwwwwwwi'wj0"
let @e='wwwwwwwwwwwwr.wwwwwwwwwwwwwwwwr.wwwwwwwwwwwwwwwxwwwwwwwwwwwwwwxwwwwwwwwwwwwj0'

set tags=./tags;~/dev/powerzac-5.6/support/tags;~/dev/powerzac-5.6/zacapps/zaccd/tags

" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

set foldmethod=indent
set foldlevelstart=10
" let perl_fold=1 

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<CR>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<CR>
nnoremap td  :tabclose<CR>

" INPUT mode maps
inoremap jj <Esc> 
" inoremap {      {}<left>
" inoremap {<cr>  {<cr>}<esc>o
" inoremap {{     {
" inoremap {}     {}

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Changing the wildmenu 
set wildmenu
set wildmode=longest,list

" Disable automatic adding of newline in text
set textwidth=0 
set wrapmargin=0

" Bracket magic
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" inoremap        (  ()<Left>
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Activate TagBar
nmap <F4> :TagbarToggle<CR>

" definitions for switch.vim plugin
source ~/.vim/switch-definitions/goran.vim

" vimairline stuff
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline_theme             = 'powerlineish'
let g:airline_theme             = 'luna'
"let g:airline_enable_branch     = 1
"let g:airline_enable_syntastic  = 1

" CtrlP stuff
" set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0

" Note dir
:let g:notes_directories = ['~/projekti/notes']
:let g:notes_suffix = '.txt'
