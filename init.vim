"     __                           __  ___           __
"    / /   __  ______  ____ ______/  |/  /___ ______/ /__
"   / /   / / / / __ \/ __ `/ ___/ /|_/ / __ `/ ___/ //_/
"  / /___/ /_/ / / / / /_/ / /  / /  / / /_/ (__  ) ,<
" /_____/\__,_/_/ /_/\__,_/_/  /_/  /_/\__,_/____/_/|_|_____
"                                                     /____/
" NEOVIM CONFIG by Lunarmask_

" -----------------------
"   Main Config Options
" -----------------------
"
" Use <shift-k> to lookup the help entry for any of these settings.

let mapleader = ","

" Use two spaces for tabs/indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" We love utf-8
set fileencodings=utf-8 encoding=utf-8

" Show relative ruler
set number relativenumber

" Miscellaneous options
set nowrap list hidden nofoldenable wildmenu cursorline
syntax=on

" Screen doesn't refresh during macros
set lazyredraw

" Set the yank buffer be the same as my regular clipboard
set clipboard+=unnamedplus

" Smartcase searching
set ignorecase smartcase

" Show find/replace results pane
set inccommand=split

" Prevent lines from becoming too long; show page-width limit
set textwidth=120
let &colorcolumn=&textwidth
highlight ColorColumn ctermbg=235

" Set project path as current dir; Needed for go-find file (gf)
set path=$PWD,$PWD/**

" Ignore bulky rails folders (hidden folders are ignored by default)
let g:rails_dir_ignore = ['node_modules[[dir]]','vendor[[dir]]','bin[[dir]]','coverage[[dir]]','public[[dir]]','tmp[[dir]]']
set wildignore+=*/node_modules/,*/config/,*/vendor/,*/bin/,*/public/,*/log/,*/coverage/,*/tmp/

" Ignore bulky elixir folders (hidden folders are ignored by default)
let g:elixir_dir_ignore = ['_build[[dir]]', 'deps[[dir]]']
set wildignore+=*/_build/,*deps/

let NERDTreeIgnore = ( g:rails_dir_ignore + g:elixir_dir_ignore )

" Increase refresh of autocommand events (ms)
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" No backups
set nobackup
set nowritebackup


" -----------------------
"         Plugins
" -----------------------

" Install Vim-Plug as the plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.config/nvim/plugged')

Plug 'bronson/vim-trailing-whitespace'                   " Highlight trailing whitespace
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'neomake/neomake'                                   " Asynchronous lintiing
Plug 'ervandew/supertab'                                 " Tab completion
Plug 'mileszs/ack.vim'                                   " Regex search project
Plug 'preservim/nerdtree'                                " File navigation pane
Plug 'preservim/nerdcommenter'                           " Easily comment out code
Plug 'terryma/vim-multiple-cursors'                      " Edit multiple lines at the same time
Plug 'vim-syntastic/syntastic'                           " Syntax checking
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'frazrepo/vim-rainbow'                              " Colorcoated paranthesis/brackets
Plug 'ap/vim-css-color'                                  " Adds colors to background layer
Plug 'sheerun/vim-polyglot'                              " A collection of language packs for Vim
Plug 'chrisbra/csv.vim'                                  " Format CSV data into columns
Plug 'wsdjeg/vim-fetch'                                  " Open file at line specified
Plug 'unblevable/quick-scope'                            " More accurate character jumping
Plug 'psliwka/vim-smoothie'                              " Implement scroll smoothing

" # Telescope && Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'Lunarmask/specr.vim'

call plug#end()


" -----------------------
"     Plugin Options
" -----------------------

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-Rainbow enable
let g:rainbow_active = 1

" Use ripgrep for Ack if installed
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Start NERDtree when opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Only show vim-quickscope on key press
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-quickscope colors
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

" vim-quickscope max length
let g:qs_max_chars=&textwidth

" Smothie update interval
"let g:smoothie_update_interval = 10
"let g:smoothie_speed_exponentiation_factor = 1.0

" -----------------------
"       Statusline
" -----------------------

" Custom statusline
set statusline=
set statusline+=\ %F%m%r
set statusline+=\ \ %l:%c
set statusline+=\ \[%p%%\]

" Set syntastic error message in statusline
set statusline+=\ \ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Ending portion of the statusline
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ \ 


" -----------------------
"     Custom Keybinds
" -----------------------

" Common controls/tools
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <C-W>o :NERDTreeClose<CR><C-W>_<C-W>\|
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>rr :set nornu<CR>
nnoremap <leader>ru :set rnu<CR>

nnoremap <leader>w :w<CR>

" Yank filename into system buffer
nnoremap <leader>yfn :let @+=@%<CR>

" Yank word
nnoremap <leader>y viwy

" Paste word from yank buffer
nnoremap <leader>p 0p

" Alternative Fast exit
nnoremap <leader>qq :q!<CR>
nnoremap <leader>qa :qa!<CR>

" Quick upcase/downcase
nnoremap <leader>u viwgU
nnoremap <leader>d viwgu

" Reflow paragraph
nnoremap <leader>fp vip=

" FormatArray
nnoremap <leader>fa :call FormatArray()<CR>

" Ack for word
nnoremap <leader>a<space> :Ack!<space>
nnoremap <leader>aw viwy:Ack!\ <C-R><C-R>+<cr>
nnoremap <leader>ac <C-w>9j:q<CR>

" Enable/disable spellcheck
nnoremap <leader>s :setlocal spell spelllang=en_us<CR>
nnoremap <leader>so :set nospell<CR>

" Disable smoothie
nnoremap <leader>ns :let g:smoothie_enabled=0<CR>

" Run ruby spec
nnoremap <leader>t <Plug>Specr

" Output story card number
nnoremap <leader>ep :call StoryNumber()<CR>

" Remove all trailing whitespace in document
command Rms %s/\s\+$\|\r//g

" Java System.out.println(
ab sout System.out.println(

" Binding calls
ab rpry binding.pry
ab epry require IEx; IEx.pry

" Github Co-authored-by: Some One <some.one@example.foo>
ab cab Co-authored-by:

" Populate the co_authors files with those you pair with!
source ~/.config/nvim/co_authors

" Additional Functions
source ~/.config/nvim/functions.vim
" Git Validation Functions
source ~/.config/nvim/git_functions.vim
