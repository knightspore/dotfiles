"VIM Basics
set noerrorbells
set noswapfile
set tabstop=2 softtabstop=2
set shiftwidth=2
set nowrap
set expandtab
set smartindent
set relativenumber
set nu
set linespace=5
set nobackup
set undodir=~/.vim/undodir 
set undofile
set incsearch
set updatetime=300
set signcolumn=yes
syntax on
filetype plugin indent on
"Set leader key to Space
let mapleader = " "

"Set Markdown Files to Wrap
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END

call plug#begin('~/.vim/plugged')
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'vim-utils/vim-man'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/coc-tailwindcss',  { 'do': 'yarn install --frozen-lockfile && yarn run build' }
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mtdl9/vim-log-highlighting'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'jxnblk/vim-mdx-js'
Plug 'kblin/vim-fountain'
Plug 'rust-lang/rust.vim'
Plug 'stevearc/vim-arduino'
Plug 'bfrg/vim-cpp-modern'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

"Coc Extensions
let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-snippets', 
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json',
      \ 'coc-tsserver', 
      \ 'coc-highlight',
      \ 'coc-tailwindcss',
      \ 'coc-rust-analyzer'
      \ ] 

"Color / Theme Settings
colorscheme catppuccin-mocha
let g:airline_powerline_fonts = 1
let g:airline_theme='catppuccin'

"Set Markdown Files to Wrap
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END

"Linting for Next.js Style Projects
autocmd BufEnter *.{js,jsx,ts,tsx,mdx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,mdx} :syntax sync clear

"RustFmt on Save
let g:rustfmt_autosave = 1

"Prettier + ESLint Settings
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Coc - Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<CR>"

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<tab>"

" Remap keys for applying codeAction to the current line.
nmap <leader>fa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Coc VSC Remaps
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Detect Typescript Files
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

"Search / FZF
if executable('rg')
    let g:rg_derive_root = 'true'
endif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

nnoremap <leader>f :GitFiles<CR>
nnoremap <leader><S-f> :Files<CR>

"Netrw File Browser Setup
let g:netrw_browse_split = 3
let g:netrw_banner = 0
let g:netrw_winsize = 30
let g:netrw_altv = 1
let g:netrw_liststyle = 3


"Custom Movements
nnoremap <leader>w :Lexplore<CR>
nnoremap <leader>x :exit<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :CocCommand prettier.formatFile<CR>
nnoremap <leader>y :GoTest<CR>
imap jj <Esc>
" Remove annoying searchbox error
nnoremap q: :q 
" Comment/Uncomment
nnoremap <silent> \ :Commentary<CR> 
" Wrap / No Wrap
nnoremap <leader>z :set wrap!<CR>

"Window Movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>j :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>+ :vertical resize +20<CR>
nnoremap <silent> <Leader>- :vertical resize -20<CR>

" Tab Movements
nnoremap <leader>t :tabnext<CR>
nnoremap <S-t> :tabprevious<CR>
