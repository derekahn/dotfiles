" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" I hate escape more than anything else
inoremap jj <Esc>
" Fast saving
nmap <leader>w :w!<cr>
" Quick quit
map <leader>qq :q<cr>
" Quick file reload
map <leader>r :e<cr>

" Copy/Paste to clipboard
map <leader>cc "+y
map <leader>vv "+p
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Set Syntax
map <leader>sy :set syntax=

" Map movement to homerow
map H ^
map L $

" Resizing Panes
map <silent> ¬ :vertical resize -2<CR>
map <silent> ˙ :vertical resize +2<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Close the current buffer
nnoremap <leader>bb :Bclose<cr>
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr('%')
  let l:alternateBufNum = bufnr('#')

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr('%') == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute('bdelete! '.l:currentBufNum)
  endif
endfunction

" Buffer explorer
nnoremap <leader>be :Buffers<cr>
" List buffer lines
nnoremap <leader>bl :BLines<cr>
" List buffer history
nnoremap <leader>h :History<cr>
"Close all buffers
nnoremap <leader>bc :%bd<cr>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Indent/Unindent
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" List contents of all registers
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Paste in visual mode without updating default register
vnoremap p "_c<Esc>p

" Quick macro invocation with q register
nnoremap Q @q

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Move a line of text using ALT+[jk]
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z
