#!/bin/bash

echo "#!/bin/bash"

echo "ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""

echo "brew doctor"
echo "brew update"
echo "brew upgrade"

brew tap | while read tap; do echo "brew tap $tap"; done

brew leaves | while read item; do echo "brew install $item"; done

echo "brew install caskroom/cask/brew-cask"
brew cask list | while read cask; do echo "brew cask install $cask"; done

echo "brew cleanup"

if [ -n "$(brew cask list | grep alfred)" ]; then
	echo "brew cask alfred link"
fi
