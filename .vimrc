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
" Plugins
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle 'eraserhd/vim-ios'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tlib_vim'
" Syntax
Bundle 'groenewege/vim-less'
Bundle 'jnwhiteh/vim-golang'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
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

" Backspace
set backspace=indent,eol,start

" Paste from clipboard
set clipboard=unnamed

" Whitespace
set nowrap
set expandtab
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2

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

" CocoaPods and Podfiles
au BufRead,BufNewFile *.podspec,Podfile set ft=ruby

" CoffeeScript
au BufNewFile,BufRead *.coffee set ft=coffee

" Go
au BufRead,BufNewFile *.go set ft=go

" JSON
au BufNewFile,BufRead *.json set ai filetype=javascript

" Less
au BufNewFile,BufRead *.less set filetype=less

" Markdown files
au BufRead,BufNewFile *.md set filetype=markdown

" Mustache and Handlebars
au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs set filetype=mustache

" Python and PHP
au FileType python,php setl shiftwidth=4
au FileType python,php setl softtabstop=4

" Makefiles
au FileType make set noexpandtab

" Automatic brace expansion
au FileType c,css,go,php,javascript inoremap <buffer>{ {<CR>}<Esc>ko

" Automatic Coffeescript compiling
au FileType coffee set shiftwidth=2
au FileType coffee set softtabstop=2
au FileType coffee vmap <buffer><leader>r :CoffeeCompile<esc>ggVGy:q<cr>

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

" Easy wrap toggling
nmap <leader>w :set wrap!<cr>
nmap <leader>W :set nowrap<cr>

" Insert blank lines without going into insert mode
nmap go o<Esc>
nmap gO O<Esc>

" Shortcut for =>
imap <C-l> =><Space>

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

" Edit a file
" nmap e :n<Space>

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
endfunction

" And, map it to CTRL-L
nmap <C-L> :call <SID>SynStack()<CR>

" SQL statements in PHP should be highlighted
let php_sql_query=1
" HTML code in PHP should be highlighted
let php_htmlInStrings=1

" MiniBufExpl plugin settings
let g:miniBufExplVSplit = 25
let g:miniBufExplorerMoreThanOne = 100
let g:miniBufExplUseSingleClick = 1

" ,b to display current buffers list
nmap <Leader>b :MiniBufExplorer<cr>

" Open browser after posting a gist
let g:gist_open_browser_after_post = 1

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'
