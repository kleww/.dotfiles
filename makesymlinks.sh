#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files=".bash_profile .bashrc .vimrc"      # list of files/folders to symlink in homedir

##########

# Create dotfiles_old in homedir
echo "===== Creating $olddir for backup of any existing dotfiles in ~ ====="
mkdir -p $olddir
echo "===== ...done ====="

# Change to the dotfiles directory
echo "===== Changing to the $dir directory ====="
cd $dir
echo "===== ...done ====="

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	if [ -f ~/$file ]; then
		echo "===== Moving ~/$file to $olddir ====="
		mv -f ~/$file $olddir
	fi
    echo "===== Creating symlink to $file in home directory ====="
    ln -s $dir/$file ~/$file
done

# Install vundle and plugins
echo "===== Install vundle ====="
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "===== ...done ====="
echo "===== Install vundle plugins ====="
vim +PluginInstall +qall
echo "===== ...done ====="
