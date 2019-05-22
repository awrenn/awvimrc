filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Config
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'dart-lang/dart-vim-plugin'

"Plugin 'venantius/vim-cljfmt'
"Plugin 'vim-scripts/paredit.vim' " This plugin is terrible for all vim users; I don't know why it exists
Plugin 'franks42/lein-repls'
Plugin 'tslime.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'

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

map <C-o> :NERDTreeToggle<CR>

map <C-c> :Cljfmt

set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
