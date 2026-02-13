
# script to maintain my package and cask list, scheduled with upgrade / update. 
# will probably also automate git pushes after its executed

echo 'adding brew packages to brew_packages.txt in ~/dotfiles/brew/'

brew list --formula > brew_packages.txt


echo 'adding brew casks to brew_casks.txt in ~/dotfiles/brew/'

brew list --cask > brew_casks.txt

