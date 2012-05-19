" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" This is the vimrc for sexyvim2.
" }

" Environment {
    " Basics {
      set nocompatible        " must be first line
      set background=dark     " Assume a dark background
    "}

    " Windows Compatible {
      " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
      " across (heterogeneous) systems easier. 
      if has('win32') || has('win64')
        set
        runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
      endif
    } 

    " Setup Bundle Support {
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
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'spf13/vim-colors'
    Bundle 'tpope/vim-surround'
    Bundle 'AutoClose'
    Bundle 'kien/ctrlp.vim'
    Bundle 'spf13/vim-preview'
    "Bundle 'vim-scripts/sessionman.vim'
    " Extends % for HTML, LaTeX etc.
    Bundle 'matchit.zip'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'Lokaltog/vim-easymotion'
    " Approximate colorschemes
    "Bundle 'godlygeek/csapprox'
    "Bundle 'jistr/vim-nerdtree-tabs'
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
    ""Bundle 'Shougo/neocomplcache'

    " PHP
    Bundle 'spf13/PIV'

    " Python
    " Pick either python-mode or pyflakes & pydoc
    Bundle 'klen/python-mode'
    Bundle 'python.vim'
    Bundle 'python_match.vim'
    Bundle 'pythoncomplete'

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
