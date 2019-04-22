""" Vim-Plug
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe'

Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

""" Other Configurations
filetype plugin indent on
syntax enable
set incsearch ignorecase smartcase hlsearch
"set list listchars=trail:»,tab:»-
"set fillchars+=vert:\
"set wrap breakindent
set encoding=utf-8
set number
set visualbell

" Formatting
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endi

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

""" Custom Mappings
let mapleader=","
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>t :call TrimWhitespace()<CR>

" Change Tabs
noremap <S-l> gt
noremap <S-h> gT

" Change Panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction
