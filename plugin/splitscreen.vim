" splitscreen.vim - Tmux-like bindings for managing windows and tabs.
" URL:      https://github.com/mattduck/splitscreen
nnoremap <C-w>c :tabnew<CR>
nnoremap <C-w>n :tabnext<CR>
nnoremap <C-w>p :tabprevious<CR>
nnoremap <C-w>! :tabedit %<CR>
nnoremap <C-w>X :tabclose

nnoremap <C-w>% :vsplit<CR>
nnoremap <C-w>" :split<CR>
nnoremap <C-w>x :q!
nnoremap <C-w>z :only<CR>
nnoremap <C-w><C-h> <C-w><
nnoremap <C-w><C-j> <C-w>-
nnoremap <C-w><C-k> <C-w>+
nnoremap <C-w><C-l> <C-w>>
nnoremap <C-w><Space> <C-w>=

nnoremap <C-w>1 1gt
nnoremap <C-w>2 2gt
nnoremap <C-w>3 3gt
nnoremap <C-w>4 4gt
nnoremap <C-w>5 5gt
nnoremap <C-w>6 6gt
nnoremap <C-w>7 7gt
nnoremap <C-w>8 8gt
nnoremap <C-w>9 9gt
