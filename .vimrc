" Plugins ---------------------{{{

set nocompatible      
filetype off         
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"---------------------------------
"Plugin 'swekaj/php-foldexpr.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'vim-syntastic/syntastic'
Plugin 'keith/swift.vim'
Plugin 'posva/vim-vue'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'universal-ctags/ctags'
Plugin 'rking/ag.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/csv.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
"---------------------------------
call vundle#end()   

"}}}

" General Settings ------------------{{{
filetype plugin indent on   
set ignorecase
set smartcase
syntax enable
set backspace=indent,eol,start
let mapleader = ','
set nonumber
set noshowmode
set nowrap

" Makes italic work
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Tabs
set shiftwidth=4 expandtab softtabstop=4

" Split Management 
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Spellcheck! 
ab teh the

" Scroll settings
" Scroll offset. Unused because we are using VCenterCursor.
set scrolloff=100

noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" CtrlP
let g:ctrlp_buftag_types = { 'swift': '--language-force=swift' }

" Syntastic
let g:syntastic_quiet_messages = {"type": "style"}

" FZF
let g:fzf_layout = { 'down': '~40%' }

"}}}

" Visuals -----------------------{{{
colorscheme github 

set t_CO=256

set autowriteall
set foldcolumn=2
set foldnestmax=2

"}}}

" Search ----------------------{{{

set hlsearch
set incsearch

"}}}

" Mappings-------------------------------{{{

nnoremap <F12> :Autoformat<cr> 

" Time Mappings--------------{{{

nnoremap <Localleader>ts :put =strftime('%c')<cr>

" }}}

" General mappings-----------------------{{{

" Write
nnoremap rite :w<cr>

" Move to beginning of line & insert
" ib = insert beginning
nnoremap <Leader>ib ^i

" Emmet
noremap ee <esc>:Emmet<space>

" }}}

" Move lines around--------{{{
" Insert blank lines
nnoremap <silent>ak :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent>aj :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Move a line up or down (respectively)
nnoremap qk :m -2<cr>
nnoremap qj :m +1<cr>

"}}}

" Other-------------------{{{
" Save a session. Open a saved session using vim -S
nnoremap <Leader>ss :mksession<cr>:echo "Session saved! Open session with vim -S"<cr>
nnoremap <Leader>sss :mksession!<cr>:echo "Session overwritten & saved! Open session with vim -S"<cr>

" Easier escape from insert mode
inoremap jk <esc>

" Escape from insert & save
inoremap jkl <esc>:w<cr>

" Make it easy to edit the vimrc file. Opens in a new tab
nmap <Leader>ev :tabedit ~/.vim/.vimrc<cr>       

" Make a ".notes" file in whichever directory is the root directory
nmap <silent><Localleader>opn :sp .notes<cr>:res 11<cr>:set syntax=markdown<cr>

" Simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Directory tree
nnoremap <silent><Leader>1 :NERDTreeToggle<cr>
nnoremap <silent><Leader>nnf :NERDTreeFind<cr>

" Tagbar
nnoremap <c-E> :TagbarToggle<cr>

" Override CtrlP, use FZF instead
let g:ctrlp_map = ''
nnoremap <c-P> :FZF<cr>

" Recent files
nmap <c-R> :CtrlPMRUFiles<cr>

" Find tags
nmap <Leader>f :tag<space>

" Go to tag under cursor
nmap <Leader>ff :exec ":tag " . expand('<cword>')<cr>

" Tab previous & tab next
noremap <silent><Leader>q :tabp<cr>
noremap <silent><Leader>w :tabn<cr>

" Vertical Resize
noremap <Leader>vr :vertical res<space> 

"}}}

" PHP Mappings---------------{{{

" Move to end of parameter declaration of function, insert mode 
" Will work with more than just PHP
" :A:dd :T:o :FU:nction
nnoremap <Leader>atfu ?function\s\+[a-zA-Z0-9_]\+([^)]*)?e<cr>:nohlsearch<cr>i


" Plugins Settings --------------{{{

" CtrlP--------------------------{{{
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
"}}}

" NERDTree-----------------------{{{
let NERDTreeHijackNetrw = 0
"}}}

" php-cs-fixer-------------------{{{
let g:php_cs_fixer_rules = "@PSR2,blank_line_before_return,single_blank_line_before_namespace" 
nnoremap <silent><Leader>fix :w<cr>:call PhpCsFixerFixFile()<cr>
"}}}

