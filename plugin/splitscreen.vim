" splitscreen.vim - Tmux-like bindings for managing windows and tabs.
" URL:      https://github.com/mattduck/splitscreen
nnoremap <C-w>c :tabnew<CR>
nnoremap <C-w>n :tabnext<CR>
nnoremap <C-w>p :tabprevious<CR>
nnoremap <C-w>! :tabedit %<CR>

nnoremap <C-w>% :vsplit<CR>
nnoremap <C-w>" :split<CR>
nnoremap <C-w>x :q!
nnoremap <C-w>z :only<CR>
nnoremap <C-w><C-h> <C-w><
nnoremap <C-w><C-j> <C-w>-
nnoremap <C-w><C-k> <C-w>+
nnoremap <C-w><C-l> <C-w>>
nnoremap <C-w><Space> <C-w>=

" vim tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-w>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-w>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-w>l :TmuxNavigateRight<CR>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<CR>
