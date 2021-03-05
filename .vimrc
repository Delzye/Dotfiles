" basic settings

" /foo finds /foo,/Foo,/FOO; /Foo finds /Foo
set ignorecase
set smartcase

" Encode properly
set encoding=utf-8

" Numbering
set nu
 
" Numbering relative to Position
set relativenumber 

" Show matching brackets
set showmatch

" Use system clipboard
set clipboard+=unnamedplus

" Tab Settings
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Compile documents
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html document
map <leader>p :!opout <c-r>%<CR><CR>

" Run a script that clears tex build files whenever I close a .tex file
autocmd VimLeave *.tex !texclear %

" Move lines and blocks of lines
nnoremap <C-A-j> :m+<CR>==
nnoremap <C-A-k> :m-2<CR>==
inoremap <C-A-j> <ESC>:m+<CR>==gi
inoremap <C-A-k> <ESC>:m-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

" Delete instead of copy
nnoremap d "_d
vnoremap d "_d

nnoremap <leader>d ""d
vnoremap <leader>d ""d

" Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Resize split
map <A-u> :res+5<CR>
map <A-i> :res-5<CR>
map <A-y> :vertical resize -5<CR>
map <A-o> :vertical resize +5<CR>

" Switch tabs
map <A-H> :tabprevious<CR>
map <A-L> :tabnext<CR>
