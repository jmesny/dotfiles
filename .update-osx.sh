#!/bin/bash

echo ""
echo "####################> Updates from Brew installer <####################"
echo ""

brew tap --repair
brew update -y
brew upgrade -y
brew cleanup -s --force

echo ""
echo "####################> Updates from Pip3 installer <####################"
echo ""

pip3 install --upgrade pip setuptools wheel
pip3 install -U `pip3 list --outdated --format freeze | sed 's/==.*//'`

echo ""
echo "####################> Updates from macOS installer <###################"
echo ""

sudo softwareupdate --reset-ignore
sudo softwareupdate --schedule on
sudo softwareupdate --install --all
