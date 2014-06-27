" set guifont=Droid\ Sans\ Mono\ 12
" set guifont=DejaVuSansMono:h15
set guifont=Inconsolata:h19

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  " hide the left hand vertical scrollbar
set guioptions-=L

colorscheme phd

nnoremap <C-s> :update<CR>
cnoremap <C-s> <Esc>:update<CR>
inoremap <C-s> <Esc>:update<CR>a

"Set colorcolumn to lightgrey
hi ColorColumn ctermbg=darkgrey guibg=#363636
hi OverLength ctermbg=darkred guibg=#000043
match OverLength /\%>80v.\+/
