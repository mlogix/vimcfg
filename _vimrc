"------------------------------------------------------------
"
" Vim configure file.
"
" Maintainer: Chun-Ping Chang (mrmoneyc) <moneyc.net -AT- gmail.com>
"
" Last modified: 2016-07-03 01:28:36
"
"------------------------------------------------------------

"------------------------------
" General abbreviates
"------------------------------
" Map abbr itoday to datetime e.g. 2010-06-24 04:20:00
iab itoday <C-r>=strftime("%Y-%m-%d %H:%M:%S")

" Map abbr imyinfo to your personal info. (need setting)
iab imyinfo Chun-Ping Chang (mrmoneyc) <moneyc.net -AT- gmail.com>

"------------------------------
" dein
" NeoBundle alternative, to support more feature
"------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim
endif

" Required:
call dein#begin(expand('$HOME/.vim/bundle'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')


"------------------------------
" Add or remove your plugins here
"------------------------------

" Colorscheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('chriskempson/base16-vim')
call dein#add('goatslacker/mango.vim')
call dein#add('marcus/vim-mustang')
call dein#add('nanotech/jellybeans.vim')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('noahfrederick/vim-hemisu')
"call dein#add('flazz/vim-colorschemes')

" UI
call dein#add('Shougo/vimshell')
" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('Shougo/unite.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('sjl/gundo.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('mhinz/vim-startify')
call dein#add('scrooloose/syntastic')

" Syntax
"call dein#add('skammer/vim-css-color')
call dein#add('lilydjwg/colorizer')
call dein#add('ctags.vim')
call dein#add('majutsushi/tagbar')
call dein#add('rafaelfranca/rtf_pygmentize')

" Auto completion
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoinclude.vim')
call dein#add('craigemery/vim-autotag')

" For Golang Development
call dein#add('fatih/vim-go')
call dein#add('nsf/gocode', {'rtp': 'vim'})

" For PHP Development
call dein#add('StanAngeloff/php.vim')
call dein#add('etaoins/vim-volt-syntax')
" call dein#add('2072/php-indenting-for-vim')
call dein#add('manic/vim-php-indent')
" call dein#add('stephpy/vim-php-cs-fixer')
" call dein#add('m2mdas/phpcomplete-extended')
" call dein#add('m2mdas/phpcomplete-extended-symfony')
" call dein#add('m2mdas/phpcomplete-extended-laravel')
call dein#add('mkusher/padawan.vim')
call dein#add('vim-php/vim-phpunit')
call dein#add('vim-php/vim-composer')
call dein#add('joonty/vim-phpqa.git')
call dein#add('vim-php/tagbar-phpctags.vim')

" For JavaScript Development
call dein#add('Shutnik/jshint2.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('isRuslan/vim-es6')

" For Web Development
call dein#add('othree/html5.vim')

" Editing
call dein#add('mattn/emmet-vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('scrooloose/nerdcommenter')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('matchit.zip')
"call dein#add('Raimondi/delimitMate')
" call dein#add('LargeFile')

" File management
call dein#add('joonty/vim-sauce.git')
call dein#add('sudo.vim')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('yegappan/mru')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')

" Utilities
call dein#add('vimwiki/vimwiki')
call dein#add('calendar.vim')
call dein#add('joonty/vdebug')
call dein#add('mattn/webapi-vim')
call dein#add('christoomey/vim-quicklink')
" call dein#add('mileszs/ack.vim')
call dein#add('rking/ag.vim')
" call dein#add('eshion/vim-sync/')
call dein#add('mattn/vim-particle')

" External Utilities
call dein#add('rizzatti/funcoo.vim')
call dein#add('rizzatti/dash.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"------------------------------

call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Clean disable plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")

"------------------------------
" General
"------------------------------
let changelog_username = 'Chun-Ping Chang (mrmoneyc) <moneyc.net -AT- gmail.com>'

" Pick up the local .vimrc file
set exrc

" All custom macros start with ,
let maplocalleader=','

" Enable syntax hightlight
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" Show briefly matching bracket when closing it.
set showmatch

" Disable sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Don't make backups
set nobackup

" Modelines is 3 hight
"set modelines 3

" Set swap file directory, you can place this directory to ramdisk and link it
set dir=$HOME/.vim/vimswap

" Always read last position.
au BufReadPost * if line("'\"") > 0|if line("'\"")
\ <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Remove trailing whitespace when writing a buffer, but not for diff files. From: Vigil
fun! RemoveTrailingWhitespace()
  if &ft != 'diff'
    let b:curcol = col('.')
    let b:curline = line('.')
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
  endif
