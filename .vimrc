" execute pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle
" required!
" Plugin 'VundleVim/Vundle.vim'

call plug#begin('~/.vim/plugged')

" My Bundles here:
"
" original repos on github
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'vim-perl/vim-perl'
Plug 'exu/pgsql.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'
Plug 'csexton/trailertrash.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'

" Badwolf colour scheme
Plug 'sjl/badwolf'
Plug 'kshenoy/vim-sol'

" Github repos of the user 'vim-scripts'
" => can omit the username part
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'will133/vim-dirdiff'
Plug 'vim-scripts/autoload_cscope.vim'
" Plug 'Highlight-UnMatched-Brackets'
" non github repos
" Plug 'git://git.wincent.com/command-t.git'
" ...

" Install Vim COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" call vundle#end()
" filetype plugin indent on     " required!

call plug#end()

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
" colorscheme lucius
colorscheme industry
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
nnoremap ge :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
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


"""""""""""""" COC configuration  """"""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"   " Use tab for trigger completion with characters ahead and navigate.
"   " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"   " other plugin before putting this into your config.
"   inoremap <silent><expr> <TAB>
"         \ pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ coc#refresh()
"   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/.cocrc
