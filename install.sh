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
echo "done!"

printf "* Cloning the vimulacrum repository onto your machine..."
git clone --recursive -b 3.0 http://github.com/kelsey/vimulacrum.git $install_directory
mkdir -p $install_directory/.vim/bundle
ln -s $install_directory/.vimrc $HOME/.vimrc
ln -s $install_directory/.vim $HOME/.vim
echo "done!"

printf "* Installing Vundle..."
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
echo "done!"

printf "* Installing plugins using Vundle..."
vim +BundleInstall! +BundleClean +q
echo "done!\n\n*** Enjoy! The vimulacrum is true! ***\n"
