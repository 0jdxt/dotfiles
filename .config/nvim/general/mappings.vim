let mapleader=" "
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Basics
nnoremap ; :
nnoremap j gj
nnoremap k gk
inoremap jk <Esc>
inoremap kj <Esc>
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" use ctrl + hjkl to navigate panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>
" Better indenting
vnoremap < <gv
vnoremap > >gv
" tabs
nnoremap <silent> <TAB> gt
nnoremap <silent> <S-TAB> gT
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>
" buffers
nnoremap <Leader>b :buffers<CR>:buffer<space>
" <tab> completion (coc)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB> pumvisible() ? "<C-n>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc explorer
nnoremap <C-n> :CocCommand explorer --toggle --sources=buffer+,file+,bookmark+<CR>

" Trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd TabNewEntered * Startify

autocmd StdinReadPre * let s:std_in=1
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd BufNewFile,BufRead *.tera set syntax=jinja2
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd FileType c ClangFormatAutoEnable
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

