#!/bin/bash

function is_installed {
    if test -f $1 && grep -q DOTFILES $1; then
        return 0
    else 
        return 1
    fi
}

function install {
    local dest=$1
    local src=$2
    if is_installed $dest; then
        echo "$dest already installed"
    else
        echo "Installing $dest"
        cat $src | tee -a $dest
    fi
}

install $HOME/.bashrc bashrc
install $HOME/.zsh_functions zsh_functions
install $HOME/.exrc exrc
install $HOME/.oh-my-zsh/custom/itermocil-auto-complete.zsh itermocil/itermocil-auto-complete.zsh

if test -d "$HOME/.itermocil"; then
    echo "Itermocil directory already exists"
else
    echo "Creating Itermocil directory"
    mkdir $HOME/.itermocil
fi

echo "Refreshing itermocil configs"
cp itermocil/*.yml $HOME/.itermocil

git config --global core.excludesFile "$PWD/gitignore"

