set backspace=2   " Backspace deletes like most programs in insert mode
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
" imap <leader>; <Esc>A;<Esc>
" imap <leader>, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim
"source ~/.config/nvim/plugins/arduino.vim
source ~/.config/nvim/plugins/coc.vim
"source ~/.config/nvim/plugins/commentary.vim
"source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/editorconfig.vim
"source ~/.config/nvim/plugins/eunuch.vim
"source ~/.config/nvim/plugins/exchange.vim
"source ~/.config/nvim/plugins/firenvim.vim
"source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
"source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lastplace.vim
"source ~/.config/nvim/plugins/lion.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nerdtree.vim
"source ~/.config/nvim/plugins/pasta.vim
"source ~/.config/nvim/plugins/peekaboo.vim
"source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/quickscope.vim
"source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/rooter.vim
"source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
"source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/textobj-xmlattr.vim
source ~/.config/nvim/plugins/unimpaired.vim
"source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/visual-star-search.vim
" source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

augroup FileTypeOverrides
    autocmd!

    autocmd TermOpen * setlocal nospell
augroup END
