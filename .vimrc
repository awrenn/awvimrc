filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Config
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

" Buttom bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Change dates with <C-A> and <C-X>
Plugin 'tpope/vim-speeddating'
" Adding support for surround <s> as a phrase type
" ex: cs'" replace outside ' with "
Plugin 'tpope/vim-surround'
" Better . support
Plugin 'tpope/vim-repeat'

Plugin 'jceb/vim-orgmode'

Plugin 'dart-lang/dart-vim-plugin'

call vundle#end()

syntax enable "Enable syntax highlighting
if v:version > 703
        set number
endif

set relativenumber

set textwidth=0
set wrapmargin=0

set nuw=4
set hlsearch
set laststatus=2 " always show status line

filetype plugin indent on

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


let g:airline_theme = "papercolor"

map <C-o> :NERDTreeToggle<CR>

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
