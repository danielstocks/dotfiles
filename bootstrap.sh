#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/Projects/private/dotfiles
olddir=~/dotfiles_old
files=".bash_profile .editorconfig .git-completion.bash .git-prompt.sh .hgignore .hushlogin .tmux.conf .vimrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# Only copy the original .vim folder, treat it like you would node_modules
cp -R $dir/.vim ~/.vim

source ~/.bashrc
