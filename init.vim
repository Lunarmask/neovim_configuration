" [ M O O N M A N ]'s  NEOVIM  CONFIGURATION

let mapleader = ","
set tabstop=2 shiftwidth=2 expandtab
set nu rnu nowrap list
set fileencodings=utf8 encoding=utf-8
set nofoldenable
syntax=on

" Prevent lines from becoming too long; show page-width limit
set textwidth=80
let &colorcolumn='80'
highlight ColorColumn ctermbg=235
"guibg=#2c2d27

" find files recursively in project folder
set path=$PWD,$PWD/**

" set folders to ignore below
"set wildignore+=*/test/,*/plugged/


" Install Vim-Plug as the plugin manager
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

call plug#end()

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

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-Rainbow enable
let g:rainbow_active = 1

" Use silver-searcher if installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Start NERDtree when opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" custom keybinds
nnoremap <C-W>o :NERDTreeClose<CR><C-W>_<C-W>\|
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>qa :qa!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :Ack!<space>
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>fp vip=<CR>

" Output story card number
"nnoremap <leader>ep :r ! git branch | grep \* | grep -o 'master\|EP-\d\{4\}'
command EPV r ! git branch | grep \* | grep -o 'master\|EP-\d\{4\}'

" Remove whitespace in document
command Rms %s/\s\+$\|\r//g

" Co-authored-by: Some One <some.one@example.foo>
ab cab Co-authored-by:

" Populate the co_authors files with those you pair with!
source ~/.config/nvim/co_authors

ab rpry binding.pry
ab epry require IEx; IEx.pry

