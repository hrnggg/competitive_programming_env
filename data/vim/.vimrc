call plug#begin()
    Plug 'joshdick/onedark.vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'rhysd/vim-clang-format'
    Plug 'preservim/nerdcommenter'
call plug#end()

syntax on
set backspace=indent,eol,start
inoremap <silent> jj <ESC>
colorscheme onedark

filetype plugin indent on
set number 
set list " show special characters
set ruler " show the cursor line & column
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent " apply the indentation of the current line to the next
set nosmartindent " for c-like language
set tabstop=4
set shiftwidth=4
set expandtab " replace tab with space
set smarttab
set wildmenu
set showcmd
set showmatch
set matchpairs& matchpairs+=<:>
set clipboard=unnamed

au FileType c set tabstop=2
au FileType c set shiftwidth=2
au FileType cpp set tabstop=2
au FileType cpp set shiftwidth=2

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-i>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
":help UltiSnips-how-snippets-are-loaded
"don't use the name 'snippets' for user snippet directory. 
"this keyword is reserved for SniptMate
let g:UltiSnipsSnippetDirectories=['user-snippets', 'UltiSnips']
let b:UltiSnipsSnippetDirectories=['user-snippets']

" rhysd/vim-clang-format
let g:clang_format#code_style = 'Google'
let g:clang_format#detect_style_file = 1

" preservim/nerdcommenter
let g:NERDDefaultAlign='left'

" also run CocCommand
" - clangd.install
let g:coc_global_extensions=[
    \'coc-clangd',
    \'coc-json',
    \'coc-pyright'
\]
