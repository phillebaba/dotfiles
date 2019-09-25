""" Vim-Plug
call plug#begin()

" GUI
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'

" Languages
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

call plug#end()

""" Other Configurations
filetype plugin indent on
syntax enable
set encoding=utf-8
set spell spelllang=en_us
set incsearch ignorecase smartcase hlsearch
set list listchars=trail:»,tab:»- " Show trailing spaces and tabs
set wrap breakindent
set number
set visualbell
set clipboard=unnamedplus " Yank and Paster with system clipboard

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
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endi

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-terraform-completion
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

""" Custom Mappings
let mapleader=","
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>c :noh<CR>

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" change Tabs
noremap <S-l> gt
noremap <S-h> gT

" change Panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
