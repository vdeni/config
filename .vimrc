call plug#begin('~/.vim/plugins_by_vimplug')
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jpalardy/vim-slime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
call plug#end()

set conceallevel=0

set directory^=$HOME/.vim/tmp//

color molokai

syntax sync minlines=256
set number
set cursorline
set clipboard=unnamedplus

autocmd BufNewFile,BufRead *.md set filetype=markdown

let g:pandoc#filetypes#pandoc_markdown = 0

"spellcheck
autocmd FileType markdown,md,latex,tex setlocal spell
set spelllang=hr

set pastetoggle=<F3>

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

let R_term="gnome-terminal"
let R_in_buffer=1
let R_hl_term=1
let R_applescript=0

let R_rconsole_height = 15
let R_rconsole_width = 190
let R_min_editor_width = 90

let R_pdfviewer="okular"

let R_show_args = 0
let R_show_arg_help = 0

" kraj Nvim opcija

" opcije za vim-python

let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_warnings=1
let g:pymode_trim_whitespaces=1
let g:pymode_options=1
let g:pymode_virtualenv=1

"slime
let g:slime_target='tmux'
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>l <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend

"airline opcije
set laststatus=2
let g:airline_theme='powerlineish'

"nerdtree autorun
autocmd vimenter * NERDTree

"changes
hi ChangesSignTextAdd ctermbg=yellow ctermfg=black guibg=#27AE60
hi ChangesSignTextDel ctermbg=darkred  ctermfg=black guibg=#CB4335
hi ChangesSignTextCh  ctermbg=black  ctermfg=white guibg=#2E86C1
let g:changes_use_icons=0

" youcompleteme
let g:ycm_key_invoke_completion = '<C-X><C-O>'
let g:ycm_auto_trigger = 0
let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
let g:ycm_autoclose_preview_window_after_completion=1

set guifont=Hurmit\ Nerd\ Font\ Mono\ Medium
let g:airline_powerline_fonts=1

" spremanje foldova
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
augroup END

set foldcolumn=1

" ctrlp
let g:ctrlp_regexp = 1 "regex kao default search

" vim markdown
let g:vim_markdown_conceal = 0

" indentline: gasi conceal za indentline jer interferira s tex i md
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'md']

" python virualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