endfun
au BufWritePre * call RemoveTrailingWhitespace()

" Display underline on the line under cursor
set cursorline

" Display vertical line with cursor
"set cursorcolumn

" Display underline in NORMAL mode, hide in INSERT mode
au InsertEnter * set nocul
au InsertLeave * set cul

" Minimal number of lines to scroll when the cursor gets off the screen (default: 1)
set scrolljump=1

"Minimal number of screen lines to keep above and below the cursor (default: 0)
set scrolloff=3

"Incremental search
set incsearch

" Key binding: Ctrl+Z - use shell, type exit return to Vim
map <C-Z> :shell<CR>

" Key binding: ; - Fast switch command mode, use ; insted :
nnoremap ; :

" Key binding: ,reload - reload .vimrc
nmap <localleader>reload :source $HOME/.vimrc<CR>

" Platform detect
if has('mac') || has('gui_mac')
 let $PATH = $PATH . ':' . expand('/opt/local/bin') . ':' . expand('~/.composer/vendor')
endif

" Make a buffer modifiable
" set modifiable

"--------------------------------------------------
" fun! MyPlatform()
"   if has('unix')
"     let s:uname = system('uname')
"     if s:uname == 'Darwin'
"       return 'mac'
"     elseif s:uname == 'Linux'
"       return 'linux'
"     endif
"   else
"     return 'windows'
"   endif
" endfun
"--------------------------------------------------


"------------------------------
" Edit setting
"------------------------------
" Make backspace work like most other apps
set backspace=2
set backspace=indent,eol,start

" Tab shift width
set expandtab
set smarttab
set shiftwidth=2

" Key binding: ,t2 - Set shift width = 2
nmap <localleader>t2 :set shiftwidth=2<CR>

" Key binding: ,t4 - Set shift width = 4
nmap <localleader>t4 :set shiftwidth=4<CR>

" Filetype setting
filetype on
filetype plugin on
filetype indent on

" Auto set shift width by filetype
au FileType html,python,perl,vim,javascript,css
  \ set shiftwidth=2 |
  \ set tabstop=2 |
  \ set softtabstop=2
au FileType c,php,java,sh
  \ set shiftwidth=4 |
  \ set tabstop=4 |
  \ set softtabstop=4
au FileType go
  \ set shiftwidth=8 |
  \ set tabstop=8 |
  \ set softtabstop=8

" Word wrap without line breaks
set wrap
set linebreak
"set textwidth=500
"set textwidth=90
"set cc=+1
"set cc=+1,+2,+3,+4,+5,+6
"set wrapmargin=0
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 guifg=white
"match OverLength /\%90v.\+/

" Smart indent when entering insert mode with i on empty lines
fun! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Delete a name of a php variable without dollar sign
" http://stackoverflow.com/questions/32928881/vim-syntax-delete-a-name-of-a-php-variable-without-dollar-sign
augroup PHP
  autocmd!
  autocmd FileType php setlocal iskeyword-=$
augroup END

" PHP Syntax Override
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"------------------------------
" Function key binding (F1-F10)
"------------------------------
" Key binding: F2 - Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Key binding: F3 - Toggle Tagbar
nnoremap <F3> :TagbarToggle<CR>

" Key binding: F4 - Toggle SrxExpl
nmap <F4> :SrcExplToggle<CR>

" Key binding: F5 - key for toggle relative line number
nmap <F5> :set rnu!<BAR>set rnu?<CR>

" Key binding: F6 - Highlight trailing whitespace characters Vim Tip #1274
"set listchars=tab:->,trail:.
set listchars=tab:▸\ ,eol:¬
"set list
nmap <F6> :set list!<BAR>set list?<CR>

" Key binding: F7 - Highlight search things Enable/Disable
set hlsearch
nmap <F7> :set hls!<BAR>set hls?<CR>

" Key binding: F8 - Create Ctag of current project.
nmap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Key binding: Ctrl+F8 - Create Ctag of current folder.
nmap <C-F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f '%:p:h\\tags' '%:p:h'<CR>


"------------------------------
" Indent setting
"------------------------------
" Auto indent
set ai

" Smart indent
set si

" C-style indent
set cindent


"------------------------------
"  Using [TAB] and [SHIFT-TAB] to indent on Normal mode
"------------------------------
nmap <TAB> V>
nmap <S-TAB> V<
xmap <TAB> >gv
xmap <S-TAB> <gv


