#!/bin/bash

echo ""
echo "####################> Updates from Brew installer <####################"
echo ""

brew tap --repair
brew update -y
brew upgrade -y
brew cleanup -s --force

echo ""
echo "####################> Updates from OS X installer <####################"
echo ""

sudo softwareupdate --reset-ignore
sudo softwareupdate --schedule on
sudo softwareupdate --install --all
