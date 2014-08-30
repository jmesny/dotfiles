#!/bin/bash

echo ""
echo "####################> Updates from OS X installer <####################"
echo ""

sudo softwareupdate --reset-ignore
sudo softwareupdate --schedule on
sudo softwareupdate -v --install --all

echo ""
echo "####################> Updates from Brew installer <####################"
echo ""

brew update -y
brew upgrade -y
brew cleanup -s --force
brew tap --repair