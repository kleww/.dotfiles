#!/bin/bash

# URL: https://github.com/kleww/.dotfiles
# Author: Kevin Viricel
# Description: This script install all dotfiles on the current system

# ------------------------------------------------------------------------------
# Variables

dir=~/.dotfiles                         # dotfiles directory
olddir=~/.dotfiles_old                  # old dotfiles backup directory
files=".bash_profile .bashrc .vimrc"    # list of files/folders to symlink

# ------------------------------------------------------------------------------
# Settup directories

echo "===== Creating $olddir for backup of any existing dotfiles in ~ ====="
mkdir -p $olddir
echo "===== ...done ====="

echo "===== Changing to the $dir directory ====="
cd $dir
echo "===== ...done ====="

# ------------------------------------------------------------------------------
# Backup files then create symlinks

for file in $files; do
  if [ -f ~/$file ]; then
    echo "===== Moving ~/$file to $olddir ====="
    mv -f ~/$file $olddir
  fi
  echo "===== Creating symlink to $file in home directory ====="
  ln -s $dir/$file ~/$file
done

# ------------------------------------------------------------------------------
# Install vundle and plugins

echo "===== Install vundle ====="
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "===== ...done ====="
echo "===== Install vundle plugins ====="
vim +PluginInstall +qall
echo "===== ...done ====="
echo "===== Build YCM ====="
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer
echo "===== ...done ====="
