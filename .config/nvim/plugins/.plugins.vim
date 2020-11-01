" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
     " VIM enhancements
     Plug 'ciaranm/securemodelines'
     Plug 'editorconfig/editorconfig-vim'
     Plug 'airblade/vim-gitgutter'
     Plug 'ryanoasis/vim-devicons'
     Plug 'mhinz/vim-startify'
     Plug 'alvan/vim-closetag'
     Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }
     " UI enhancements
     Plug 'itchyny/lightline.vim'
     Plug 'machakann/vim-highlightedyank'
     Plug 'andymass/vim-matchup'
     Plug 'arcticicestudio/nord-vim'
     Plug 'mengelbrecht/lightline-bufferline'
     " Semantic language support
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     " Syntactic language support
     Plug 'vim-syntastic/syntastic' " for cpplint
     Plug 'rust-lang/rust.vim'
     Plug 'godlygeek/tabular'
     Plug 'plasticboy/vim-markdown'
     Plug 'ron-rs/ron.vim'
     Plug 'mboughaba/i3config.vim'
     Plug 'leafgarland/typescript-vim'
     Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
     Plug 'sheerun/vim-polyglot'
     Plug 'rhysd/vim-clang-format'
     Plug 'jackguo380/vim-lsp-cxx-highlight'

     " useful things
     Plug 'tpope/vim-surround'
     Plug 'tpope/vim-commentary'
     Plug 'tpope/vim-repeat'
     Plug 'StanAngeloff/php.vim'
     Plug 'vifm/vifm.vim'
     Plug 'mattn/emmet-vim'
     Plug 'kovetskiy/sxhkd-vim'
     Plug 'tpope/vim-fugitive'
     Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
     Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

