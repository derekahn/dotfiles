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

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'joshdick/onedark.vim'

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'


""""""""""""""""""""""""""""""
" Editor Git
""""""""""""""""""""""""""""""

" From a very single vim buffer, you can perform main git operations in few key press.
Plug 'jreybert/vimagit'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'


""""""""""""""""""""""""""""""
" Editor Utils
""""""""""""""""""""""""""""""

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" BufExplorer quickly and easily switch between buffer
Plug 'jlanzarotta/bufexplorer'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" fzf  vim (Fuzzy file, buffer finder)
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Zoom in/out of windows
Plug 'troydm/zoomwintab.vim'

" Alignment for vim
" Plug 'junegunn/vim-easy-align'

" Preview colors in source code
" Plug 'ap/vim-css-color'

" Emmet for vim
" Plug 'mattn/emmet-vim'


""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""

" Vim syntax file & snippets for Docker's Dockerfile
" Plug 'ekalinin/Dockerfile.vim'

" Improved nginx vim plugin (incl. syntax highlighting)
" Plug 'chr4/nginx.vim'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'
"
" Javascript indentation and syntax support
" Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting & indenting
" Plug 'mxw/vim-jsx'

" vim-snipmate default snippets
" Plug 'honza/vim-snippets'

" Syntax for styled-components
" Plug 'styled-components/vim-styled-components'
"
" Vim syntax for TOML
" Plug 'cespare/vim-toml'

" Typescript syntax files for Vim
" Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()
