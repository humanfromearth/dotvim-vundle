" Vundle Setup
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nsf/gocode'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'wavded/vim-stylus'

" vim-snipmate deps
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'

" Color schemes
Plugin 'phd'

call vundle#end() " required
filetype plugin indent on " required

" Vundle End

syntax on
filetype on
filetype plugin on
filetype indent on
set enc=utf-8 " default to UTF-8 encoding
set backspace=indent,eol,start " Fix backspace in vim7.3
set incsearch " incremental search
set nonumber " show line numbers
set ruler "show status bar
set wildmode=longest,list " sane (bash-like) autocompletion of filenames
set noswapfile
set iskeyword=@,48-57,_,-,192-255
set virtualedit=all " put the cursor on places that have no chars in all modes

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set bg=dark

"
" F* Keys mappings
"
" disable F1
map <F1> <Nop>
imap <F1> <Nop>

" NerdTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.egg-info$']

" Show/Hide line numbers
nnoremap <F4> :set number!<CR>

" Toggle spell checking on and off with `,s`
nmap <F7> :set spell!<CR>

" Fuzzy finder
map <F8> :FufFile<CR>

" Strip trailling whitespaces
map <F9> :StripTrailingWhitespace()<CR>

" Disable audio bell
set visualbell t_vb=

" Set region to US English
set spelllang=en_us

" Set a colorcoloumn
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Set colorcolumn to lightgrey
hi ColorColumn ctermbg=darkgrey guibg=#363636

" Show » for tab characters and · for space trails
" set list listchars=tab:»·,trail:·
hi TrailingWhitespace ctermbg=darkgrey
hi TrailingTab ctermbg=darkblue
au BufEnter,BufCreate,WinEnter * call matchadd('TrailingWhitespace', ' \+$', -1)
au BufEnter,BufCreate,WinEnter * call matchadd('TrailingTab', '\t', -1)

augroup filetypedetect
au BufNewFile,BufRead *.zpt setfiletype html " Zope template files are treated like HTML
au BufNewFile,BufRead *.pt setfiletype html " Zope template files are treated like HTML
au BufNewFile,BufRead *.zcml setfiletype xml " ZCML files are treated like XML
au BufNewFile,BufRead *.mkd setfiletype mkd
au BufNewFile,BufRead *.markdown setfiletype mkd
augroup END

au BufEnter *.\(html\|pt\|zpt\|cpt\|mako\|css\|tmpl\|scss\) setl softtabstop=2 shiftwidth=2

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" miniBufExpl
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" Swith buffers in MRU fashion
noremap <C-TAB>   :MBEbf<CR>
noremap <C-S-TAB> :MBEbb<CR>

" Map keys for end/home stuff
map 4 $
map 6 ^

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*DS_Store,*.xml     " MacOSX/Linux"

" Fix numpad keys
set t_Co=8
set t_Sb=^[4%dm
set t_Sf=^[3%dm
:imap <Esc>Oq 1
:imap <Esc>Or 2
:imap <Esc>Os 3
:imap <Esc>Ot 4
:imap <Esc>Ou 5
:imap <Esc>Ov 6
:imap <Esc>Ow 7
:imap <Esc>Ox 8
:imap <Esc>Oy 9
:imap <Esc>Op 0
:imap <Esc>On .
:imap <Esc>OQ /
:imap <Esc>OR *
:imap <Esc>Ol +
:imap <Esc>OS -

" Golang stuff
au BufWritePost *.go Fmt
