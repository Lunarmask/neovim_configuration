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
set fileencodings=utf8 encoding=utf-8

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
set wildignore+=*/node_modules/,*/config/,*/vendor/,*/bin/,*/public/,*/log/,*/coverage/,*/tmp/
let NERDTreeIgnore = ['node_modules[[dir]]','vendor[[dir]]','bin[[dir]]','coverage[[dir]]','public[[dir]]','tmp[[dir]]']

" Increase refresh of autocommand events (ms)
set updatetime=500

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

Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-test/vim-test'
Plug 'skwp/vim-spec-finder'
Plug 'frazrepo/vim-rainbow'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'
Plug 'wsdjeg/vim-fetch'
Plug 'unblevable/quick-scope'

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

" Yank word
nnoremap <leader>y viwy

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

" Functions
source ~/.config/nvim/functions.vim
