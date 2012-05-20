vimulacrum
==========
[vim-yuh-ley-kruhm]

/ˌvɪmyəˈleɪkrəm/

The ult-Vim-ate Vim setup! It's so good that you'll have a hard time believing it exists!

TASK LIST:

* Install vundle
* Make a list of wanted plugins


## Supported systems
- Works best with Vim 7.3

### GNU/Linux
 - Ubuntu Precise Pangolin 12.04 LTS

### Mac OS X
 - Lion (10.7)
 - Snow Leopard (10.6)

### Windows

## How to install

### linux requirements
- `sudo apt-get install vim-nox curl git`

### one-liner install script
- `curl https://raw.github.com/kelsey/vimulacrum/master/install.sh -l -o - | bash`

## Main plugins

### [NERDTree]

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim editing.  You can learn more about it with
:help NERDTree

**QuickStart** Launch using `<Leader>n`.

**Customizations**: 

* Use `<Leader>n` to toggle NERDTree
* Use `<leader>e` or `<leader>nt` to load NERDTreeFind which opens NERDTree where the current file is located.
* Hide clutter ('\.pyc', '\.git', '\.hg', '\.svn', '\.bzr')
* Treat NERDTree more like a panel than a split.

### [ctrlp]
trlp replaces the Command-T plugin with a 100% viml plugin. It provides an intuitive and fast mechanism to load files from the file system (with regex and fuzzy find), from open buffers, and from recently used files. 

**QuickStart** Launch using `<c-p>`.

## [Surround]

This plugin is a tool for dealing with pairs of "surroundings."  Examples
of surroundings include parentheses, quotes, and HTML tags.  They are
closely related to what Vim refers to as text-objects.  Provided
are mappings to allow for removing, changing, and adding surroundings.

Details follow on the exact semantics, but first, consider the following
examples.  An asterisk (*) is used to denote the cursor position.

     Old text                  Command     New text ~
     "Hello *world!"           ds"         Hello world!
     [123+4*56]/2              cs")        (123+456)/2
     "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
     if *x>3 {                 ysW(        if ( x>3 ) {
     my $str = *whee!;         vlllls'     my $str = 'whee!';

For instance, if the cursor was inside `"foo bar"`, you could type
`cs"'` to convert the text to `'foo bar'`.

There's a lot more, check it out at `:help surround` "})}</q></q>"



[Git]:http://git-scm.com
[Curl]:http://curl.haxx.se
[msysgit]:http://code.google.com/p/msysgit
[MacVim]:http://code.google.com/p/macvim/
[spf13-vim]:https://github.com/spf13/spf13-vim

[Vundle]:http://github.com/gmarik/vundle
[PIV]:http://github.com/spf13/PIV
[NERDCommenter]:http://github.com/scrooloose/nerdcommenter
[NERDTree]:http://github.com/scrooloose/nerdtree
[ctrlp]:http://github.com/kien/ctrlp.vim
[solarized]:http://github.com/altercation/vim-colors-solarized
[neocomplcache]:http://github.com/shougo/neocomplcache
[Fugitive]:http://github.com/tpope/vim-fugitive
[Surround]:https://github.com/tpope/vim-surround
[Tagbar]:http://github.com/godlygeek/tagbar
[Syntastic]:http://github.com/scrooloose/syntastic
[vim-easymotion]:http://github.com/Lokaltog/vim-easymotion
[Matchit]:http://www.vim.org/scripts/script.php?script_id=39
[Tabularize]:http://github.com/godlygeek/tabular
[EasyMotion]:https://github.com/Lokaltog/vim-easymotion

[spf13-vim-img]:http://i.imgur.com/UKToY.png
[spf13-vimrc-img]:http://i.imgur.com/kZWj1.png
[autocomplete-img]:http://i.imgur.com/90Gg7.png
[tagbar-img]:http://i.imgur.com/cjbrC.png
[fugitive-img]:http://i.imgur.com/4NrxV.png
[nerdtree-img]:http://i.imgur.com/9xIfu.png
[phpmanual-img]:http://i.imgur.com/c0GGP.png
[easymotion-img]:http://i.imgur.com/ZsrVL.png
