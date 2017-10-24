call plug#begin('~/.vim/plugins_by_vimplug')
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'python-mode/python-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'shougo/neocomplete.vim'
Plug 'jpalardy/vim-slime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'chrisbra/changesPlugin'
Plug 'tpope/vim-obsession'
call plug#end()

set directory^=$HOME/.vim/tmp//

color molokai

set number
set cursorline
set clipboard=unnamedplus

"spellcheck
autocmd FileType markdown,md,latex,tex setlocal spell
set spelllang=hr

set pastetoggle=<F3>

let g:neocomplete#enable_at_startup = 1

"highlight LineNr ctermfg=yellow
set showcmd
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch     " show search matches as you type
filetype on
set t_Co=256
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set showmatch     " set show matching parenthesis
set autoindent
set textwidth=80
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set nofoldenable    " disable folding

" nvim opcije

" horizontalno otvaranje helpdoca za R
let R_nvimpager="horizontal"

" forsira tmux za N-vim-R
let R_term="gnome-terminal"
let R_in_buffer=0
let R_applescript=0
"let R_tmux_split=1

" kraj Nvim opcija

" opcije za vim-python

let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_warnings=1
let g:pymode_trim_whitespaces=1
let g:pymode_options=1

"slime
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>l <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend

"neocomplete vim opcije
let g:neocomplete#enable_auto_select=0
let g:neocomplete#disable_auto_complete=0
let g:jedi#completions_enabled=0
let g:jedi#auto_initialization=1
let g:jedi#popup_select_first=0
let g:pymode_rope=0
let g:pymode_rope_lookup_project=0

"airline opcije
set laststatus=2
let g:airline_theme='powerlineish'

"nerdtree autorun
autocmd vimenter * NERDTree

"changes
hi ChangesSignTextAdd ctermbg=yellow ctermfg=black guibg=darkgreen
hi ChangesSignTextDel ctermbg=darkred  ctermfg=black guibg=darkred
hi ChangesSignTextCh  ctermbg=black  ctermfg=white guibg=darkblue
