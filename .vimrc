filetype off
let no_buffers_menu=1
let g:epi_mode_emacs=1
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  "     " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
let mapleader="'"


" vim-plug plugins list
call plug#begin()

Plug 'jez/vim-superman'
Plug 'lervag/vimtex'
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'

Plug 'dag/vim-fish'

"Plug 'mattn/emmet-vim'

" Moving around
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wellle/targets.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Version control
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'

" General code utility
Plug 'bronson/vim-trailing-whitespace'
" Plug 'ervandew/supertab'
Plug 'raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'tomtom/tcomment_vim' " TODO: go back to nerdcommenter !
" Plug 'tmhedberg/SimpylFold'
Plug 'rking/ag.vim' " With cheatsheet
" Plug 'lilydjwg/colorizer'
" Plug 'stephpy/vim-yaml'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Epitech
Plug 'LeBarbu/vim-epitech'

" " Python
" Plug 'klen/python-mode', { 'for': ['python'] }
" Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
" Plug 'nvie/vim-flake8'
" Plug 'benekastah/neomake'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'natw/vim-pythontextobj'

" C
Plug 'Mizuchi/STL-Syntax'

" Colorschmes
Plug 'crusoexia/vim-monokai'
" Plug 'nanotech/jellybeans.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'jnurmine/Zenburn'
" Plug 'fmoralesc/molokayo'
" Plug 'wellsjo/wellsokai.vim'
" Plug 'chriskempson/tomorrow-theme'
" Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype plugin indent on

" - PLUGINS OPTIONS
" Neomake
" TODO: Change it to work everytime you change the file
" autocmd BufEnter,VimEnter * Neomake
" autocmd BufWrite,InsertLeave * Neomake

" Jedi-Vim Options :
" let g:jedi#use_splits_not_buffers="left"
" let g:jedi#show_call_signatures="2"

let g:cpp_class_scope_highlight=1

" SuperTab
" let g:SuperTabDefaultCompletionType="<c-n>"
" let g:SuperTabContextDefaultCompletionType="<c-n>"

" UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"

" GitGutter
let g:gitgutter_realtime=500
let g:gitgutter_updatetime=500
let g:gitgutter_eager=500

" UltiSnips
" set runtimepath+=~/.nvim/ftdetect

" Pymode
let g:pymode_rope=0
let g:pymode_virtualenv=1

" Epitech
let g:epi_login='essian_b'
let g:epi_name='ESSIANE Abel'
nmap <leader>h :EpiHeader<CR>
"autocmd BufNewFile,BufRead *.h set filetype=cpp

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=0



" - CONFIG OPTIONS
set autoread

set hlsearch
set incsearch
set smartcase
set showmatch

set autoindent smartindent
set smarttab
set tabstop=8
set noexpandtab
set listchars=tab:..
set backspace=eol,start,indent

set autoindent
set shiftwidth=2
set softtabstop=2

function! ProtectedHeader()
  " '%' is the filename relative to the current directory,
  " t is used to don't have the full path and only the filename
  let filename=expand('%:t')
  let splitted=split(filename, '\.')
  if len(splitted) != 2
    return
  endif
  let splitted[0]=toupper(splitted[0])
  let splitted[1]=toupper(splitted[1])
  echo "#ifndef " . splitted[0] . "_" . splitted[1] . "_"
  echo "# define " . splitted[0] . '_' . splitted[1] . '_'
  echo ""
  echo "#endif /* !" . splitted[0] . '_' . splitted[1] . "_ */"
endfunction

function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1)}
  setlocal shiftwidth=2
  setlocal tabstop=8
endfunction

au FileType c,h call GnuIndent()

autocmd BufNewFile		*.{c,h} call GnuIndent()
autocmd BufWritePre		*.{c,h} call GnuIndent()

set splitbelow
set splitright

set clipboard=unnamedplus
set mouse-=a
set hidden
set nofoldenable

autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" - PYTHON RELATED
" let python_highlight_all=1
" set makeprg=python\ $*

" " Launch the current buffer in IPython
" function! IpythonMagic()
"	vsp
"	terminal ipython % --TerminalIPythonApp.force_interact=True
" endfunction
" nnoremap <leader>o :call IpythonMagic()<CR>

" - STYLING
colorscheme monokai
syntax enable

set scrolloff=5
set ruler
set number
set cursorline
set colorcolumn=80
set list
set relativenumber

set iskeyword-=_

hi Normal ctermbg=234
hi MatchParen cterm=bold ctermfg=red
highlight CursorLine ctermbg=237

" - MAPPINGS
inoremap <Up>		<NOP>
inoremap <Down>		<NOP>
inoremap <Left>		<NOP>
inoremap <Right>	<NOP>
noremap  <Up>		<NOP>
noremap  <Down>		<NOP>
noremap  <Left>		<NOP>
noremap  <Right>	<NOP>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

vnoremap \ss y/<C-R>"<CR>

" Close buffer without closing the split
nnoremap <Leader>d :bp\|bd #<CR>

" Apply YCM FixIt
noremap <Leader>f :YcmCompleter FixIt<CR>

" Ultisnips variables
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>l :ls<CR>:b<space>
