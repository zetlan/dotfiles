#!/bin/bash

cp exrc $HOME/.exrc
cat bashrc >> $HOME/.bashrc
git config --global core.excludesFile "$PWD/gitignore"