"------------------------------
" Folding
"------------------------------
" Folding method (syntax/marker/indent)
set foldmethod=marker

" Display folding status
set foldcolumn=1

" Max folding
set foldnestmax=3


"------------------------------
" File encoding
"------------------------------
" Set suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Set EOL formats
set fileformats=unix,mac,dos

" Default encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" Key binding: ,big5 - Convert file encoding to big5
nmap <localleader>big5 :set fileencoding=big5<CR>

" Key binding: ,utf8 - Convert file encoding to utf8
nmap <localleader>utf8 :set fileencoding=utf8<CR>

" Key binding: ,fd - Convert current file to dos format
nmap <localleader>fd :set ff=dos<CR>

" Key binding: ,fu - Convert current file to unix format
nmap <localleader>fu :set ff=unix<CR>


"------------------------------
"  UI Style
"------------------------------
" Set color env
if !has('gui_running')
  set t_Co=256
endif

" Set background (dark/light)
set background=dark

" ColorScheme
"colorscheme wombat256mod_mmc
"colorscheme solarized

" Display Vim mode
set showmode

" Turn on Wild menu
set wildmenu
set wildmode=list:longest,full

" Always show current position
set ruler

" Show line number
set nu

" Command bar height
set cmdheight=2

" Status bar
set laststatus=2
"set statusline=%4*%<\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%m " file format
"set statusline+=%4*%=\ %6*%y%4*\ POS:\ %3*%l%4*/%3*%L%4*\:%3*%c%4*\ \<%2*%P%4*\>
"highlight User1 ctermfg=red
"highlight User2 term=underline cterm=underline ctermfg=green
"highlight User3 term=underline cterm=underline ctermfg=yellow
"highlight User4 term=underline cterm=underline ctermfg=white
"highlight User5 ctermfg=cyan
"highlight User6 ctermfg=white

" Diff
if has('diff')
  hi DiffAdd ctermfg=Grey ctermbg=DarkBlue guifg=Grey
  hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
  hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black
  hi DiffText ctermfg=White ctermbg=DarkRed guifg=Black
endif


"------------------------------
" Moving and tabs
"------------------------------
" Map space to / and c-space to ?
" Key binding: Space as /, foward search
"nmap <SPACE> /

" Key binding: Shift+Space as ?, backward search
"nmap <S-SPACE> ?

" Smart way to move between windows
" Key binding: Ctrl+j - move to bottom window
map <C-j> <C-W>j
" Key binding: Ctrl+k - move to up window
map <C-k> <C-W>k
" Key binding: Ctrl+h - move to right window
map <C-h> <C-W>h
" Key binding: Ctrl+l - move to left window
map <C-l> <C-W>l


"------------------------------
" Tab key binding
"------------------------------
augroup Tabs
" Key binding: ,tc - New tab
  nmap <localleader>tc :tabnew<CR>
" Key binding: ,te - Open new tab and edit
  nmap <localleader>te :tabedit<SPACE>
" Key binding: ,tx - New tab and browser
  nmap <localleader>tx :tabedit .<CR>
" Key binding: ,tf - Jump to first tab
  nmap <localleader>tf :tabfirst<CR>
" Key binding: ,tl - Jump to last tab
  nmap <localleader>tl :tablast<CR>
" Key binding: ,tn - Jump to next tab
  nmap <localleader>tn :tabnext<CR>
" Key binding: ,tp - Jump to previous tab
  nmap <localleader>tp :tabprevious<CR>
" Key binding: ,tm - Move tab
  nmap <localleader>tm :tabmove<SPACE>
" Key binding: ,th - Open help in new tab
  nmap <localleader>th :tab help<CR>
augroup END

try
  set switchbuf=usetab
  set stal=2
catch
endtry


"------------------------------
" Search setting
"------------------------------
" From an idea by Michael Naumann
fun! VisualSearch(direction) range
  let l:saved_reg = @"
  execute 'normal! vgvy'
  let l:pattern = ESCape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, '\n$', '', '')
  if a:direction == 'b'
    execute 'normal ?' . l:pattern . '^M'
  else
    execute 'normal /' . l:pattern . '^M'
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfun

" Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"------------------------------
" Misc
"------------------------------
au BufReadPost * map K <ESC>
au BufReadPost *.pl   set keywordprg=perldoc\ -f
au BufReadPost *.vim  map K :exe ':help '.expand('<cword>')<CR>
au BufReadPost .vimrc map K :exe ':help '.expand('<cword>')<CR>

