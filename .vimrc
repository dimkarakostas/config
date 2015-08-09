set backspace=2

" Ignore case when searching, enable smart search
set ignorecase smartcase

" Smart indentation
set autoindent smartindent

" Search options highlight, show matches etc
set gdefault hlsearch incsearch showmatch

" Tab equals 4 spaces
set expandtab smarttab softtabstop=4 shiftwidth=4

" Enable mouse usage
set mouse=a

" Line Numbers
set number

" No error sounds
set noerrorbells novisualbell
set t_vb=
set tm=500

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

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
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Remove the buffer when closing tabs
set nohidden

syntax on

" LaTeX stuff

autocmd BufRead,BufNewFile *.tex set textwidth=80
