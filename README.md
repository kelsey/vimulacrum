vimulacrum
==========

### The ult-Vim-ate Vim setup! It's so good that you'll have a hard time believing it exists!
&nbsp;

**vim·u·la·crum** [vim-y*uh*-**ley**-kr*uh*m] /ˌvɪmyəˈleɪkrəm/

***noun, plural*** **vim·u·la·cra** [-kr*uh*] /-krə/

1. a slight, unreal, or superficial likeness or semblance.

2. an effigy, image, or representation: *a vimulacrum of Vim.*

**Origin:**

2012; Unix-speak *v(im)* a highly configurable text editor built to enable efficient text editing +
Latin *(s)imulācrum* likeness, image, equivalent to *simulā* ( *re* ) to <u>simulate</u> + -*crum* instrumental suffix

> *The vimulacrum is never what hides the truth - it is truth that hides the fact that there is none.*

> *The vimulacrum is true.*

> &mdash; Richard Stallman

## Vim philosophy

### easy installation
- for system admins who need to install fresh new systems often

### keep vim lightweight
- not everyone has a Corei7 CPU and 8GB of RAM
- should be usable over ssh, putty and teraterm

### adherence to original Vim's keybindings
- don't use too many plugins that remap keys
- don't over-customize to the point where you can't use vanilla Vim anymore

## Supported systems
- Works best with Vim 7.3

### GNU/Linux
 - Ubuntu Precise Pangolin 12.04 LTS

### Mac OS X
 - Lion (10.7)
 - Snow Leopard (10.6)

### Windows
 - TODO

## How to install

### linux requirements
 - vim: to access the full set features, we recommend vim version 7.3
 - git
 - curl
 - ack
 - ctags

#### Debian/Ubuntu
- for servers: `sudo apt-get install vim-nox curl git ack-grep exuberant-ctags`
- for desktops: `sudo apt-get install vim-gnome curl git ack-grep exuberant-ctags`

#### Fedora/Red Hat/CentOS
- for servers: `yum install vim curl git ack ctags`
- for desktops: `yum install vim-gnome curl git ack ctags`

### in order to use JavaScript syntax checking via the syntastic plugin:

#### Mac OS X
- install `nodejs` using either MacPorts, Homebrew, or Fink
- install `npm`, or node package manager manually. the instructions are at the [github page for npm](https://github.com/isaacs/npm).
- using `npm`, install jslint globally:
`sudo npm install -g jslint`

### one-liner install script
- `curl https://raw.github.com/kelsey/vimulacrum/master/install -l -o - | bash`

## Notes on shortcut keys
- `C-x` means control key + 'x' key
- `<leader>` key means space in our case

## Main plugins

### [ctrlp]
Ctrlp replaces the Command-T plugin with a 100% viml plugin. It provides an intuitive and fast mechanism to load files from the file system (with regex and fuzzy find), from open buffers, and from recently used files. 

**QuickStart** Launch using `<leader>f`.

### [NERDTree]

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim editing.  You can learn more about it with
:help NERDTree

**QuickStart** Launch using `<Leader>n`.

**Customizations**: 

* Use `<Leader>n` to toggle NERDTree
* Use `<leader>nt` to load NERDTreeFind which opens NERDTree where the current file is located.
* Hide clutter ('\.pyc', '\.git', '\.hg', '\.svn', '\.bzr')
* Treat NERDTree more like a panel than a split.

### [Surround]

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

### [AutoClose]
Automatically places closing symbols such as brackets and paretheses.

### [vim-markdown-preview]
- To preview, `:Mw`
- Note - Mac only

### [ZoomWin]
Zoom in on a particular viewport
- To invoke, `<leader> z`

### [Matchit]
Extends '%' functionality.

### [Ack.vim]
- To use, `:Ack`

### [Syntastic]
- this does syntax checking
- if you see the red arrors, do `:Errors` to see the syntax errors

### [Fugitive]
- the most useful command is: `:Gblame`

### [NERDCommenter]
- move the cursor to the line you want to comment out, then use `<leader> cc`

### [Tabular]
- this [vimcast]{http://vimcasts.org/episodes/aligning-text-with-tabular-vim/} explains it best: 
- To align the via the :s in each line, select the lines and do `<leader> a:`

### [Tagbar]
- to toggle the sidebar: `<leader> tt`


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
[Tabular]:http://github.com/godlygeek/tabular
[EasyMotion]:https://github.com/Lokaltog/vim-easymotion

[spf13-vim-img]:http://i.imgur.com/UKToY.png
[spf13-vimrc-img]:http://i.imgur.com/kZWj1.png
[autocomplete-img]:http://i.imgur.com/90Gg7.png
[tagbar-img]:http://i.imgur.com/cjbrC.png
[fugitive-img]:http://i.imgur.com/4NrxV.png
[nerdtree-img]:http://i.imgur.com/9xIfu.png
[phpmanual-img]:http://i.imgur.com/c0GGP.png
[easymotion-img]:http://i.imgur.com/ZsrVL.png

[AutoClose]:https://github.com/Townk/vim-autoclose
[ZoomWin]:http://www.vim.org/scripts/script.php?script_id=508
[vim-markdown-preview]:https://github.com/nelstrom/vim-markdown-preview
[Ack.vim]:https://github.com/mileszs/ack.vimc