" Key binding: ,m - Remove the Windows ^M char
noremap <localleader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Super paste
inoremap <C-v> <ESC>:set paste<CR>mui<C-R>+<ESC>mv'uV'v=:set nopaste<CR>

" Key binding: ,, - Quick switch to normal mode
" noremap <LocalLeader>, <C-\><C-N>
" noremap! <LocalLeader>, <C-\><C-N>

" Fast modify in equation like (a=b)
" Key binding: cr= - modify right statment
" Key binding: cl= - modify left statment
if &ft == 'python'
  nmap cr= $F=lc$
else
  nmap cr= $F=lcf;
endif
nmap cl= $F=hc^

" Enable inserts links & anchors on a TOhtml export automatic.
" Notice:
" Syntax used is:
" Link
" Anchor
fun! SmartTOHtml()
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</' <a href='#\1' style='color: cyan'>\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</' \&nbsp;\&nbsp; <a href='#\2' style='color: cyan;'>\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</' <a name='\1' style='color: #fff'>\1<\/a></g
  catch
  endtry
  exe ':write!'
  exe ':bd'
endfun

" Dictionary
"set dictionary+=$HOME/.vim/after/ftplugin/pydiction/complete-dict


"------------------------------
" External Application
"------------------------------
" Key binding: ,hex - View file in hex mode
nmap <localleader>hex :%!xxd<CR>

" Key binding: ,rhex - Return view file to normal mode from hex mode
nmap <localleader>rhex :%!xxd -r<CR>

" Key binding: ,d - Search the word under cursor in devhelp
"nmap <localleader>d viwy:!devhelp -s <C-R>"<CR>

" Key binding: ,p - Search the word under cursor in pydoc
"nmap <localleader>p viwy:!pydoc <C-R>"<CR>


"------------------------------
"  Comment
"------------------------------
"highlight Comment ctermfg=gray


"------------------------------
" String replace keybinding
"------------------------------
fun! MyReplace()
  call inputsave()
  let g:OriPattern = input("Pattern: ")
  let g:NewPattern = input("Replace '" . g:OriPattern . "' to: ")
  call inputrestore()
  if strlen(g:OriPattern) > 0
    if strlen(g:NewPattern) > 0
      exe '%s/' . g:OriPattern . '/' . g:NewPattern . '/g'
    endif
  endif
  echo "skipped."
endfun

nmap <localleader>h :call MyReplace()<CR>
"nmap <C-h> :call MyReplace()<CR>


"------------------------------
" Save as Root
"------------------------------
cnoremap w!! w !sudo tee % >/dev/null


"------------------------------------------------------------
" Plugins
"------------------------------------------------------------
"------------------------------
"  Status bar: lightline
"------------------------------
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \   'ctrlpmark': 'CtrlPMark',
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

fun! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

fun! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⨂' : ''
endfunction

fun! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

fun! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⚑ '._ : ''
  endif
  return ''
endfunction

fun! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

fun! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

fun! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

fun! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

fun! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

fun! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

fun! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
	let g:lightline.fname = a:fname
	return lightline#statusline(0)
endfunction

augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp call s:syntastic()
	autocmd BufWritePost *.go call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"------------------------------
"  Syntastic
"------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=$HOME/dotenv/Vim/phpcs.xml"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'

"------------------------------
"  Ctrl-P
"------------------------------
" Change the default mapping and the default command to invoke CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" Working directory
" =================
" | 'c' - the directory of the current file.
" | 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" | 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" |  0 or '' (empty string) - disable this feature.
" =================
let g:ctrlp_working_path_mode = 'ra'

" Exclude files and directories
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  "\ }

" Use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" Disable caching
let g:ctrlp_use_caching = 1

"------------------------------
"  Auto completion: neocomplete, neosnippet.vim
"------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
fun! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^- \t]->\w*'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
" if has('conceal')
  " set conceallevel=2 concealcursor=i
" endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='$HOME/.vim/bundle/vim-snippets/snippets'

"------------------------------
" Tagbar
"------------------------------
" Set ctags path (essential on Mac OS X)
if has("mac") || has("gui_mac")
  let g:tagbar_ctags_bin = '/opt/local/bin/ctags'
  " sudo npm install -g git://github.com/ramitos/jsctags.git
  let g:tagbar_type_javascript = {'ctagsbin' : '/opt/local/bin/jsctags'}
