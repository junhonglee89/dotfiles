"-- Plugin ----------------------------------------------------------------------
if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Tools
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/goyo.vim'
    Plug 'vifm/vifm.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
"    Plug 'ctrlpvim/ctrlp.vim'
"    Plug 'tpope/vim-fugitive'  "for git-branch in airline
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"    Plug 'itchyny/lightline.vim'
" NERDTree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'vim-scripts/fountain.vim'
    Plug 'ap/vim-css-color'           "Display a preview of colors with CSS
" Color-schems
"    Plug 'morhetz/gruvbox'
"    Plug 'connorholyday/vim-snazzy'
"    Plug 'junegunn/seoul256.vim'
    Plug 'dracula/vim'

" Declare the list of plugins.
    Plug 'tpope/vim-sensible'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"-- Setupt for vim --------------------------------------------------------------
"specific color
augroup MyColors
    autocmd!
"snazzy
"    autocmd ColorScheme * highlight LineNR guifg='#848688' guibg='#3a3d4d' gui='bold'
"                      \ | highlight CursorLineNR guifg='#ff5c57' gui='bold' 
"dracula
    autocmd ColorScheme * highlight LineNR guibg='#282A36' ctermbg=236 gui='bold' cterm='bold'
                      \ | highlight CursorLineNR guifg='#FF79C6' ctermfg=212 gui='bold' cterm='bold' 
                      \ | highlight Normal guibg='#21222C' ctermbg=235
augroup END
"colorscheme snazzy
colorscheme dracula

"setting line number
set number relativenumber
set rnu
"set nu
highlight LineNr ctermbg=238   "Only works without colorscheme

"set ai cindent
"set ts=4 sw=4 tw=0
syntax enable
"colo delek
"set fencs=utf-8,korea
set paste
set nocompatible
"set backup
"set backupdir=~/backup
set history=999
set ignorecase
"set smartcase
"set smartindent
set expandtab ts=4 sw=4
set hlsearch
""set incsearch
set showmatch
set textwidth=300
"set paste
set autoread  "reload file by :e
"set mouse=a

set foldmethod=marker

set redrawtime=10000

" Cursor line
set cursorline

" Yank to clipboard (You must install xsel in SSH server to work in SSH session)
set clipboard+=unnamedplus

" Fortran syntax
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" Add column end
set colorcolumn=81
highlight ColorColumn ctermbg=238    "Only works without colorscheme
highlight ColorColumnNR ctermfg=red  "Only works without colorscheme

" Saturn like status bar setup
set laststatus=2  "always show statusbare
"set statusline=%F\ %m%h%r%=\ %M\ [TYPE=%Y]\ [BUF=%n/%{bufnr('$')}]\ [POS=%l,%v]\ [LEN=%L]\ [%p%%]
"set statusline=%F\ %m%h%r%=\ [FORMAT=%{&ff},%{&fenc}]\ [TYPE=%Y]\ [POS=%l,%v]\ [LEN=%L]\ [%p%%]
"set statusline=%F\ %m%h%r%=\ [FORMAT=%{&ff},%{&fenc}]\ [TYPE=%Y]\[BUF=%n/%{bufnr('$')}]\ [POS=%l,%v]\ [LEN=%L]\ [%p%%]

"autocmd BufRead,BufNewFile *.txt colo evening
""au FileType txt colo evening
"au BufRead,BufNewFile *.c,*.cpp,*.cc,*.cxx,*.C colo morning|set ts=2 sw=2
"au SwapExists * let v:swapchoice = 'o'

" Restart from the location where vim was terminated
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"-- keybinding ------------------------------------------------------------------
let mapleader = ","
map <C-s> :source ~/.config/nvim/init.vim<CR>
"map <C-n> :EditVifm .<CR>

" quit, save, and save & quit
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>e :wq<CR>

" spell chek on/off
map <leader>1 :set spell<CR>
map <leader>2 :set nospell<CR>

" for fzf
"map <C-f> :FZF<CR>
"map <C-p> :FZF ~<CR>
map <C-f> :Files<CR>
map <C-p> :Files ~<CR>

"
nnoremap <leader>/ :nohlsearch<CR>

" move selected line
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" for split
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" for NERDTree
map <C-o> :NERDTreeToggle<CR>

" for Markdown preview
map <leader>m :MarkdownPreview<CR>

" for Goyo
" refresh buffer
map <leader>r :e<CR>
map <leader>g :Goyo<CR>


" old
"ia time0    <C-R>=strftime(%Y.%m.%d-%H:%M:%S")<CR>
"nmap <F2>   :up<CR>
"nmap <F3>   :e.<CR>
"nmap <C-L>  <ESC>q/
"imap <C-D>  <C-R>=strftime("%Y.%m.%d-%H:%M:%S")<CR>
"vmap <C-C>  y

"{{{-- Goyo configuration ----------------------------------------------------------
"auto-load Goyo for Markdown
"autocmd vimenter *.md Goyo
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
function! s:goyo_enter()
    set eventignore=FocusGained
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
function! s:goyo_leave()
    set eventignore=
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif
endfunction
"}}}

"{{{-- lightline configuration -----------------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \ [ 'readony', 'myfilename', 'filetype', 'modified' ] ],
        \ 'right': [ [ 'mylineinfo', 'mylen', 'percent' ] ]
    \ },
    \ 'component': {
        \ 'filename': '%F',
    \ },
    \ 'component_function': {
        \ 'mylineinfo': "MyLineinfo",
        \ 'mylen': "MyLineLength",
        \ 'myfilename': 'MyLightlineFilename',
    \ },
    \ }
function! MyLineinfo()
  return 'POS=' . line('.') . ',' . col('.')
endfunction
function! MyLineLength()
  return  'LEN=' . line('$')
endfunction
function! MyLightlineFilename()
  let l:fname = expand('%:p')
  if len(fname) < winwidth(0)-60
    return fname
  endif
  return '...' . fname[len(fname)-(winwidth(0)-60):]
endfunction
"}}}

"{{{-- airline configuration -------------------------------------------------------
let g:airline_theme='dracula'
let g:airline_extensions = ['branch', 'tabline']
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0

let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold#%#__restore__#'

"function! AirlineInit()
"    let g:airline_section_c = airline#section#create([expand('%:p')])
"endfunction
"autocmd VimEnter * call AirlineInit()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
"let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
"let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
"let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
"let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
"let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
"let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
"let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
"let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
"let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
"}}}

"{{{-- NERDTree configuration ------------------------------------------------------
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"}}}

"{{{-- CtrlP configuration ---------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.f90.d,*.mod,*.proxy,*.inc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}

"{{{-- fzf configuration -----------------------------------------------------------
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"" Customize fzf colors to match your color scheme
"" - fzf#wrap translates this to a set of `--color` options
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"}}}

"{{{-- Markdown preview configuration ----------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '~/dotfiles/github-markdown.css'

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
"}}}
endif

