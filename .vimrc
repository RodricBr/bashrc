" Ativando o uso do mouse(all modes)
set mouse=a

" Setando o número de linhas
set number

" O registro "unnamed" é sincronizado com a área de transferência do sistema
" Existe também unnamedplus que permite colar e copiar com CTRL+V/C
set clipboard=unnamed

" Setando backspacing
" (permite apagar caracteres e ativa identação automática)
set backspace=2

" Setando a identação automática
set ai
set smartindent

" Setando a sintaxe highlighting
syntax on

" Sem wrap
" set nowrap

" Tirando os backups (exemplo.txt~)
set nobackup
set nowritebackup
set noswapfile

" Cor de fundo & esquema de cores. Setado no C:/Users/User/vimfiles/colors/elford.vim (~/vimfiles/colors/nod-b.vim)
" tema: https://raw.githubusercontent.com/habamax/vim-nod/main/colors/nod-b.vim
colorscheme nod-b

" Encodação utf8
set encoding=utf-8

" Mostrar comandos incompletos
set showcmd

" Espaço do tab
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

" Pesquisa
set hlsearch
set incsearch
set ignorecase
set smartcase
