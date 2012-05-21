" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" This is the vimrc for vimulacrum.
" }

" Environment {
  " Basics {
    set nocompatible        " must be first line
    set background=dark     " Assume a dark background

    " paper trail
    set backup
    set backupdir=~/.vim/backups
    if version >= 703
      set undofile
      set undodir=~/.vim/undos
    endif
    set history=1000
    set directory=~/.vim/swaps

    " Thorfile, Rakefile and Gemfile are ruby files
    au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby

    " Remember last location in file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"'") <= line("$")
        \| exe "normal g'\"" | endif
    endif
  "}

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

" Bundles {
  " Deps
  Bundle 'gmarik/vundle'
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  Bundle 'mileszs/ack.vim'

  " Use local bundles if available {
    if filereadable(expand("~/.vimrc.bundles.local"))
      source ~/.vimrc.bundles.local
    endif
  " }

  " General
  Bundle 'scrooloose/nerdtree'
  Bundle 'tpope/vim-surround'
  Bundle 'AutoClose'
  Bundle 'kien/ctrlp.vim'
  Bundle 'spf13/vim-preview'
  Bundle 'nelstrom/vim-markdown-preview'
  Bundle 'ZoomWin'
  "Bundle 'vim-scripts/sessionman.vim'
  " Extends % for HTML, LaTeX etc.
  Bundle 'matchit.zip'
  ""Bundle 'Lokaltog/vim-powerline'
  " Approximate colorschemes
  "Bundle 'godlygeek/csapprox'
  "Bundle 'jistr/vim-nerdtree-tabs'

  " Colorschemes
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'spf13/vim-colors'
  Bundle 'flazz/vim-colorschemes'

  " General Programming
  " Pick one of the checksyntax, jslint, or syntastic
  Bundle 'scrooloose/syntastic'
  Bundle 'garbas/vim-snipmate'
  Bundle 'spf13/snipmate-snippets'
  " Git wrapper
  Bundle 'tpope/vim-fugitive'
  "Bundle 'scrooloose/nerdcommenter'
  Bundle 'godlygeek/tabular'
  Bundle 'majutsushi/tagbar'
  Bundle 'Shougo/neocomplcache'

  " PHP
  "Bundle 'spf13/PIV'

  " Python
  " Pick either python-mode or pyflakes & pydoc
  "Bundle 'klen/python-mode'
  "Bundle 'python.vim'
  "Bundle 'python_match.vim'
  "Bundle 'pythoncomplete'

  " Javascript
  Bundle 'leshill/vim-json'
  Bundle 'groenewege/vim-less'
  Bundle 'taxilian/vim-web-indent'

  " HTML
  Bundle 'HTML-AutoCloseTag'
  Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

  " Ruby
  ""Bundle 'rails.vim'

  " Misc
  "Bundle 'spf13/vim-markdown'
  "Bundle 'tpope/vim-cucumber'
  "Bundle 'Puppet-Syntax-Highlighting'
  "Bundle 'vim-scripts/sudo.vim'
  "Bundle 'chrisbra/SudoEdit.vim'
