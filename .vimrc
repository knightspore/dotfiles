set noerrorbells
set noswapfile
set tabstop=4 softtabstop=4
set shiftwidth=4
set nowrap
set expandtab
set smartindent
set relativenumber
set nu
set linespace=5
set nobackup
set undodir=~/.vim/undodir 
set undofile
set background=dark
set incsearch

set t_Co=256
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
let g:airline_theme='base16_gruvbox_dark_hard'

syntax on

" Set Markdown Files to Wrap
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END

call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/coc-tailwindcss',  { 'do': 'yarn install --frozen-lockfile && yarn run build' }
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-vetur'
Plug 'posva/vim-vue'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MTDL9/vim-log-highlighting'

call plug#end()

"Coc Settings
let g:coc_global_extensions = ['coc-snippets', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-highlight'] 

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
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

""Remaps
"Set leader key to Space
let mapleader = " "
"Custom Movements
nnoremap <leader>w :Lexplore<CR>
nnoremap <leader>x :exit<CR>
nnoremap <leader>[ :set background=dark<CR>
nnoremap <leader>] :set background=light<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
imap jj <Esc>
"Window Movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>j :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"User Theme Settings
colorscheme gruvbox
let g:airline_powerline_fonts = 1


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
