#!/bin/bash



# installing brew packages recursively
echo "Installing brew formulae..."
xargs brew install < ~/dotfiles//brew/brew_packages.txt

# installing brew casks recursively 
echo "Installing brew casks..."
xargs brew install --cask < ~/dotfiles/brew/brew_casks.txt