" php documentor-----------------{{{
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>
"}}}

" ultisnips----------------------{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" airline------------------------{{{
set laststatus=2
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

" Sourcing .vimrc causes some issues with airline colors, which this resolves
if exists(":AirlineRefresh")
    AirlineRefresh
endif
"}}}

" colby's phpunit helper mappings---------{{{
nmap <Leader>p :w<cr>:!clear && php vendor/bin/phpunit --colors=always
nmap <Leader>pf :w<cr>:!clear && php vendor/bin/phpunit --colors=always --filter :<cword>
" Place cursor over current unit test function name (if it is a unit test)
noremap <Leader>a ?\/\*\* @test \*\/[\s\n]\+.\+function\s\+[a-zA-Z_]?e

" Run search to place cursor over function name & then call phpunit
" Uses the above mapping to get it done
let @p=",a\<cr>, ,pf"

function! RunPhpUnitTest()
    " Step 1: Check if we are on the function declaration line. If we are, try
    " running this function

    " Step 2: If we are not on the function declaration line, start from
    " current position & search backwords for function declaration.
endfunction

"}}}

"}}}
"}}}

" PHP namespace---------------------------{{{
function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
        call PhpExpandClass()
        call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
"}}}

" csv.vim---------------------------------{{{
hi CSVColumnEven ctermfg=0 ctermbg=255
hi CSVColumnOdd ctermfg=1 ctermbg=255

nnoremap <Localleader>ch :Header<cr>

"-- Custom code for using csv.vim:
" Tabularize from current postion + this many lines
let g:csvgrablines=5

" Used for holding lines to output tabbed later on
let s:lines = ""

" Grab a certain amount of lines & put in a buffer to tabulariz
function! CGTabularize()
    " Get header line
    call CGAddFirstLineToRegister()

    " Now we are going to grab the lines we want to tabularize
    " This gets the line number
    let currentline = line(".")
    
    echo currentline
    let i = 0

    while i < g:csvgrablines
        let getthisline = i+currentline
        let @f .= getline(getthisline)
        let @f .= "\n"

        let i += 1
    endwhile

    call CGOutputRegister()
endfunc

function! CGAddFirstLineToRegister()
    let @f = getline(1) . "\n"
endfunc

function! CGOutputRegister()
    new  
    put! f
    setfiletype csv

    " csv.vim will open the tabularized data in another buffer, so we get
    " the buffer number so we can delete it
    let tmpbuffer = bufnr('%')

    " Delete the last line and move back to the top
    normal! Gddgg

    " The magic
    CSVTabularize

    " now delete that buffer like we talked about
    exec tmpbuffer . "bd!" 
endfunc

function! CGResetLines()
    let s:lines = ""
    echo "Lines reset"
endfunc 

function! CGAddLine()
    let s:lines .= getline(".") . "\n"
    echo "Line added" 
endfunc

function! CGOutputTabbed()
    call CGAddFirstLineToRegister()

    let @f .= s:lines

    call CGOutputRegister()
endfunc


" Call tabularize
noremap <Localleader>q  :call CGTabularize()<cr>

" Reset lines
noremap <Localleader>cr :call CGResetLines()<cr> 

" Add a line
noremap <Localleader>ca :call CGAddLine()<cr>

" Output!
noremap <Localleader>cc :call CGOutputTabbed()<cr>

"}}} }}}

" Helpers ----------------{{{

fun! VerticalResize (width)
    exec ":vertical res " a:width
endfunc
command! -count Vr call VerticalResize('<count>')

"}}}

" Auto-Commands -----------------{{{

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup end

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal foldmethod=expr
    autocmd FileType php setlocal foldexpr=PhpFolds()
    autocmd FileType php setlocal foldtext=PhpFoldText()
augroup end

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal foldmethod=marker
augroup end


"}}}

" Stine -------------------------{{{

" Open Price Export
" Will only work when in the root of the Stine project 
nnoremap <Localleader>ope :tabnew html/updates/data/price_export.csv<cr> 

"}}}

" Command line----------------{{{ 

" RUn PYthon
" Saves & then runs the current file
nnoremap rupy :w<cr>:exec "!clear && python " . @%<cr>

" RUn PHp
" Saves & then runs the current file
nnoremap ruph :w<cr>:exec "!clear && php " . @%<cr>

"}}}
