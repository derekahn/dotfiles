" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""
" Editor UI
""""""""""""""""""""""""""""""
" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Automatically truncate sections
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 100,
  \ 'x': 100,
  \ 'y': 105,
  \ 'z': 50,
  \ 'warning': 50,
  \ }

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons', { 'commit': 'cbaba2f' }
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsOS = 'Darwin'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'joshdick/onedark.vim'
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1 " I love italic for comments

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.js.map$', '\.DS_Store$']
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-e> :NERDTreeToggle<CR>

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239


""""""""""""""""""""""""""""""
" Editor Git
""""""""""""""""""""""""""""""
" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
map <leader>gg :GitGutterToggle<CR>
set diffopt+=vertical

" Update sign column every quarter second
set updatetime=250

" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)


""""""""""""""""""""""""""""""
" Editor Utils
""""""""""""""""""""""""""""""
" Asynchronous Lint Engine
Plug 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
\   ],
\}

let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" let g:ale_open_list = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1

" navigate between errors quickly
nmap <silent> <C-S-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-S-j> <Plug>(ale_next_wrap)

" Show errors or warnings in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

set statusline=%{LinterStatus()}



" Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Search for terms using the excellent Dash.app
Plug 'rizzatti/dash.vim'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  " autocmd FileType go setlocal omnifunc=go#complete#Complete
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:tern_request_timeout = 1
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 0

let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
" Automatically close preview window after autocompletion
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

" fzf  vim (Fuzzy file, buffer finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '40%' }
" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Search project files, respecting git ignore
nnoremap <silent> <C-p> :FZF<CR>
" Search all files, e.g. node_modules/
nnoremap <silent> <leader>af :call fzf#vim#files('',
      \ {'source': 'ag --hidden --ignore .git -f -g "" -u', 'down': '40%'})<CR>

" Map Rg for quick word search
map <leader>f :Rg<CR>

" Integrating with spell checking
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('FzfSpellSink'), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" vim-abolish text case coercion
" [crs] some_long_identifier
" [crm] SomeLongIdentifier
" [crc] someLongIdentifier
" [cru] SOME_LONG_IDENTIFIER
" [cr-] some-long-identifier
" [cr.] some.long.identifier
" [cr ] some long identifier
" [crt] Some Long Identifier
Plug 'tpope/vim-abolish'

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<C-Space>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" Zoom in/out of windows
Plug 'troydm/zoomwintab.vim'
nnoremap <silent> <leader>z :ZoomWinTabToggle<cr>


""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""
" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

let g:go_metalinter_command='gopls'
let g:go_gopls_staticcheck = 1
let g:go_metalinter_deadline = '20s'

let g:go_addtags_transform = 'camelcase'
let g:go_autodetect_gopath = 1
let g:go_list_type = 'quickfix'

let g:go_auto_sameids = 1
let g:go_doc_popup_window = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 1
let g:go_highlight_structs = 0
let g:go_highlight_types = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Shortcuts to navigate between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Alternate commands
au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

" indentation lines
set list lcs=tab:\|\
au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>g  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'


""""""""""""""""""""""""""""""
" Frontend Plugins
""""""""""""""""""""""""""""""
" Preview colors in source code
" Plug 'ap/vim-css-color'

" EditorConfig plugin for Vim http://editorconfig.org
" Plug 'editorconfig/editorconfig-vim'

" Emmet for vim
" Plug 'mattn/emmet-vim'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'
"
" React JSX syntax highlighting and indenting for vim.
" Plug 'mxw/vim-jsx'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"
" Syntax for styled-components
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Initialize plugin system
call plug#end()
