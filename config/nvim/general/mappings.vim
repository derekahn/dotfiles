""""""""""""""""""""
" => All Day CMDs
""""""""""""""""""""
" I hate escape more than anything else
inoremap jj <Esc>

" Fast saving
nmap <leader>w :w!<cr>

" Quick quit
map <leader>qq :q<cr>

" Quick file reload
map <leader>r :e<cr>

" Set Syntax
map <leader>sy :set syntax=

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Paste in visual mode without updating default register
vnoremap p "_c<Esc>p

" Quick macro invocation with q register
nnoremap Q @q


""""""""""""""""""""
" => Buffers
""""""""""""""""""""
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>

" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Buffer explorer
nnoremap <leader>be :Buffers<cr>

" List buffer lines
nnoremap <leader>bl :BLines<cr>

" List buffer history
nnoremap <leader>h :History<cr>

"Close all buffers
nnoremap <leader>bc :%bd<cr>

" Switch between the last two files
nnoremap <leader><leader> <C-^>


""""""""""""""""""""
" => Clipboard
""""""""""""""""""""
" Copy/Paste to clipboard
map <leader>cc "+y
map <leader>vv "+p

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""
" => Movement
""""""""""""""""""""
" Resizing Panes
map <silent> ¬ :vertical resize -2<CR>
map <silent> ˙ :vertical resize +2<CR>

" Move a line of text using ALT+[jk]
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z

" Indent/Unindent
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv


""""""""""""""""""""
" => Navigation
""""""""""""""""""""
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Map movement to home row
map H ^
map L $

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


