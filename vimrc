filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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

Plugin 'dart-lang/dart-vim-plugin'

Plugin 'rust-lang/rust.vim'

"Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'

Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

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

let g:airline_theme = "papercolor"
let g:airline#extensions#tabline#enabled = 1

map <C-o> :NERDTreeToggle<CR>

" Window op helpers
nnoremap <C-a> <C-w><
nnoremap <C-d> <C-w>>
nnoremap <C-j> <C-w>v

let fts = ['go']
if index(fts, &filetype) > -1
    map <C-c> :GoFmt<CR>
    map <C-t> :GoTest<CR>
endif

let fts = ['rs']
if index(fts, &filetype) > -1
    map <C-c> :RustFmt<CR>
    map <C-t> :RustTest<CR>
endif

set background=dark
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = "256"
color gruvbox

"let g:dracula_italic = 0
"color dracula
"
if has('macunix')
    set backspace=indent,eol,start
endif

syntax on

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
