#!/bin/bash

# ZSH shell, may not be enabled by default
ln -sb ~/dotfiles/zshrc ~/.zshrc

# In case I need to use Bash
ln -sb ~/dotfiles/bash_profile ~/.bash_profile
ln -sb ~/dotfiles/bashrc ~/.bashrc
ln -sb ~/dotfiles/bashrc_custom ~/.bashrc_custom

# Tabs in a terminal 
ln -sb ~/dotfiles/screenrc ~/.screenrc

# Emacs
if [ -d .emacs.d/ ]; then
	mv .emacs.d .emacs.d~
fi
ln -s ~/dotfiles/emacs.d ~/.emacs.d

# No .profile
if [ -e ~/.profile ]; then
	mv ~/.profile ~/.profile~
fi