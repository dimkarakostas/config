" <Vundle>
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
" </Vundle>

set backspace=2
filetype plugin on
syntax on

" Ignore case when searching, enable smart search
set ignorecase smartcase

" Smart indentation
set autoindent smartindent

" Search options highlight, show matches etc
set gdefault hlsearch incsearch showmatch

" Tab equals 4 spaces
set expandtab smarttab softtabstop=4 shiftwidth=4

" Enable mouse usage
" set mouse=a

" Line Numbers
set number

" No error sounds
set noerrorbells novisualbell
set t_vb=
set tm=500

" Remap escape key
inoremap jj <ESC>

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap ; :
nnoremap : ;

" Split remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nnoremap <silent> <C-Y> :vsp<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

" Remove trailing whitespace in the file
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Open URLs with Browser
map <Leader>w :call iceweasel ()<CR>

" Next Tab
nnoremap <silent> <C-D> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-E> :tabprevious<CR>

" Move tab right/left
nnoremap <silent> <C-Right> :execute 'silent! tabmove ' . (tabpagenr())<CR>
nnoremap <silent> <C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Remove the buffer when closing tabs
set nohidden

" LaTeX stuff
autocmd BufRead,BufNewFile *.tex set textwidth=80

" Markdown stuff
autocmd BufRead,BufNewFile *.md set textwidth=80

" Flake8
autocmd BufWritePost *.py call Flake8()

execute pathogen#infect()

let g:email = "dimit.karakostas@gmail.com"
let g:username = "Dimitris Karakostas"
