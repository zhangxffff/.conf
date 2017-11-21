#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s "`pwd`/vim/vimrc" "$HOME/.vimrc"
ln -s "`pwd`/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -s "`pwd`/latex/.latexmkrc" "$HOME/.latexmkrc"
