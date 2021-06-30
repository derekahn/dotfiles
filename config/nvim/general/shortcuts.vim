""""""""""""""""""""
" => Buffers
""""""""""""""""""""
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


""""""""""""""""""""
" => JSON
""""""""""""""""""""
map <leader>" :call ConcealJsonToggle()<cr>
let g:toggle_json_conceal=0
" Toggle quotes for json file
function! ConcealJsonToggle()
  if g:toggle_json_conceal
    set conceallevel=2
    let g:toggle_json_conceal=0
  else
    set conceallevel=0
    let g:toggle_json_conceal=1
  endif
endfunction


""""""""""""""""""""
" => Kubernetes
""""""""""""""""""""
" k8s shortcut to validate yaml
:let g:asyncrun_open = 8
augroup kubernetes
  au!
  au FileType yaml nmap <leader>k8 :!kubeval '%'<cr>
augroup END


""""""""""""""""""""
" => Makefile
""""""""""""""""""""
" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


""""""""""""""""""""
" => NerdTree
""""""""""""""""""""
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('css', 44, 'none', '#1AD0CE', '#1AD0CE')
call NERDTreeHighlightFile('Dockerfile', '75', 'none', 'blue', 'blue')
call NERDTreeHighlightFile('gif', 36, 'none', '#15A274', '#15A274')
call NERDTreeHighlightFile('go', 'cyan', 'none', '#00ADD8', '#00ADD8')
call NERDTreeHighlightFile('html', 202, 'none', '#FC4709', '#FC4709')
call NERDTreeHighlightFile('jpg', 36, 'none', '#15A274', '#15A274')
call NERDTreeHighlightFile('js', 226, 'none', '#FFFF0D', '#FFFF0D')
call NERDTreeHighlightFile('json', 223, 'none', '#FECEA0', '#FECEA0')
call NERDTreeHighlightFile('Makefile', '15', 'none', 'white', 'white')
call NERDTreeHighlightFile('md', 208, 'none', '#FD720A', '#FD720A')
call NERDTreeHighlightFile('png', 36, 'none', '#15A274', '#15A274')
call NERDTreeHighlightFile('py', 'green', 'none', 'green', 'green')
call NERDTreeHighlightFile('rb', 197, 'none', '#E53378', '#E53378')
call NERDTreeHighlightFile('scss', 44, 'none', '#1AD0CE', '#1AD0CE')
call NERDTreeHighlightFile('svg', 178, 'none', '#CDA109', '#CDA109')
call NERDTreeHighlightFile('vim', 'green', 'none', 'green', 'green')
call NERDTreeHighlightFile('yaml', '85', 'none', 'pink', 'pink')
call NERDTreeHighlightFile('yml', '85', 'none', 'pink', 'pink')


""""""""""""""""""""
" => Notes
""""""""""""""""""""
" Quick open notes directory to notes folder
let g:notes_folder = '~/Code/notes/'
" Project specific notes
let g:notes = g:notes_folder . fnamemodify(getcwd(), ':t') . '.md'
let g:note_size = 15

" Open current project notes
map <leader>n :execute ':topleft split ' . g:notes<cr>:execute ':resize' . g:note_size<cr>

" Open daily notes
let g:daily_notes = g:notes_folder . 'daily-notes.org'
map <leader>nn :execute ':topleft split ' . g:daily_notes<cr>:execute ':resize' . g:note_size<cr>


""""""""""""""""""""
" => Spelling
""""""""""""""""""""
" Toggle and un-toggle spell checking
" next ]s
" prev [s
" add to dictionary zg
" find correct word z=
map <leader>sc :setlocal spell!<cr>


""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Strip trailing spaces on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Strip trailing spaces
function! <SID>StripTrailingWhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfun
