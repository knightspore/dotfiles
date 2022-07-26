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

set t_Co=256
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set termguicolors

syntax on

"Set Markdown Files to Wrap
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim',{'as': 'dracula'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/coc-tailwindcss',  { 'do': 'yarn install --frozen-lockfile && yarn run build' }
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-vetur'
Plug 'posva/vim-vue'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mtdl9/vim-log-highlighting'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'github/copilot.vim'
Plug 'jxnblk/vim-mdx-js'

call plug#end()

"Coc Settings
let g:coc_global_extensions = [
      \ 'coc-snippets', 
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json',
      \ 'coc-tsserver', 
      \ 'coc-highlight',
      \ 'coc-eslint'
      \ ] 

"Coc VSC Remaps
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

"Search
if executable('rg')
    let g:rg_derive_root = 'true'
endif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

"File Browser
let g:netrw_browse_split = 3
let g:netrw_banner = 0
let g:netrw_winsize = 30
let g:netrw_altv = 1
let g:netrw_liststyle = 3

""Remaps
"Set leader key to Space
let mapleader = " "
"Custom Movements
nnoremap <leader>w :Lexplore<CR>
nnoremap <leader>x :exit<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :Prettier<CR>
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
nnoremap <leader><tab> :tabnext<CR>
nnoremap <leader><S-tab> :tabprevious<CR>

"Fzf
nnoremap <leader>f :GitFiles<CR>

"User Theme Settings
colorscheme dracula
set background=dark

let g:airline_powerline_fonts = 1

"Modern Javascript Helpers
"Linting for Next.js Style Projects
autocmd BufEnter *.{js,jsx,ts,tsx,mdx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,mdx} :syntax sync clear

"Prettier + ESLint Settings
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
