#!/bin/bash

function is_vagrant {
    local hostname=`hostname`
    if test "$hostname" = "dev.zola"; then
        return 0
    else
        return 1
    fi
}

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

if is_vagrant; then
    echo "*** Installing to vagrant"
    install $HOME/.bashrc bashrc
else
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
    echo "*** Installing to host"
    cp zsh_functions $ZSH_CUSTOM/dotfiles.zsh
    install $ZSH_CUSTOM/itermocil-auto-complete.zsh itermocil/itermocil-auto-complete.zsh
    if test -d "$HOME/.itermocil"; then
        echo "Itermocil directory already exists"
    else
        echo "Creating Itermocil directory"
        mkdir $HOME/.itermocil
    fi

    echo "Refreshing itermocil configs"
    cp itermocil/*.yml $HOME/.itermocil
fi

install $HOME/.exrc exrc
git config --global core.excludesFile "$WEB_DIR/dotfiles/gitignore"

