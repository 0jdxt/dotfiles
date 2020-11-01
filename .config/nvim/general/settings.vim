set encoding=utf-8
set path=.,**                            " enable globbing for find
set pumheight=10                        " coc completion popup height
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments
set t_Co=256                            " deal with colors
set termguicolors                       " \
syntax enable                           " enable syntax highlighting
set hidden                              " multiple buffers
set nowrap                              " dipslay long lines
set linebreak                           " break on word when wrapping
set showbreak=>\ \ \                    " show ">  " on line breaks
set title                               " set window title
set number                              " line numbers
set relativenumber                      " \
set cursorline                          " highlight current line
set autoindent                          " indent on <CR>
set timeoutlen=300                      " Faster completion
set updatetime=300                      " \
set clipboard=unnamedplus               " clipboard integration
set scrolloff=2                         " scroll when 2 lines from edge
set noshowmode                          " hide mode
set nojoinspaces                        " insert only 1 space after joining lines
set autoread                            " detect file changed externally
set nobackup                            " coc recommended
set nowritebackup                       " \
set signcolumn=yes                      " always show sign column (gutter)
set incsearch                           " Proper search
set ignorecase                          " \
set smartcase                           " \
set gdefault                            " \
set splitright                          " Sane splits
set splitbelow                          " \
set undodir=~/.vimdid                   " Permanent undo
set undofile                            "
set shiftwidth=4                        " tabs
set softtabstop=4                       " \
set tabstop=4                           " \
set expandtab                           " \
set foldmethod=indent                   " folding
set foldnestmax=10                      " \
set nofoldenable                        " \
set foldlevel=1                         " \
set inccommand=nosplit
set showtabline=2                       " always show tabline
set laststatus=2                        " show statusline
set cmdheight=2                         " show cmd output
" make sure colors work
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
set background=dark

