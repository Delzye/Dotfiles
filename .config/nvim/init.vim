set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"multiple cursors
Plug 'terryma/vim-multiple-cursors'
"snippets
Plug 'honza/vim-snippets'
"code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"exchange surrounds
Plug 'tpope/vim-surround'
"comment lines and blocks of lines
Plug 'tpope/vim-commentary'
" Auto-insert and delete brackets
Plug 'jiangmiao/auto-pairs' 
"highlight color-codes
"Plug 'norcalli/nvim-colorizer.lua'
"git commit messages
Plug 'rhysd/git-messenger.vim'
" Support for R in NVIM
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
"CSV-Editor
Plug 'chrisbra/csv.vim'
call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'
"lua require'colorizer'.setup()

" Explorer
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" R
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let g:R_csv_app = 'localc'
