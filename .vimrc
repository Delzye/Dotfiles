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

" Maven bindings
map <leader>mc <ESC> :w! \| !maven-exec compile<CR>

" Compile documents
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html document
map <leader>p :!opout <c-r>%<CR><CR>

" Run a script that clears tex build files whenever I close a .tex file
autocmd VimLeave *.tex !texclear %

" Move lines and blocks of lines
nnoremap <A-down> :m+<CR>==
nnoremap <A-up> :m-2<CR>==
inoremap <A-down> <ESC>:m+<CR>==gi
inoremap <A-up> <ESC>:m-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" Delete instead of copy
nnoremap d "_d
vnoremap d "_d

nnoremap <leader>d ""d
vnoremap <leader>d ""d

" Shortcutting split navigation
map <A-n> <C-w>h
map <A-e> <C-w>j
map <A-i> <C-w>k
map <A-o> <C-w>l

" Resize split
map <A-l> :vertical resize -5<CR>
map <A-u> :res+5<CR>
map <A-y> :res-5<CR>
map <A-;> :vertical resize +5<CR>

" Switch tabs
noremap <A-left> :tabprevious<CR>
noremap <A-right> :tabnext<CR>

packadd! everforest

" Important!!
        if has('termguicolors')
          set termguicolors
        endif
        " For dark version.
        set background=dark
        " For light version.
"        set background=light
        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:everforest_background = 'hard'
        colorscheme everforest
