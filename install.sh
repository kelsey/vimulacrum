#!/usr/bin/env sh

install_directory="$HOME/.vimulacrum"

warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

echo "\n*** Vimulacrum commences now! ***\n"

printf "* Backing up your current Vim configuration..."
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done
echo "done!\n"

printf "* Cloning the vimulacrum repository onto your machine..."
git clone --recursive git@github.com:kelsey/vimulacrum.git $install_directory
mkdir -p $install_directory/vim/bundle
ln -s $install_directory/vimrc $HOME/.vimrc
ln -s $install_directory/vim $HOME/.vim
echo "done!\n"

printf "* Installing Vundle..."
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
echo "done!\n"

printf "* Installing plugins using Vundle..."
vim +BundleInstall! +BundleClean +q
echo "done!\n\n*** Enjoy! The vimulacrum is true! ***\n"
