" set the leader key for vim
let mapleader = ","

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'leafOfTree/vim-svelte-plugin'

Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ap/vim-buftabline'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tmhedberg/matchit'
Plug 'rhysd/committia.vim'
Plug 'vim-scripts/Toggle-NERDTree-width'
Plug 'sjl/gundo.vim'
Plug 'genoma/vim-less'
Plug 'icymind/NeoSolarized'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

Plug 'psf/black', { 'tag': '19.10b0' }
let g:black_linelength=120
let g:black_fast=1
autocmd BufWritePre *.py execute ':Black'

Plug 'posva/vim-vue'
" dont know why, but makes css syntax work
let g:vue_disable_pre_processors = 1

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_disable_rules = ['max_line_length']

Plug 'elixir-editors/vim-elixir'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'svelte'] }

let g:prettier#autoformat = 1

Plug 'neovim/nvim-lspconfig'

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>n <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" all 4 of these used by telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'

nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-k> <cmd>Telescope live_grep<cr>



call plug#end()

nmap <leader>d <Plug>(coc-definition)
nmap <leader>y <Plug>(coc-type-definition)
nmap <leader>i <Plug>(coc-implementation)
nmap <leader>n <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)

" general settings
"let g:python_host_prog = '/Users/rpoole/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/rpoole/.pyenv/versions/neovim3/bin/python'


set viminfo=%,'25,f1,<300,:100,/100,h

set clipboard=unnamed
set cb=unnamedplus

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

set nohlsearch


set undofile
set undodir=~/.local/share/nvim/undo

set noswapfile
set nobackup
set nowritebackup

nnoremap <F3> :set hlsearch! hlsearch?<CR>

set nowrap
set textwidth=79
set formatoptions=qrn1

set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent
set smartindent
set smarttab
set expandtab
set number


" so window moves with j and k
nnoremap j gj
nnoremap k gk

" buffer movement
nnoremap <leader>bb <c-^>
nnoremap <leader>bd :bd<cr>
nnoremap <C-h> :bp<cr>
nnoremap <C-l> :bn<cr>

" window manipulation
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>x :x<CR>

" nerdtree settings
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['.sass-cache', '.DS_Store', '__pycache__', '\.pyc', '\~$', '\.tern-port', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" lightline 
let g:lightline = {
			\   'active': {
			\     'left':[ [ 'mode', 'paste' ],
			\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
			\     ]
			\   },
			\   'component': {
			\     'lineinfo': ' %3l:%-2v',
			\   },
			\   'component_function': {
			\     'gitbranch': 'fugitive#head',
			\   }
			\ }
let g:lightline.separator = {
			\   'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\   'left': '', 'right': '' 
			\}

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set hidden

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody,div,li,ol,ul"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" full page scrolling sucks
nnoremap <C-f> 10k
nnoremap <C-b> 10j


" set a nicer cursor in insert mode (from terryma on github)
" Tmux will only forward escape sequences to the terminal if surrounded by
" a DCS sequence
" gvim only
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" reduce lag so terminal vim is like gvim
set ttimeoutlen=50

" format code w/o losing position
nnoremap <silent> g= :let b:winview=winsaveview()<CR>gg=G:call winrestview(b:winview)<CR>

" keep cursor away from edges of screen
set so=14

" hybrid line numbers
set number
set relativenumber

" restore the cursor
augroup resCur
 autocmd!
 autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


" remember cursor position between buffer switches
if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme NeoSolarized

inoremap jj <esc>

" python-syntax
let g:python_highlight_all = 1

" neosolarized
set termguicolors
set t_ut=""

" WSL copy
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

luafile ~/.config/nvim/lua_config.lua

" change neosolarized pmenu colors
hi Pmenu gui=bold
highlight! link PmenuSel DiffChange
hi PmenuSbar gui=bold
hi PmenuThumb gui=bold
