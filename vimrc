" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set autoread        " watch for file changes
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set cursorline      " show the cursor line
set dictionary=/usr/share/dict/words " more words!
set encoding=utf-8  " Force UTF-8 as default
set history=100     " How many commands to remember
set incsearch       " do incremental searching
set iskeyword+=_,$,@,%,#,- " these shouldn't divide words.
set list            " display invisible characters
set listchars=tab:▸\ ,eol:¬ " Display extra whitespace
set magic           " Should always be on
set matchpairs+=<:> " add < and > to match pairs
set more            " use more prompt
set nobackup
set nowritebackup
set noconfirm       " Gives you a confirm-dialog instead of a flat refusal
set noerrorbells    " no error bells please
set nohidden        " close the buffer when I close a tab
set number          " display line number
set numberwidth=5   " line number width
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set showmode        " show the mode all the time
set termencoding=utf-8 " Also for terminals.
set visualbell
set whichwrap+=<,>,[,] " allow arrow do wrap arround

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

if has("gui_running")
  " Color scheme
  colorscheme digerati

  " highlight text after 80th column
  match OverLength /\%81v.*/
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
else
  " nothing there...
endif

if has("mac_gui")
  set gfn:Inconsolata:h13
else
  " nothing there...
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

if has("folding")
  set nofoldenable
  set foldmethod=syntax    " fold on syntax automagically, always
  set foldlevel=1
  set foldnestmax=10
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
  set foldcolumn=2        " 2 lines of column for fold showing, always
endif

" Softtabs, 2 spaces
" http://vimcasts.org/episodes/tabs-and-spaces/
set ts=2 sts=2 sw=2 expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader=","

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Move lines up and down
map <Leader>> :m +1 <CR>
map <Leader>< :m -2 <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Maps autocomplete to tab
" imap <Tab> <C-N>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" For Haml
au! BufRead,BufNewFile *.haml  setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>
inoremap ii <Esc>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
" set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

"map to fuzzy finder text mate stylez
nnoremap <c-f> :FufFile **/<CR>
let g:fuf_splitPathMatching=1

" NERD_tree
" autocmd VimEnter * NERDTree " NERDTree launched on statut
" autocmd VimEnter * wincmd p " focus on main window
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Open URL
" command -bar -nargs=1 OpenURL :!open <args>

" clojure configuration
let clj_highlight_builtins=1
let clj_paren_rainbow=1
