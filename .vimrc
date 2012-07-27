" Bare minimum
set nocompatible
let mapleader=","

" Filetype stuff for Vundle
filetype off
filetype plugin indent on

" Vundle package manager
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" ------------
Bundle 'gmarik/vundle'
" Github
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/gist-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tomtom/tlib_vim'
" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
" Vim scripts
Bundle 'Align'
" ------------

" Automagically source .vimrc
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" 256 Colors
set t_Co=256

" Color scheme
color monokai

" Syntax stuff
syntax on
set hlsearch
set incsearch
set ignorecase
set smartcase

" Line numbers
set number
set ruler

" Whitespace
set nowrap
set expandtab
set textwidth=80
set shiftwidth=2
set softtabstop=2

" Python whitespace
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4

" Backspace
set backspace=indent,eol,start

" Paste from clipboard
set clipboard=unnamed

" Temporary files
set nobackup
set nowritebackup
set dir=/tmp

" Mouse functionality
if has("mouse")
  set mouse=a
  set mousefocus
  set mousehide
endif

" Scroll faster
set ttyfast

" None of these should be word dividers
set isk+=$,@,%,#

" :Q should quit
ca Q q
ca Q! q!
ca Qa qa
ca qa1 qa!

" :W should write
ca W w
ca Wq wq
ca Wqa wqa

" gm to go to the middle of a line
map gm :call cursor(0, virtcol('$')/2)<CR>

" Splits
set splitright
map vv :vsplit<CR>
map ss :split<CR>

" Use space to jump by pages
nnoremap <Space> <PageDown>

" Enter to switch buffers
nmap <Enter> <C-^>

" Clear search highlighting
nnoremap S :noh<CR>

" Easy search and replace
nmap <leader>s :%s//g<LEFT><LEFT>
vmap <leader>s :s//g<LEFT><LEFT>

" CTRL-P fuzzyfinder
nmap ; :CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/Library/*,*/env/*

" Invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" Execute the current buffer
function! RunCommand()
  let lang = &ft
  if lang =~ "^html"
    exe "map <leader>r :w<CR>:call ChromeReload()<CR>"
  elseif lang =~ "css$"
    exe "map <leader>r :w<CR>:call ChromeReload()<CR>"
  else
    if lang == "javascript"
      let lang = "node"
    elseif lang == "go"
      let lang = "go run"
    endif
    exe "map <leader>r :w<CR>:!" . lang . " %<CR>"
  endif
endfunction

" And every buffer should have it
au BufRead,BufNewFile * call RunCommand()

" Reload Google Chrome on Mac
function! ChromeReload()
python << EOF
from subprocess import call
browser = """
tell application "Google Chrome" to tell the active tab of its first window
  reload
end tell
tell application "Google Chrome" to activate
"""
call(['osascript', '-e', browser])
EOF
endfunction

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" And, map it to CTRL-L
nmap <C-L> :call <SID>SynStack()<CR>

" MiniBufExpl plugin settings
let g:miniBufExplVSplit = 25
let g:miniBufExplorerMoreThanOne = 100
let g:miniBufExplUseSingleClick = 1

" ,b to display current buffers list
nmap <Leader>b :MiniBufExplorer<cr>
