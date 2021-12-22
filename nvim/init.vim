set guicursor=
set relativenumber
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set isfname+=@-@

set cmdheight=1

set updatetime=50

set colorcolumn=80



call plug#begin('~/.vim/plugged')

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP setup
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'

" LSP snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" LSP language specifics
Plug 'pantharshit00/vim-prisma'
Plug 'chemzqm/vim-jsx-improve'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Treesitter 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Utilities
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'

" Markdown preview
Plug 'ellisonleao/glow.nvim'

call plug#end()


" Telescope
lua require('telescope').load_extension('fzf')

" Treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

lua require("plugins")
lua require("iamthebenja.lsp")

" netrw
let g:netrw_liststyle = 3

" gruvbox colorscheme setup
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='1'

set background=dark
colorscheme gruvbox

highlight ColorColumn ctermbg=0 guibg=grey
hi SignColumn guibg=none
hi CursorLineNR guibg=None
highlight Normal guibg=none
"highlight LineNr guifg=#ff8659
"highlight LineNr guifg=#aed75f
"highlight LineNr guifg=#5eacd3
highlight LineNr guifg=#20b2aa
highlight netrwDir guifg=#20b2aa
highlight qfFileName guifg=#aed75f
highlight TelescopeBorder guifg=#20b2aa

" Keymaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR> 
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
