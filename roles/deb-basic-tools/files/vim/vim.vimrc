" Sets line numbers
set number
 
" Adds indentation
filetype indent on
 
" Add filetype specific features
filetype plugin on
 
" Replaces Esc with jj
imap jj <esc>
cmap jj <c-c>
 
" Replacing :NERDTree
nmap mm :NERDTreeToggle<CR>
 
" View binary
nmap <c-b> :%!xxd