" }

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
  set spell                       " spell checking on
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

  " make sure Linux terminal color support works
  if $TERM == "xterm"
      "for 256 color support in terminal vim
      set t_Co=256
  endif

  if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f                      " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif

  set backspace=indent,eol,start       " backspace for dummies
  set linespace=0                      " No extra spaces between rows
  set nu                               " Line numbers on
  set incsearch                        " find as you type search
  set hlsearch                         " highlight search terms
  set winminheight=0                   " windows can be 0 line high
  set ignorecase                       " case insensitive search
  set smartcase                        " case sensitive when uc present
  set wildmenu                         " show list instead of just completing
  set wildmode=list:longest            " command <Tab> completion, list matches, then longest common part. (bash-like)
  set wildignore+=*.o,*.obj,.git,*.rbc " don't include these files in search
  set foldenable                       " auto fold code
  set list
  set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
  set autoindent                        " indent at the same level of the previous line
  set cinkeys=0{,0},:,0#,!<Tab>,!^F     " indent current line with these keystrokes
  set shiftwidth=2                      " use indents of 4 spaces
  set expandtab                         " tabs are spaces, not tabs
  autocmd FileType make set noexpandtab " ...unless you're creating a make file
  set tabstop=2                         " an indentation every four columns
  set softtabstop=2                     " let backspace delete indent
  set pastetoggle=<F12>                 " pastetoggle (sane indentation on pastes)
  "set comments=sl:/*,mb:*,elx:*/       " auto format comment blocks
  " Remove trailing whitespaces and ^M chars
  autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {
  " The spacebar is worthless otherwise!
  let mapleader = ' '

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
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " Fix home and end keybindings for screen, particularly on mac
  " - for some reason this fixes the arrow keys too. huh.
  map [F $
  imap [F $
  map [H g0
  imap [H g0

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Some helpers to edit mode
  " http://vimcasts.org/e/14
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  " Adjust viewports to the same size
  map <Leader>= <C-w>=
" }

" Plugins {
  " PIV {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
  " }

  " Misc {
    let g:NERDShutUp=1
    let b:match_ignorecase = 1
  " }

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

  " Ctags {
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    set tags=./tags;/,~/.vimtags
  " }

  " EasyTags {
    let g:easytags_cmd = 'ctags'
  " }

  " AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
  " }

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
  " }

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

   " Session List {
     set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
     nmap <leader>sl :SessionList<CR>
     nmap <leader>ss :SessionSave<CR>
   " }

   " JSON {
     nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
   " }

   " PyMode {
     let g:pymode_lint_checker = "pyflakes"
   " }

   " ctrlp {
     let g:ctrlp_map = "<leader>f"
     map <silent> <leader>b :CtrlPBuffer<CR>
     let g:ctrlp_working_path_mode = 2
     let g:ctrlp_max_height = 20
     let g:ctrlp_custom_ignore = {
       \ 'dir':  '\.git$\|\.hg$\|\.svn$',
       \ 'file': '\.exe$\|\.so$\|\.dll$' }
   " }

   " TagBar {
     nnoremap <silent> <leader>tt :TagbarToggle<CR>
   " }

   " Fugitive {
     nnoremap <silent> <leader>gs :Gstatus<CR>
     nnoremap <silent> <leader>gd :Gdiff<CR>
     nnoremap <silent> <leader>gc :Gcommit<CR>
     nnoremap <silent> <leader>gb :Gblame<CR>
     nnoremap <silent> <leader>gl :Glog<CR>
     nnoremap <silent> <leader>gp :Git push<CR>
   " }

   " neocomplcache {
     let g:neocomplcache_enable_at_startup = 0
     let g:neocomplcache_enable_camel_case_completion = 1
     let g:neocomplcache_enable_smart_case = 1
     let g:neocomplcache_enable_underbar_completion = 1
     let g:neocomplcache_min_syntax_length = 3
     let g:neocomplcache_enable_auto_delimiter = 1

     " AutoComplPop like behavior.
     let g:neocomplcache_enable_auto_select = 0

     " SuperTab like snippets behavior.
     imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

     " Plugin key-mappings.
     imap <C-k>     <Plug>(neocomplcache_snippets_expand)
     smap <C-k>     <Plug>(neocomplcache_snippets_expand)
     inoremap <expr><C-g>     neocomplcache#undo_completion()
     inoremap <expr><C-l>     neocomplcache#complete_common_string()


     " <CR>: close popup
     " <s-CR>: close popup and save indent.
     inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
     inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
     " <TAB>: completion.
     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

     " <C-h>, <BS>: close popup and delete backword char.
     inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
     inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
     inoremap <expr><C-y>  neocomplcache#close_popup()
     inoremap <expr><C-e>  neocomplcache#cancel_popup()

     " Enable omni completion.
     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

     " Enable heavy omni completion.
     if !exists('g:neocomplcache_omni_patterns')
       let g:neocomplcache_omni_patterns = {}
     endif
     let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
     "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
     let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
     let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
     let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

     " For snippet_complete marker.
     if has('conceal')
       set conceallevel=2 concealcursor=i
     endif
   " }

   " ZoomWin {
     map <silent> <Leader>z :ZoomWin<CR>
   " }
" }

" GUI Settings {
  " GVIM (here instead of .gvimrc)
  if has('gui_running')
    set guioptions-=T   ""
    set guioptions-=r   ""
    set guioptions-=R   ""
    set guioptions-=l   " remove every single stupid concept of a
    set guioptions-=L   " toolbar, menu bar, scroll bar, gay bar,
    set guioptions-=h   " etc.
    set guioptions-=b   ""
    set guioptions-=m   ""

    set transparency=0  " Don't ever have a transparent window
    set lines=40        " 40 lines of text instead of 24,
    colorscheme molokai
    if has('gui_macvim')
      set guifont=Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    endif
  else
    "set term=builtin_ansi       " Make arrow and other keys work
  endif

  if has("gui_macvim")
    " Fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert

    " looks like ass in Linux but swell on a Crapple -- watch out!
    set guifont=menlo\ bold:h12
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

" Auto-load Vimrcs {
  autocmd! BufWritePost vimrc source %
  autocmd! BufWritePost .vimrc source %
  autocmd! BufWritePost .vimrc.local source %
  autocmd! BufWritePost gvimrc source %
  autocmd! BufWritePost .gvimrc source %
  autocmd! BufWritePost .gvimrc.local source %
" }
