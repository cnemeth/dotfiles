set encoding=UTF-8

call plug#begin()
  Plug 'jiangmiao/auto-pairs'
  Plug 'ayu-theme/ayu-vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-haml', { 'for': ['haml'] }
  Plug 'slim-template/vim-slim', { 'for': ['slim'] }
  Plug 'tomtom/tcomment_vim'
  Plug 'dense-analysis/ale'
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }
  Plug 'kana/vim-textobj-user', { 'for': ['ruby'] }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'haml', 'eruby'] }
  Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
  Plug 'stephpy/vim-yaml'
  Plug 'frazrepo/vim-rainbow'
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-scripts/taglist.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

let mapleader = ','

set completeopt-=preview " For No Previews

" Colorscheme
set termguicolors
let ayucolor='dark'
colorscheme ayu

" Turn hybrid line numbers on
set number relativenumber
set ruler

" If installed using Homebroew
set rtp+=/user/local/opt/fzf

" remap :FZF to Ctrl-p
noremap <silent> <C-p> :FZF<CR>

" new tab
imap <silent> <Leader>u <Esc>:tabnew <CR>

noremap <leader>a :Ack<space>

map <silent> <Leader>hl <Esc>:nohl <CR>

filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" NERDTree
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" git
nmap <leader>gb :Git blame<CR>
nmap <leader>gs :Git status<CR>
nmap <leader>gd :Git diff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" setttings for Ale
let g:ale_linters = {
      \   'ruby': ['standardrb', 'rubocop'],
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}

" IndentLine {{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
