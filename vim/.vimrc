
set nocompatible

"================ Configure Vundle ====================
filetype on " without this vim emits a zero exit status, later, because of :ft off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
call vundle#end()


"================ UI and Color ====================
colorscheme monokai
syntax enable " enable syntax highlighting
set t_Co=256
set textwidth=79 


" ================ General Config ====================
set encoding=utf-8
set history=1000                                             " remember more commands and search history
set undolevels=1000                                          " use many muchos of undo
set lazyredraw                                               " redraw when we need to
set nowrap
set noswapfile
set autoread
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set numberwidth=4
set showmatch                                                " show matching brackets [{()}]
set foldenable                                               " enable code folding
set relativenumber
set scrolloff=3                                              " show context above/below cursorline
set mouse=a
set directory-=.                                             " don't store swapfiles in the current directory
set ignorecase                                               " case-insensitive search
set smartcase                                                " case-sensitive search if any caps
set incsearch                                                " search as you type
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc " search ignore
set cmdheight=2
set shortmess=a
set lazyredraw                                               " Don't redraw when we don't have to
set regexpengine=1
set magic                                                    " Enable extended regexes
set title                                                    " Show the filename in the window titlebar
set ttyfast                                                  " Send more characters at a given time
set wildchar=<TAB>                                           " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*



"================ Indention ====================
filetype plugin indent on
set autoindent
set linebreak     " Wrap lines at convenient points
set expandtab     " expand tabs to spaces
set softtabstop=4 " insert mode tab and backspace use n spaces
set tabstop=4     " actual tabs occupy n
set shiftwidth=4  " normal mode indentation commands use n spaces
set backspace=2   " Fix broken backspace in some setups
setl tw=90


"================ Key mapping ====================
map <space> <leader>

"Remap <ESC>
inoremap jk <ESC>
inoremap kj <ESC>


"Command line
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

"Apply Marco with Q, qq to record, q to stop, Q to apply
nnoremap Q @q

"Formatting, editing
noremap <C-f> maggvG=jj`a

" make Y to copy to the ned
noremap Y y$ 
noremap <leader>p viw"0p 
noremap <leader>py "0p 



"Insert new Line
map <leader><CR> o<ESC>

"Move to begining of the line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

"jump to end of block"
nnoremap <c-1> %
vnoremap <c-1> %

"Search and replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>


"Quit/save/reload files
cnoremap ql q!<CR>
cnoremap jk <esc><esc>
noremap zz :q<CR>
noremap <leader><space> :w<CR>
noremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>ec :edit <C-R>=get(split(globpath(&runtimepath, 'colors/' . g:colors_name . '.vim'), "\n"), 0, '')<CR><CR>
noremap <leader>sv :source $MYVIMRC<cr>

"Scrolling
noremap <C-e> 5<C-e>
noremap <C-y> 5<C-y>
noremap <C-j> L10j
noremap <C-k> H10k
vnoremap <C-j> L10j
vnoremap <C-k> H10k

"Move line down/up
nnoremap <leader>ej :m .+1<CR>==
nnoremap <leader>ek :m .-2<CR>==
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi

"For jump to where marks are instead of line
nnoremap ' `


"Productivity
inoremap <BS> <nop>

"Move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


"ALE next/previous error
noremap <silent> <leader>en :ALENext<cr>
noremap <silent> <leader>ep :ALEPrevious<cr>


"Turn off hilight search result
noremap <leader>h :set hlsearch! hlsearch?<CR>
nmap * <Plug>AgActionWord

"Search / browse files
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>al :Align
vnoremap <leader>al :Align



"================ CtrlP Settings ===================
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


"================= The Silver Searcher ======================
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"================ Plugin ag.vim configuration ====================
let g:ale_sign_error = '*' 
nnoremap <leader>a :Ag 



"================ Plugin Settings ====================
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0
let g:user_emmet_mode='a'
let g:user_emmet_leader_key = '<tab>'
let g:user_emmet_expandabbr_key='<tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}


"Snippets
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"

" Java Syntastic Check
let g:syntastic_java_checkers = []

" Airline Theme 
let g:airline_theme='wombat'

" YouCompeleteMe menu style
hi Pmenu ctermfg=0 ctermbg=255 cterm=NONE guifg=NONE guibg=#eeeeee gui=NONE
hi PmenuSel ctermfg=0 ctermbg=120 cterm=NONE guifg=NONE guibg=#87ff87 gui=NONE
hi Visual guibg=#AAAAAA


"================ Change Cursor Shape In Different Mode ====================
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"====== Fix Delay When Typing In Insert Mode===========
if !has('gui_running')
    set ttimeoutlen=80
    "ttimeoutlen is fo keycode delay
    augroup FastEscape
        autocmd!
        " timeoutlen is for mapping delay
        au InsertEnter * set timeoutlen=80
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"================ Javascript ========================
augroup jsSnippet
    autocmd FileType javascript noremap <leader>ic yiwOconsole.log('<esc>pi',<esc>pi);<esc>
    autocmd FileType javascript noremap <c-f> :call JsBeautify()<cr>
augroup End


"================ Auto Sourcing .vimcr ===============
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
    autocmd! bufwritepost .vimrc :! bash ./mvdotfiles.sh
endif


