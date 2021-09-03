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
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'tweekmonster/impsort.vim'
Plug 'lervag/vimtex'
Plug 'eigenfoo/stan-vim'
Plug 'morhetz/gruvbox'
Plug 'JuliaEditorSupport/julia-vim'
"Plug 'airblade/vim-gitgutter'
call plug#end()

runtime macros/matchit.vim

set directory^=$HOME/.vim/tmp//

set termguicolors
set background=dark

let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_italic=1
colorscheme gruvbox

" boje guttera i linenr bg, boja margine
highlight LineNr ctermbg=233
highlight SignColumn ctermbg=233
highlight ColorColumn ctermbg=237

set colorcolumn=80

syntax sync minlines=256
set number
set relativenumber
set cursorline
set clipboard=unnamedplus

autocmd BufNewFile,BufRead *.md set filetype=markdown

let g:pandoc#filetypes#pandoc_markdown = 0

" spellcheck
autocmd FileType markdown,md,latex,tex,rnw,rmd setlocal spell
set spelllang=hr

set pastetoggle=<F3>

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
let R_nvimpager="tabnew"

" let R_external_term='gnome-terminal'
let R_external_term='gnome-terminal'
let R_in_buffer=1
let R_hl_term=1
let R_applescript=0

let R_rconsole_width = 75
let R_min_editor_width = 20

let R_pdfviewer="okular"

autocmd FileType r inoremap <buffer> \- <Esc>:normal! a %>%<CR>a 
autocmd FileType rnoweb inoremap <buffer> \- <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> \- <Esc>:normal! a %>%<CR>a 
autocmd FileType rnw inoremap <buffer> \- <Esc>:normal! a %>%<CR>a 

autocmd FileType r inoremap <buffer> \$ <Esc>:normal! a %$%<CR>a 
autocmd FileType rnoweb inoremap <buffer> \$ <Esc>:normal! a %$%<CR>a 
autocmd FileType rmd inoremap <buffer> \$ <Esc>:normal! a %$%<CR>a 
autocmd FileType rnw inoremap <buffer> \$ <Esc>:normal! a %$%<CR>a 

autocmd FileType r inoremap <buffer> \< <Esc>:normal! a %<>%<CR>a 
autocmd FileType rnoweb inoremap <buffer> \< <Esc>:normal! a %<>%<CR>a 
autocmd FileType rmd inoremap <buffer> \< <Esc>:normal! a %<>%<CR>a 
autocmd FileType rnw inoremap <buffer> \< <Esc>:normal! a %<>%<CR>a 

" opcije za vim-python

let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_warnings=1
let g:pymode_trim_whitespaces=1
let g:pymode_options=1
let g:pymode_virtualenv=1
set completeopt=menu

" slime
let g:slime_target='tmux'
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>l <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>r :SlimeSend0 "<c-l>"<CR>

" airline opcije
set laststatus=2
let g:airline_theme='powerlineish'

let g:airline_powerline_fonts=1

" nerdtree autorun
autocmd vimenter * NERDTree

let g:NERDTreeWinSize=25

" youcompleteme
let g:ycm_key_invoke_completion = '<C-X><C-O>'
let g:ycm_auto_trigger = 0
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1

" spremanje foldova
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

set foldcolumn=1

" ctrlp
let g:ctrlp_regexp = 1 "regex kao default search

" indentline: gasi conceal za indentline jer interferira s tex i md
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'md', 'rmd']
let g:indentLine_setConceal=1

" gasi conceal za
autocmd FileType rmd,markdown,md,latex,tex set cole=0
autocmd FileType rmd,markdown,md,latex,tex set foldmethod=manual

" isključuje smarttabs za makefile
autocmd FileType make setlocal nosmarttab

" python virualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" vimtex continuous
let g:vimtex_enabled = 1
let g:vimtex_compiler_latexmk = {'continuous' : 0}

let g:tex_flavor = 'latex'

" various
set backspace=indent,eol,start

set pythonhome='/usr/lib64/python2.7'
set pythondll='/usr/lib64/libpython2.7.so'

set pythonthreehome='/usr/lib/python3.9'
set pythonthreedll='/usr/lib/libpython3.9.so'

" vim-stan
setlocal omnifunc=syntaxcomplete#Complete

" vim command completion
set wildmenu
