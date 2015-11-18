" Sets line numbers
set number
 
" Adds indentation
filetype indent off
 
" Add filetype specific features
filetype plugin on
 
" Replaces Esc with jj
imap jj <esc>
cmap jj <c-c>
 
" Replacing :NERDTree
nmap mm :NERDTreeToggle<CR>
 
" View binary
nmap <c-b> :%!xxd

" Make search case in-sensitive, use \C<search> for case sensitivity
set ignorecase
