" Bare minimum
set nocompatible
let mapleader=","

" Filetype stuff for Vundle
filetype off

" Vundle package manager
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" ------------
Bundle 'gmarik/vundle'
" Plugins
Bundle 'ajh17/VimCompletesMe'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'geoffharcourt/vim-matchit'
Bundle 'guns/xterm-color-table.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mikewest/vimroom'
Bundle 'pdurbin/vim-tsv'
Bundle 'Raimondi/delimitMate'
Bundle 'rstacruz/sparkup', {'rtp': '.vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
" Bundle 'Valloric/YouCompleteMe'
" Syntax
Bundle 'groenewege/vim-less'
Bundle 'jnwhiteh/vim-golang'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
" Vim scripts
Bundle 'Align'
Bundle 'mxw/vim-jsx'
" ------------
call vundle#end()

" Turn on after Vundle
filetype plugin indent on

" Automagically source .vimrc
augroup VimReload
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" 256 Colors
set t_Co=256
set background=dark

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
set visualbell

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

" No more temporary files
set nobackup
set nowritebackup
set noswapfile
set directory=/tmp

" Mouse functionality
if has('mouse')
  set mouse=a
  set mousefocus
  set mousehide
endif

" Highlight the status bar when in insert mode
au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12

" Scroll faster
set ttyfast

" None of these should be word dividers
set isk+=@,%,#

" CocoaPods and Podfiles
au BufRead,BufNewFile *.podspec,Podfile set ft=ruby

" CoffeeScript
au BufNewFile,BufRead *.coffee set ft=coffee

" CSV
au BufNewFile,BufRead *.csv,*.tsv,*.txt set tw=0 noet sts=0

" Go
au BufRead,BufNewFile *.go set ft=go

" JSON
au BufNewFile,BufRead *.json set ai filetype=javascript

" Less
au BufNewFile,BufRead *.less set filetype=less

" Markdown files
au BufNewFile,BufRead,BufReadPost *.md set filetype=markdown

" Mustache and Handlebars
au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs set filetype=mustache

" Python
au FileType python setl shiftwidth=4
au FileType python setl softtabstop=4

" PHP
"au FileType php setl sts=4 sw=4
"au FileType php setl noexpandtab

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
ca WQa wqa

" Avoid unnecessary hit-enter prompts
set shortmess=atI

" gm to go to the middle of a line
map gm :call cursor(0, virtcol('$')/2)<CR>

" Splits
set splitright
" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

" Easy wrap toggling
nmap <leader>w :set wrap!<cr>
nmap <leader>W :set nowrap<cr>

" Insert blank lines without going into insert mode
nmap go o<Esc>
nmap gO O<Esc>

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Shortcut for =>
imap <C-l> =><Space>

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
set wildignore+=*/json/*,*/html/*

" Invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" Because Sparkup has some deficiencies...
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,php,htmldjango,javascript runtime! ftplugin/html/sparkup.vim
augroup END

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
    elseif lang == "text"
      let lang = "cat"
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
let g:sql_type_default = 'mysql'
" HTML code in PHP should be highlighted
" let php_htmlInStrings=1

" MiniBufExpl plugin settings
let g:miniBufExplVSplit = 25
let g:miniBufExplorerMoreThanOne = 100
let g:miniBufExplUseSingleClick = 1

" ,b to display current buffers list
nnoremap <leader>b :MBEToggle<cr>

" Open browser after posting a gist
let g:gist_open_browser_after_post = 1

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'

" React and JSX
let g:jsx_ext_required = 0

" PEP8 and Syntastic options
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E225'

" Markdown folding
let g:vim_markdown_folding_disabled=1

" I like using <Enter> with YouCompleteMe
" let g:ycm_key_list_select_completion = ['<Tab>', '<Down>', '<Enter>']
" Another workaround for the flow I'm used to.
" inoremap <expr> <Enter> pumvisible() ? '\<C-y> ' : '<Enter>'

" Project-specific .vimrc files
if filereadable(".__vimrc")
  source .__vimrc
endif
