set encoding=utf8
scriptencoding utf-8

" Map Leader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" ============================================================================ "
" ===                            LOAD PLUGINS                              === "
" ============================================================================ "
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/configs.vim

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
" Exit insert mode with `jk`
inoremap jj <ESC>

" Fast saving
nmap <leader>w :w!<cr>

" Map movement to homerow
map H ^
map L $

" Copy/Paste to clipboard
map <leader>cc "+y
map <leader>vv "+p

" Indent/Unindent
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv

" Remap VIM 0 to first non-blank character
map 0 ^

" Trim WhiteSpace
nnoremap <Leader>tws :%s/\s\+$//e<CR>

" Move a line of text using ALT+[jk]
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z

" Insert mode movements
imap II <Esc>I
imap AA <Esc>A
imap KK <Esc>O
imap JJ <Esc>o


if has('mac') || has('macunix')
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Resizing Panes
map <silent> ¬ :vertical resize -2<CR>
map <silent> ˙ :vertical resize +2<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Set Syntax
map <leader>sy :set syntax=

" Quick quit
map <leader>qq :q<cr>

" Quick file reload
map <leader>r :e<cr>

" Quick Open Notes
" Directory to notes folder
let g:notes_folder = '~/Projects/notes/'
" Project specific notes
let g:notes = g:notes_folder . fnamemodify(getcwd(), ':t') . '.md'
let g:note_size = 15
" Open current project notes
map <leader>n :execute ':topleft split ' . g:notes<cr>:execute ':resize' . g:note_size<cr>
" Open daily notes
let g:daily_notes = g:notes_folder . 'daily-notes.org'
map <leader>nn :execute ':topleft split ' . g:daily_notes<cr>:execute ':resize' . g:note_size<cr>

" Toggle quotes for json file
map <leader>" :call ConcealJsonToggle()<cr>
let g:toggle_json_conceal=0

" List contents of all registers
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Paste in visual mode without updating default register
vnoremap p "_c<Esc>p

" Delete selected words without updating default register
vnoremap <leader>d "_d

" Quick macro invocation with q register
nnoremap Q @q

" Switch between the last two files
nnoremap <leader><leader> <C-^>

"""""""""""""""""""""""""""""""""""""""
" => TEXT, TAB, AND INDENT RELATED
"""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Number of spaces to use for indent and unindent
set shiftwidth=2
" Visible width of tabs
set tabstop=2

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Strip trailing spaces on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""""""""""""""""""""""""""""
" => VISUAL MODE RELATED
""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>



""""""""""""""""""""""
" => MOVING AROUND
""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

if has('nvim')
  " Hack to get <C-h> working in neovim
  nnoremap <BS> <C-W>h

  " Exit terminal input mode
  tnoremap <Esc> <C-\><C-n>
  " Easy navigation from terminal
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Close the current buffer
map <leader>bb :Bclose<cr>
map <leader>be :Buffers<cr>
map <leader>bl :BLines<cr>
map <leader>h :History<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"Close all buffers
map <leader>bc :%bd<cr>

"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

" Fast editing of vimrc
"map <leader>e :e! ~/.vimrc<cr>
" map <leader>e :e! ~/.dotfiles/vim/vim.symlink/snippets/go.snippets<cr>
map <leader>e :e! ~/projects/notes/vim-go-cheatsheet.md<cr>


" ============================================================================ "
" ===                           BASIC SETTINGS                             === "
" ============================================================================ "

" HMR ability
set backupcopy=yes

" Show current line number
set number

" Show relative line numbers
set relativenumber

" Highlight cursor current line
set cursorline

" Set how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

""""""""""""""""""""""""""""""""
" => FILES, BACKUPS, AND UNDO
""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Turn on presistent undo
" means that you can undo even when you close a buffer/Vim
try
  set undodir=~/.vim/temp_dirs/undodir
  set undofile
catch
endtry

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
" Enable syntax highlighting
syntax enable

set background=dark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has('nvim'))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has('termguicolors'))
    set termguicolors
  endif
endif

" Theme, Colorscheme, & Font
if has('gui_running')
  " colorscheme PaperColor
  colorscheme onedark

  set guifont=Monaco:h14
  set linespace=2
  set noantialias
else
  try
    " colorscheme PaperColor
    colorscheme onedark
  catch
  endtry
endif

" Set extra options when running in GUI mode
if has('gui_running')
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" fzf is a general-purpose command-line fuzzy finder.
set runtimepath+=/usr/local/opt/fzf

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Provides tab-completion for all file-related tasks
set path+=**

" Turn on the WiLd menu
set wildmenu
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32')
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set highlight cursor line
hi CursorLine cterm=none ctermbg=8 ctermfg=none

" Style verticle split seporator
hi VertSplit cterm=none ctermbg=none ctermfg=23

" Change selected text bg color
hi Visual cterm=none ctermbg=11 ctermfg=none

" Set folded highlight color
hi Folded ctermbg=10


"""""""""""""""""""
" => STATUS LINE
"""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Hide tabline
set showtabline=0

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('html', 202, 'none', '#FC4709', '#FC4709')
call NERDTreeHighlightFile('hbs', 202, 'none', '#FC4709', '#FC4709')
call NERDTreeHighlightFile('jade', 149, 'none', '#A0D24D', '#A0D24D')
call NERDTreeHighlightFile('json', 223, 'none', '#FECEA0', '#FECEA0')
call NERDTreeHighlightFile('scss', 44, 'none', '#1AD0CE', '#1AD0CE')
call NERDTreeHighlightFile('css', 44, 'none', '#1AD0CE', '#1AD0CE')
call NERDTreeHighlightFile('js', 226, 'none', '#FFFF0D', '#FFFF0D')
call NERDTreeHighlightFile('rb', 197, 'none', '#E53378', '#E53378')
call NERDTreeHighlightFile('md', 208, 'none', '#FD720A', '#FD720A')
call NERDTreeHighlightFile('php', 140, 'none', '#9E6FCD', '#9E6FCD')
call NERDTreeHighlightFile('svg', 178, 'none', '#CDA109', '#CDA109')
call NERDTreeHighlightFile('gif', 36, 'none', '#15A274', '#15A274')
call NERDTreeHighlightFile('jpg', 36, 'none', '#15A274', '#15A274')
call NERDTreeHighlightFile('png', 36, 'none', '#15A274', '#15A274')

" indentation lines for golang
set list lcs=tab:\|\

"""""""""""""""""""""""""
" => SPELLING CHECK
"""""""""""""""""""""""""

" Toggle and untoggle spell checking
map <leader>sc :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

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


" Strip trailing spaces
function! <SID>StripTrailingWhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfun


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


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTOMATICALLY RECOGNIZE FILETYPES BY EXTENSION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile .{babel,eslint,stylelint}rc set filetype=json

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
