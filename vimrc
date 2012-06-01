" This is the vimrc for vimulacrum.

" Environment {
  " Basics {
    set nocompatible        " must be first line
    set background=dark     " Assume a dark background

    " The spacebar is worthless otherwise!
    " need to set this before the keybindings in the bundle section
    let mapleader = ' '

    " paper trail {
      set backup
      set backupdir=~/.vim/backups
      if version >= 703
        set undofile
        set undodir=~/.vim/undos
      endif
      set history=1000
      set directory=~/.vim/swaps
    " }

    " Thorfile, Rakefile and Gemfile are ruby files
    au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby

    " Remember last location in file {
      if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"'") <= line("$")
          \| exe "normal g'\"" | endif
      endif
    " }
  " }

  " Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
  " }

  " Set Up Bundle Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
  " }
" }

" Bundles
  " Dependencies
  Bundle 'gmarik/vundle'

  " Use local bundles if available {
    if filereadable(expand("~/.vimrc.bundles.local"))
      source ~/.vimrc.bundles.local
    endif
  " }

  " General
  Bundle 'scrooloose/nerdtree'
  " NerdTree {
    map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    "nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

    let g:NERDShutUp=1
  " }

  Bundle 'tpope/vim-surround'
  Bundle 'AutoClose'
  Bundle 'kien/ctrlp.vim'
  " ctrlp {
   let g:ctrlp_map = "<leader>f"
   map <silent> <leader>b :CtrlPBuffer<CR>
   let g:ctrlp_working_path_mode = 2
   let g:ctrlp_max_height = 20
   let g:ctrlp_custom_ignore = {
     \ 'dir':  '\.git$\|\.hg$\|\.svn$',
     \ 'file': '\.exe$\|\.so$\|\.dll$\|\.jpg$\|\.jpeg$\|\.png$\|\.pdf$' }
  " }
  Bundle 'nelstrom/vim-markdown-preview'
  Bundle 'ZoomWin'
  " ZoomWin {
   map <silent> <Leader>z :ZoomWin<CR>
  " }
  Bundle 'matchit.zip'
  let b:match_ignorecase = 1

  if executable('ack')
    Bundle 'mileszs/ack.vim'
  endif
  if executable('ack-grep')
    Bundle 'mileszs/ack.vim'
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  endif

  " Colorschemes
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'spf13/vim-colors'
  Bundle 'flazz/vim-colorschemes'

  " General Programming
  " Pick one of the checksyntax, jslint, or syntastic
  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-fugitive'
  " Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
  " }
  Bundle 'scrooloose/nerdcommenter'

  Bundle 'godlygeek/tabular'
  " Tabularize {
     if exists(":Tabularize")
       nmap <Leader>a= :Tabularize /=<CR>
       vmap <Leader>a= :Tabularize /=<CR>
       nmap <Leader>a: :Tabularize /:<CR>
       vmap <Leader>a: :Tabularize /:<CR>
       nmap <Leader>a:: :Tabularize /:\zs<CR>
       vmap <Leader>a:: :Tabularize /:\zs<CR>
       nmap <Leader>a, :Tabularize /,<CR>
       vmap <Leader>a, :Tabularize /,<CR>
       nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
       vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

       " The following function automatically aligns when typing a
       " supported character
       inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

       function! s:align()
         let p = '^\s*|\s.*\s|\s*$'
         if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
           let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
           let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
           Tabularize/|/l1
           normal! 0
           call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
         endif
       endfunction
     endif
  " }

  if executable('ctags')
    Bundle 'majutsushi/tagbar'
  endif
  " Ctags {
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    set tags=./tags;/,~/.vimtags
  " }
  " TagBar {
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
  " }

  " Snipmate with mandatory dependencies
    Bundle 'garbas/vim-snipmate'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    " ... but this one is optional
    Bundle 'spf13/snipmate-snippets'

  " PHP
  "Bundle 'spf13/PIV'
  " PIV {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
  " }

  " Python
  " Pick either python-mode or pyflakes & pydoc
  "Bundle 'klen/python-mode'
  " PyMode {
   let g:pymode_lint_checker = "pyflakes"
  " }
  "Bundle 'python.vim'
  "Bundle 'python_match.vim'
  "Bundle 'pythoncomplete'

  " Javascript
  Bundle 'leshill/vim-json'
  " JSON {
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
  " }

  Bundle 'groenewege/vim-less'
  Bundle 'taxilian/vim-web-indent'

  " HTML
  Bundle 'HTML-AutoCloseTag'
  " AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
  " }

  Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

  " Rails
  Bundle 'tpope/vim-rails'

  " Misc
  "Bundle 'tpope/vim-cucumber'
  "Bundle 'Puppet-Syntax-Highlighting'
  "Bundle 'vim-scripts/sudo.vim'
  "Bundle 'chrisbra/SudoEdit.vim'

