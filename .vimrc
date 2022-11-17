" .vimrc for Scott Cazan. 

" set the swapfile and undo directory
set backupdir=~/.vimswap//
set undodir=~/.vimundo//
set directory=~/.vimswap//

set guifont=Liberation\ Mono\ for\ Powerline\ 10 

set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
" set term=xterm-256color

" Bundles {
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/vista.vim'

Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-calltree.nvim'

Plug 'wakatime/vim-wakatime'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript'] }
Plug 'jremmen/vim-ripgrep'
Plug 'Shougo/vimproc.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'sheerun/vim-polyglot'
  Plug 'peitalin/vim-jsx-typescript'
  function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
      !./install.sh
    endif
  endfunction
  " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'sirver/ultisnips'
  " Plug 'honza/vim-snippets'
  " Plug 'jakedouglas/exuberant-ctags'
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-scripts/Color-Scheme-Explorer'
  " Plug 'carlosrocha/vim-chrome-devtools'
  function! BuildTern(info)
    if a:info.status == 'installed' || a:info.force
      !npm install
    endif
  endfunction
  Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }
  Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'rust-lang/rust.vim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'mattn/vim-xxdcursor'
  Plug 'Eric-Song-Nop/vim-glslx'
  Plug 'voldikss/vim-floaterm'

  " faust syntax and filetype
  Plug 'gmoe/vim-faust'

  " Other faust things
  Plug 'madskjeldgaard/faust-nvim'

  " debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'

  call plug#end()

  command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

  filetype plugin indent on    " required
  " }

set shell=/bin/bash

set background=dark         " Assume a dark background
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set ttimeout
set ttimeoutlen=100

scriptencoding utf-8

if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif


set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
		normal! g`"
		return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


set backup                  " Backups are nice ...

set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" Vim UI {
  " colorscheme molokai
  colorscheme wolfpack
	" colorscheme nofrils-supercollider
	set foldmethod=syntax

	set tabpagemax=15               " Only show 15 tabs
	set showmode                    " Display the current mode

	set cursorline                  " Highlight current line
	set ruler                   " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 " Show partial commands in status line and
  hi Normal guibg=NONE ctermbg=NONE     " Transparent background

	" Show the airline status bar on load
	"set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\                     " Filename
	set statusline+=%w%h%m%r                 " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info


	set backspace=indent,eol,start  " Backspace for dummies
	set linespace=0                 " No extra spaces between rows
	set relativenumber
	set showmatch                   " Show matching brackets/parenthesis
	set incsearch                   " Find as you type search
	set hlsearch                    " Highlight search terms
	set winminheight=0              " Windows can be 0 line high
	set ignorecase                  " Case insensitive search
	set smartcase                   " Case sensitive when uc present
	set wildmenu                    " Show list instead of just completing
	set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
	set scrolljump=5                " Lines to scroll when cursor leaves screen
	set scrolloff=3                 " Minimum lines to keep above and below cursor
	"set foldenable                  " Auto fold code
	set list
	set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }


" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
	"set iskeyword-=.				" periods delimit words
	set ai
    "autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml 
	"autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell setlocal nospell

" }


" Key (re)Mappings {
"	"Remap space to command mode
	map <space> :

	"Native folder toggle
	" map <C-e> :Vex<CR> 
	"NerdTree toggle
  nnoremap <C-e> :NERDTreeToggle<CR>

	" Easier motion for switching between splits (Ctrl-motion)
	let mapleader = ','
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
	noremap j gj
	noremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Clear search highlight
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }


" coc.nvim
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Better display for messages
set cmdheight=2

" always show signcolumns
set signcolumn=yes

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" end coc.nvim

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" ctrlp {
	let g:ctrlp_working_path_mode = 'ra'
	nnoremap <silent> <D-t> :CtrlP<CR>
	nnoremap <silent> <D-r> :CtrlPMRU<CR>
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\.git$\|\.hg$\|\.svn$',
		\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

	" On Windows use "dir" as fallback command.
	if executable('ack')
		let s:ctrlp_fallback = 'ack %s --nocolor -f'
	else
		let s:ctrlp_fallback = 'find %s -type f'
	endif
	let g:ctrlp_user_command = {
		\ 'types': {
			\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
			\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
		\ 'fallback': s:ctrlp_fallback
	\ }
"}
" airline {
	set laststatus=2
	let g:airline_powerline_fonts = 1

	"let g:airline_theme = 'solarized'
	let g:airline_theme = 'lucius'
	"let g:airline_theme = 'powerlineish'
	"let g:airline_theme = 'molokai'

	if !exists('g:airline_powerline_fonts')
		" Use the default set of separators with a few customizations
		let g:airline_left_sep='›'  " Slightly fancier than '>'
		let g:airline_right_sep='‹' " Slightly fancier than '<'
	endif


	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	" unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
" }

" neocomplcache {
	let g:neocomplcache_enable_at_startup = 1
" }

" Shell command {
	function! s:RunShellCommand(cmdline)
		botright new

		setlocal buftype=nofile
		setlocal bufhidden=delete
		setlocal nobuflisted
		setlocal noswapfile
		setlocal nowrap
		setlocal filetype=shell
		setlocal syntax=shell

		call setline(1, a:cmdline)
		call setline(2, substitute(a:cmdline, '.', '=', 'g'))
		execute 'silent $read !' . escape(a:cmdline, '%#')
		setlocal nomodifiable
		1
	endfunction

	command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
	" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }
"
inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>
"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

" easytags {
let g:easytags_languages = {
\   'javascript': {
\     'cmd': 'jsctags',
\     'args': ['-f'],
\     'recurse_flag': ''
\   }
\}
let g:easytags_auto_update = 0 " this was slowing down vim
" " }

" vim-vue (fixes the slowness)
let g:vue_disable_pre_processors = 1

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'scnvim-data']
"

let NERDSpaceDelims=1
" jsdoc keymapping (but overrides history browsing)
" nmap <silent> <C-l> <Plug>(jsdoc)

"let g:sclangTerm="tmux split-window -v -p 20"
set iskeyword-=.				" periods delimit words

" Rust config
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF


" source an external file for additional config
if filereadable(expand("~/.vimrc.config"))
	source ~/.vimrc.config
endif

set noswapfile

nnoremap <C-\> :copen<CR>
