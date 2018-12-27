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

call vundle#end()

syntax enable "Enable syntax highlighting
set foldlevelstart=99
if v:version > 703
        set number
endif
set relativenumber
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
set background=dark