" General {
  if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
  endif
  filetype plugin indent on   " Automatically detect file types.
  syntax on                   " syntax highlighting

  " we love utf-8
  scriptencoding utf-8
  set encoding=utf-8

  " increment/decrement base 10 instead of octal default
  set nrformats=alpha

  "set mouse=a                 " automatically enable mouse usage
  " always switch to the current file directory.
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

  set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set hidden                      " allow buffer switching without saving
  set fillchars+=stl:\ ,stlnc:\ 
" }

" Vim UI {
  color solarized
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  let g:solarized_contrast="high"
  let g:solarized_visibility="high"

  set tabpagemax=15               " only show 15 tabs
  set showmode                    " display the current mode

  " Linux GNOME Terminal specific settings {
  if $TERM == "xterm"
    "for 256 color support in terminal vim
    set t_Co=256
  endif
  " }

  " Mac OS X Terminal specific settings {
  if $TERM == "xterm-color"
    colorscheme neon
  endif
  " }

  if has('cmdline_info')
    set ruler                   " show the ruler
  endif

  if has('statusline')
    set laststatus=2
  endif

  set backspace=indent,eol,start       " backspace for dummies
  set linespace=0                      " No extra spaces between rows
  set nu                               " Line numbers on
  set incsearch                        " find as you type search
  set hlsearch                         " highlight search terms
  set winminheight=0                   " windows can be 0 line high
  set wildmenu                         " show list instead of just completing
  set wildmode=list:longest            " command <Tab> completion, list matches, then longest common part. (bash-like)
  set wildignore+=*.o,*.obj,.git,*.rbc,*.swp,*~ " don't include these files in search
  set list
  set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
  set autoindent                        " indent at the same level of the previous line
  set cinkeys=0{,0},:,0#,!<Tab>,!^F     " indent current line with these keystrokes
  set shiftwidth=2                      " use indents of 2 spaces
  set expandtab                         " tabs are spaces, not tabs
  autocmd FileType make set noexpandtab " ...unless you're creating a make file
  set tabstop=2                         " an indentation every two columns
  set softtabstop=2                     " let backspace delete indent
  set pastetoggle=<F12>                 " pastetoggle (sane indentation on pastes)
  "set comments=sl:/*,mb:*,elx:*/       " auto format comment blocks
  " Remove trailing whitespaces and ^M chars
  autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  " set auto add line breaks for text files
  autocmd FileType text set textwidth=80
" }

" Key Bindings {

  " buffer and split navigation
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  map <silent> <C-n> :bn<CR>
  map <silent> <C-p> :bp<CR>

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " clearing highlighted search
  nmap <silent> <leader>/ :nohlsearch<CR>

  " Shortcuts
  " Change Working Directory to that of the current file
  "cmap cwd lcd %:p:h
  "cmap cd. lcd %:p:h

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " For when you forget to sudo.. Really Write the file.
  map <leader>w :w !sudo tee % >/dev/null<CR>

  " Some helpers to edit mode
  " http://vimcasts.org/e/14
  "cnoremap %% <C-R>=expand('%:h').'/'<cr>
  "map <leader>ew :e %%
  "map <leader>es :sp %%
  "map <leader>ev :vsp %%
  "map <leader>et :tabe %%
" }

" Plugins {
  " OmniComplete {
    if has("autocmd") && exists("+omnifunc")
      autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
    endif

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    " some convenient mappings
    inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,preview,longest
  " }
" }

" GUI Settings {
  " GVIM (here instead of .gvimrc)
  if has('gui_running')
    color molokai
    set guioptions-=T   ""
    set guioptions-=r   ""
    set guioptions-=R   ""
    set guioptions-=l   " remove every single stupid concept of a
    set guioptions-=L   " toolbar, menu bar, scroll bar, gay bar,
    set guioptions-=h   " etc.
    set guioptions-=b   ""
    set guioptions-=m   ""
    " Mac OS X MacVim specific settings
    if has('gui_macvim')
      set guifont=menlo\ bold:h12
      set transparency=0 " don't ever have a transparent window
    endif
  endif
" }

" Functions {
  function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
      NERDTreeMirror
      NERDTreeFind
      wincmd l
    endif
  endfunction
" }

" Auto-load Vimrcs {
  autocmd! BufWritePost vimrc source %
  autocmd! BufWritePost .vimrc source %
  autocmd! BufWritePost .vimrc.local source %
  autocmd! BufWritePost gvimrc source %
  autocmd! BufWritePost .gvimrc source %
  autocmd! BufWritePost .gvimrc.local source %
" }

" Local Configuration {
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif

  if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
      source ~/.gvimrc.local
    endif
  endif
" }