else
  let g:tagbar_ctags_bin = '/usr/bin/ctags'
endif

" split to the right side of the screen
let g:tagbar_left = 0

" Tagbar window width
let g:tagbar_width = 35

" automatically close Tagbar when jump to a tag
let g:tagbar_autoclose = 0

" move the cursor to the Tagbar window when it is opened
let g:tagbar_autofocus = 1

" sort tag by name (set 0 sort by order)
let g:tagbar_sort = 0

" auto open closed fold when tag hilight
let g:tagbar_autoshowtag = 1

" remove extra information and blank lines from the taglist window.
let g:tagbar_compact = 1

let g:tagbar_foldlevel = 1
let g:tagbar_expand = 0

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

" The location of phpctags
let g:tagbar_phpctags_bin='$HOME/bin/phpctags'

" The amount of memory that phpctags can use
let g:tagbar_phpctags_memory_limit = '512M'

"------------------------------
" Ctags <From:Fourdallars>
"
" Must recompile ctags by tarball on Mac OS X
"------------------------------
" Set ctags path (essential on Mac OS X)
if has("mac") || has("gui_mac")
  let g:ctags_path = '/opt/local/bin/ctags'
else
  let g:ctags_path = '/usr/bin/ctags'
endif

" Set tags save path
set tags=./tags,./TAGS,tags,TAGS,$HOME/.tags

" Key binding: g+ - View in new tab
nmap g+ viwy:tab ts <C-R>"<CR>
" Key binding: g- - View in new tab
nmap g- viwy:pts <C-R>"<CR>
" Key binding: g= - View in new stack
nmap g= viwy:sts <C-R>"<CR>
" Key binding: g+ - View in new tab
nmap g<BAR> viwy:vsplit<CR>:ts <C-R>"<CR>

"------------------------------
"  cscope setting
"------------------------------
if has("cscope")
  if has("mac") || has("gui_mac")
    set csprg='/opt/local/bin/cscope'
  else
    set csprg='/usr/bin/cscope'
  endif
  set csto=0
  set cst
  set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
  set csverb
  set cscopetag
  set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

"------------------------------
" vim-phpqa
"------------------------------
" Ruleset
" let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"

" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=$HOME/dotenv/Vim/phpcs.xml"

" PHP executable (default = "php")
"let g:phpqa_php_cmd='/path/to/php'

" PHP Code Sniffer binary (default = phpcs)
let g:phpqa_codesniffer_cmd='$HOME/.composer/vendor/bin/phpcs'

" PHP Mess Detector binary (default = phpmd)
"let g:phpqa_messdetector_cmd='/path/to/phpmd'

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 1

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0

" Stop the location list opening automatically
"let g:phpqa_open_loc = 0

" Clover code coverage XML file
"let g:phpqa_codecoverage_file = "/path/to/clover.xml"

" Show markers for lines that ARE covered by tests (default = 1)
"let g:phpqa_codecoverage_showcovered = 0

"------------------------------
" vim-phpunit
"------------------------------
" let g:phpunit_cmd = "/usr/bin/mytest"
" let g:phpunit_args = "--configuration /path/to/config"

"------------------------------
" phpcomplete-extended
"------------------------------
" let g:phpcomplete_index_composer_command = "composer"

"------------------------------
" Padawan.vim
"------------------------------
let g:padawan#composer_command = "$HOME/bin/composer"

" http request timeout
let g:padawan#timeout = 0.1

" If padawan not install global
" let g:padawan#cli = '/path/to/padawan.php/bin/padawan'
" let g:padawan#server_command = '/path/to/padawan.php/bin/padawan-server'

"------------------------------
" JSHint 2
"------------------------------
" Set global JSHint command path (mostly for Windows)
"let jshint2_command = ''

" Lint JavaScript files after reading it
let jshint2_read = 0

" Lint JavaScript files after saving it
let jshint2_save = 0

" Do not automatically close orphaned error lists
let jshint2_close = 0

" Skip lint confirmation for non JavaScript files
let jshint2_confirm = 0

" Do not use colored messages
let jshint2_color = 0

" Hide error codes in error list (if you don't use error ignoring or error codes confuses you)
let jshint2_error = 0

" Set default height of error list
let jshint2_height = 5

" jshint validation
nnoremap <localleader>jv :JSHint<CR>
"inoremap <silent><F1> <C-O>:JSHint<CR>
"v"noremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <localleader>jn :lnext<CR>
"inoremap <silent><F2> <C-O>:lnext<CR>
"vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <localleader>jb :lprevious<CR>
"inoremap <silent><F3> <C-O>:lprevious<CR>
"vnoremap <silent><F3> :lprevious<CR>

