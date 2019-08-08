filetype off

set rtp+=~/.config/nvim/bundle/vim-plug
call plug#begin("~/.config/nvim/bundle")

Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe'

" Buttom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Change dates with <C-A> and <C-X>
Plug 'tpope/vim-speeddating'
" Adding support for surround <s> as a phrase type
" ex: cs'" replace outside ' with "
Plug 'tpope/vim-surround'
" Better . support
Plug 'tpope/vim-repeat'

Plug 'dart-lang/dart-vim-plugin'

Plug 'rust-lang/rust.vim'

"Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Pretty html lines
Plug 'Yggdroot/indentLine'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

call plug#end()
call glaive#Install()

filetype plugin indent on

syntax enable "Enable syntax highlighting
syntax on
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

nnoremap wq :wq<CR>
nnoremap QQ :q!<CR>
command W :w

function ToggleNumbers()
    set number!
    set relativenumber!
endfunction
nnoremap <C-n> :call ToggleNumbers()<CR>

" Window op helpers
nnoremap <C-a> <C-w><
nnoremap <C-d> <C-w>>
nnoremap <C-j> <C-w>v
nnoremap <C-h> <C-w><Left>
nnoremap <C-l> <C-w><Right>

function LowerTerm()
    term    
endfunction
nnoremap T :call LowerTerm()<CR>

au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.exs set filetype=elixir
au BufRead,BufNewFile *.ex set filetype=elixir

augroup All
    au FileType * nnoremap <buffer> <C-c> :FormatCode<CR>
    au FileType * setlocal foldmethod=syntax
    au FileType * norm zR
augroup end

augroup Html
    au FileType html setlocal foldmethod=indent
    au FileType html norm zR
    au FileType html nnoremap <buffer> <Space> za
augroup end

augroup Xml
    au FileType xml setlocal foldmethod=indent
    au FileType xml norm zR
    au FileType xml nnoremap <buffer> <Space> za
augroup end

augroup Rust
    au FileType rust nnoremap <buffer> <C-c> :RustFmt<CR>
    au FileType rust nnoremap <buffer> <C-t> :RustTest<CR>
    au FileType rust nnoremap <buffer> <Space> za
    au FileType rust normal zR
    au FileType rust setlocal foldmethod=syntax
augroup end

augroup Go
    au FileType go nnoremap <buffer> <C-t> :GoTest<CR>
augroup end

augroup Elixir
    au FileType elixir nnoremap <buffer> <C-c> :MixFormat<CR>
augroup end


" Other code formatting things

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

set timeoutlen=1000 ttimeoutlen=0
