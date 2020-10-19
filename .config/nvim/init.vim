call plug#begin(stdpath('data') . '/plugged')

" Load plugins
" VIM enhancements
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'wakatime/vim-wakatime'
" Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'alvan/vim-closetag'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'arcticicestudio/nord-vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ron-rs/ron.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'mboughaba/i3config.vim'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-clang-format'

" useful things
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'StanAngeloff/php.vim'
Plug 'vifm/vifm.vim'

Plug 'mattn/emmet-vim'
Plug 'kovetskiy/sxhkd-vim'

" gitignore.io
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

call plug#end()

" deal with colors
if !has('gui_running')
  set t_Co=256
endif

if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

set nocompatible
set title
filetype off


" Get syntax
syntax on

" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

set number
set relativenumber
set cursorline

set termguicolors
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ }

" racer + rust
" https://github.com/rust-lang/rust.vim/issues/192
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" codestats
let g:codestats_api_key = 'SFMyNTY.YW1SNGRBPT0jI05Ua3pOUT09.PPy-4F3qHwT8VKZqO2-nTNUB-KL-HH-OiQHAgdij2F0'

" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"



filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes


" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Sane splits
set splitright
set splitbelow

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Permanent undo
set undodir=~/.vimdid
set undofile

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

nnoremap ; :
nnoremap j gj
nnoremap k gk

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set inccommand=nosplit
noremap <C-q> :confirm qall<CR>

autocmd StdinReadPre * let s:std_in=1

:nmap <C-n> :CocCommand explorer<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeIgnore=['^node_modules$[[dir]]']

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

autocmd BufNewFile,BufRead *.tera set syntax=jinja2

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set wrap

let g:neovide_cursor_vfx_mode = "sonicboom"

set noshowmode

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Vim-DevIcons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsOS = 'Darwin'

" startify
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
    \ 'echo "Cleaning up before saving.."',
    \ 'silent! NERDTreeTabsClose'
    \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ {'a': '~/.config/alacritty/alacritty.yml' },
            \ {'b': '~/.config/bspwm/bspwmrc' },
            \ {'d': '/usr/local/etc/doas.conf' },
            \ {'i': '~/.config/i3/config' },
            \ {'p': '~/.config/polybar/config' },
            \ {'s': '~/.config/sxhkd/sxhkdrc' },
            \ {'v': '~/.config/nvim/init.vim' },
            \ {'x': '~/.config/X11/Xresources' },
            \ {'z': '~/.config/zsh/.zshrc' }
            \ ]


function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

nnoremap <leader>l :ls<CR>:b<space>

let g:closetag_filetypes = "html,php"
set guifont=Code\ New\ Roman\ Nerd\ Font:h14
let g:neovide_transparency = 1.0
let g:neovide_cursor_animation_length=0.1
set background=dark

let g:clang_format#auto_format = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "",
    \ "Deleted"   : "",
    \ "Dirty"     : "*",
    \ "Clean"     : "",
    \ 'Ignored'   : "",
    \ "Unknown"   : ""
    \ }

let g:coc_global_extensions = [
  \ "coc-eslint",
  \ "coc-explorer",
  \ "coc-floatinput",
  \ "coc-json",
  \ "coc-html",
  \ "coc-yaml",
  \ "coc-python",
  \ "coc-java",
  \ "coc-prettier",
  \ "coc-rust-analyzer",
  \ "coc-toml",
  \ "coc-tsserver",
  \ ]
