call plug#begin()
    Plug 'joshdick/onedark.vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'preservim/nerdcommenter'
call plug#end()

syntax on
set backspace=indent,eol,start
inoremap <silent> jj <ESC>
silent! colorscheme onedark
set encoding=utf-8

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

let g:mapleader=","

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

" preservim/nerdcommenter
let g:NERDDefaultAlign='left'

" make Vim treat all json files as jsonc
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

let g:coc_global_extensions=[
    \'coc-clangd',
    \'coc-json',
    \'coc-pyright'
\]

" coc-pyright
" toggle sortImports on save
au BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')
