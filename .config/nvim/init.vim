set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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
" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

"let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_theme='everforest'

" Explorer
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Unmap 
let g:AutoPairsShortcutJump = '<A-h>'
source ~/.vimrc

" For treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "c", "python", "haskell" },
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
