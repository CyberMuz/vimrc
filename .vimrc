" execute pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-perl/vim-perl'
Plugin 'exu/pgsql.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'Raimondi/delimitMate'
Plugin 'csexton/trailertrash.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-surround'

" Badwolf colour scheme
Plugin 'sjl/badwolf'
Plugin 'kshenoy/vim-sol'

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
set relativenumber
set autoindent
set smartindent
set cindent
set expandtab " tabas are spaces
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set mouse=a
set hlsearch
set cursorline          " highlight current line
set nowrapscan " I don't want search to circle
set formatoptions-=t " disables automatic line breaks

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set t_Co=256

" colorscheme jellybeans
" colorscheme Tomorrow-Night
" Dobra schema:
colorscheme lucius
" colorscheme badwolf


" set cinkeys=0{,0},:,0#,!,!^F
" let mapleader = \",\"
"map <leader>f :FufFile<CR>
"map <leader>c :FufCoverageFile<CR>
map <leader>n :NERDTree<CR>


" Map leader-p to save and execute current buffer in perl
map <leader>p :w<CR>:!perl %<CR>
map <leader>f :w \|!fd-reload.sh<CR>

:set pastetoggle=<F5>
map <F7> "+y
map <F8> :set paste<CR>i<C-R>+<Esc>:set nopaste<CR>
" map <F9> <Esc>:w<CR><Esc>:!./normal_tran.sh<CR>
map <F9> <Esc>:w<CR><Esc>:!/home/goran/dev/powerzac-5.6/support/tools/perl/ctap_sim/normal_tran.sh<CR>
map <F10> :%y+<CR>

" Mapping often used getter and setters for PowerZac
inoremap <leader>q $in_attribs->get("")<Esc>F"i
inoremap <leader>w $out_attribs->get("")<Esc>F"i
inoremap <leader>e $in_table->get("")<Esc>F"i
inoremap <leader>r $out_table->get("")<Esc>F"i
" Map leader-g to insert wGet command for PZAC
inoremap <leader>g wget "http://localhost:8520/LOCATION/?message=

inoremap <leader>a $in_attribs->set("", );<Esc>F"i
inoremap <leader>s $out_attribs->set("", );<Esc>F"i
inoremap <leader>d $in_table->set("", );<Esc>F"i
inoremap <leader>f $out_table->set("", );<Esc>F"i

" inoremap <leader>l Log::CoreLog::log_entry(, "");<Esc>F,i
" inoremap <leader>l Log::CoreLog::log_entry(, "perl " . SCRIPT_NAME . "");<Esc>F,i
inoremap <leader>l Log::CoreLog::log_entry(, __PACKAGE__ . "");<Esc>F,i

set tags=./tags;~/dev/powerzac-5.6/support/tags;~/dev/powerzac-5.6/zacapps/zaccd/tags

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level"

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<CR>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<CR>
nnoremap td  :tabclose<CR>
" search for word under cursor
" nnoremap gr :vimgrep <cword> ** <Bar> cw<CR>
nnoremap gr :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" highlight last inserted text
nnoremap gV `[v`]`


" INPUT mode maps
inoremap jj <Esc>

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Changing the wildmenu
set wildmenu
set wildmode=longest,list

set lazyredraw     " redraw only when we need to.

" Disable automatic adding of newline in text
set textwidth=0
set wrapmargin=0

" Activate TagBar
nmap <F4> :TagbarToggle<CR>

" vimairline stuff
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme             = 'luna'
"let g:airline_enable_branch     = 1
"let g:airline_enable_syntastic  = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP stuff
" set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_switch_buffer = 0

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_server_python_interpreter='/usr/bin/python2'
 let g:ycm_global_ycm_extra_conf = '/home/goran/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:loaded_youcompleteme = 1

" Note dir
:let g:notes_directories = ['~/projekti_sync/notes']
:let g:notes_suffix = '.txt'

set encoding=utf-8

nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" set colorcolumn=90
" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Set wrap if vim is in diff mode
" autocmd FilterWritePre * if &diff | setlocal wrap< | colorscheme desert | endif

autocmd FileType perl set iskeyword-=:

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" disable YCM in qf window
let g:ycm_filetype_specific_completion_to_disable = {'qf':1}

vnoremap ; :<c-u>s/\%V./\=printf("%x",char2nr(submatch(0)))/g"<cr><c-l>`<
vnoremap u :<c-u>s/\%V[0-9a-fA-F]\{2\}/\=nr2char(printf("%d", "0x".submatch(0)))/g"<cr><c-l>`<

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" change the selction type
set selection=exclusive

" workaround for NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
