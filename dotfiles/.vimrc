set nocompatible

"----Vundle settings----
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'preservim/nerdcommenter'
Plugin 'brooth/far.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/vim-cursorword'
Plugin 'google/vim-searchindex'
Plugin 'preservim/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on

syntax enable
set number
set autoread
set encoding=utf-8
set wildmenu
set softtabstop=0
set shiftwidth=4
set tabstop=4
set nowrap
set smartindent
set expandtab
set laststatus=0
set hidden
set showcmd
set ignorecase
set noswapfile
set ttimeout
set ttimeoutlen=0
set completeopt+=longest,menuone,noinsert
set completeopt-=preview

"Reloads buffer on its focus
autocmd FocusGained,BufEnter * :checktime
"Saves buffer on any change of data in it
autocmd FocusLost,InsertLeave,TextChanged,InsertChange * :wa

let g:kite_supported_languages = ['python']
let g:kite_completions=1
let g:kite_tab_complete=1
let g:kite_documentation_continual=0

let g:far#enable_undo=1

let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
let g:pymode_options_max_line_length = 110
let g:pymode_lint_on_fly = 1
let g:pymode_virtualenv = 1
let g:pymode_motion = 0
let g:pymode_rope = 0
let g:pymode_run = 0

let g:ycm_filetype_blacklist = {'python': 1}
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:NERDTreeIgnore = ['\.h.gch$', '\.pyc$', '\.out$']

colorscheme fogbell

map <F3> :vertical resize -15<CR>
map <F4> :vertical resize +15<CR>

noremap <leader>s :update<CR>
noremap <leader>xa :xa<CR>
noremap <leader>wa :wa<CR>
noremap <leader>y "+y

augroup filetype_python
    autocmd!
    autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!clear && python3.9' shellescape(@%, 1)<CR>
    autocmd FileType python nnoremap <leader>f :NERDTreeFind<CR> |
        \ nnoremap <leader>t :NERDTreeToggle<CR> |
        \ map <S-k> <nop>
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c autocmd VimEnter * NERDTree | wincmd p
    autocmd FileType c map <buffer> <leader>r :w<CR>:exec '!clear && gcc' shellescape(@%, 1) '&& ./a.out'<CR>
    autocmd FileType c set colorcolumn=90 |
        \ nnoremap <leader>f :NERDTreeFind<CR> |
        \ nnoremap <leader>t :NERDTreeToggle<CR> |
        \ map <S-k> <nop>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp autocmd VimEnter * NERDTree | wincmd p
    autocmd FileType cpp map <buffer> <leader>r :w<CR>:exec '!clear && g++' shellescape(@%, 1) '&& ./a.out'<CR>
    autocmd FileType cpp set colorcolumn=100 |
        \ nnoremap <leader>f :NERDTreeFind<CR> |
        \ nnoremap <leader>t :NERDTreeToggle<CR> |
        \ map <S-k> <nop>
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm autocmd VimEnter * NERDTree | wincmd p
    autocmd FileType asm map <buffer> <leader>r :w<CR>:exec '!clear && nasm -f elf64' shellescape(@%, 1) '&& ld -s *.o && ./a.out'<CR>
    autocmd FileType asm set colorcolumn=90 |
        \ nnoremap <leader>f :NERDTreeFind<CR> |
        \ nnoremap <leader>t :NERDTreeToggle<CR> |
        \ map <S-k> <nop>
augroup END