"------------------------------
" vim-javascript
"------------------------------
" Enables HTML/CSS syntax highlighting in your JavaScript file
let javascript_enable_domhtmlcss = 1

" Enables JavaScript code folding
let b:javascript_fold = 1

" Disables JSDoc syntax highlighting
let javascript_ignore_javaScriptdoc = 0

" Customize concealing characters
"let g:javascript_conceal_function   = "ƒ"
"let g:javascript_conceal_null       = "ø"
"let g:javascript_conceal_this       = "@"
"let g:javascript_conceal_return     = "⇚"
"let g:javascript_conceal_undefined  = "¿"
"let g:javascript_conceal_NaN        = "ℕ"
"let g:javascript_conceal_prototype  = "¶"

"------------------------------
" html5.vim
"------------------------------
" Disable event-handler attributes support
let g:html5_event_handler_attributes_complete = 1

" Disable RDFa attributes support
let g:html5_rdfa_attributes_complete = 1

" Disable microdata attributes support
let g:html5_microdata_attributes_complete = 1

" Disable WAI-ARIA attribute support
let g:html5_aria_attributes_complete = 1

"------------------------------
" vim-go
"------------------------------
" Key Mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Opens the target identifier in current buffer
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Show a list of interfaces which is implemented by the type under cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Disable opening browser after posting to your snippet to play.golang.org
let g:go_play_open_browser = 0

" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 1

" Enable goimports to automatically insert import paths instead of gofmt
" let g:go_fmt_command = "gofmt"
let g:go_fmt_command = "goimports"

" Auto fmt on save
let g:go_fmt_autosave = 1

" By default binaries are installed to $GOBIN or $GOPATH/bin. To change it
"let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path

" By default syntax-highlighting for Functions, Methods and Structs is
" disabled. To change it
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let g:go_list_type = "quickfix"

"------------------------------
" Vdebug
"------------------------------
let g:vdebug_keymap = {
\    "run" : "<Leader>/",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\}

"------------------------------
" Indent Guides
"------------------------------
if has("gui_macvim")
  let g:indent_guides_enable_on_vim_startup = 1
end
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
"au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"------------------------------
" Nerd Commenter
"------------------------------
let NERDSpaceDelims = 1

"------------------------------
" ack.vim / ag.vim
"------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif"

"------------------------------
" RTF Pygmentize
"------------------------------
" Valid options are: 'default', 'emacs', 'friendly' and 'colorful'
"let g:rtfp_theme = 'emacs'
"let g:rtfp_font = 'Menlo'

"Key binding: CMD+c - Copy colored source code to clipboard
"smap <D-c> :RTFPygmentize<CR>

"------------------------------
" Vimwiki
"------------------------------
let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path': '$HOME/.vim/vimwiki/', 'path_html': '$HOME/.vim/vimwiki/html/', 'html_header': '$HOME/.vim/vimwiki/template/header.tpl',}]
let g:vimwiki_list = [{'path': '$HOME/vimwiki/', 'path_html': '$HOME/vimwiki/html/'}]

noremap \h :VimwikiAll2HTML<CR>

"------------------------------
" Gundo
"------------------------------
nnoremap \u :GundoToggle<CR>
let g:gundo_width = 45
let g:gundo_preview_height = 15
let g:gundo_right = 0

"------------------------------
" MRU
"------------------------------
highlight link MRUFileName LineNr
" let MRU_File = '~/_vim_mru_files'
let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
" let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows
let MRU_Window_Height = 10
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1
let MRU_Add_Menu = 1
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 15
let MRU_Filename_Format={'formatter':'v:val', 'parser':'.*'}

"------------------------------
"  Colorizer
"------------------------------
" Key binding: assign :ColorToggle to ,ct
let g:colorizer_nomap = 1
noremap <localleader>ct :ColorToggle<CR>

"------------------------------
" ScrollColor
"------------------------------
" Key binding: ,cn - Scroll next colorscheme
nmap <localleader>cn :NEXTCOLOR<CR>

" Key binding: ,cp - Scroll previous colorscheme
nmap <localleader>cp :PREVCOLOR<CR>

"------------------------------
" vim-sauce
"------------------------------
let g:sauce_path = "$HOME/.vim/vimsauce"

"------------------------------
" nerdtree
"------------------------------
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------------------------------------------------------------
