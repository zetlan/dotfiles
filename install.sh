#!/bin/bash

function is_installed {
    if test -f $1 && grep -q DOTFILES $1; then
        return 0
    else 
        return 1
    fi
}

function install {
    local file=$1
    local cmd=$2
    if is_installed $file; then
        echo "$file already installed"
    else
        echo "Installing $file..."
        $cmd
    fi
}

install $HOME/.bashrc "cp bashrc $HOME/.bashrc"
install $HOME/.zsh_functions "cp zsh_functions $HOME/.zsh_functions"
install $HOME/.exrc "cp exrc $HOME/.exrc"
install $HOME/.oh-my-zsh/custom/itermocil-auto-complete.zsh "cp itermocil/itermocil-auto-complete.zsh $HOME/.oh-my-zsh/custom/itermocil-auto-complete.zsh"

if test -d "$HOME/.itermocil"; then
    echo "Itermocil directory already exists"
else
    echo "Creating Itermocil directory"
    mkdir $HOME/.itermocil
fi

echo "Refreshing itermocil configs"
cp itermocil/*.yml $HOME/.itermocil

git config --global core.excludesFile "$PWD/gitignore"

