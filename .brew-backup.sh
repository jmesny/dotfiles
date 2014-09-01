#!/bin/bash

echo "#!/bin/bash"

echo "ruby -e \"\$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)\""

echo "brew update"
echo "brew upgrade"

brew tap | while read tap; do echo "brew tap $tap"; done

brew list | while read item; do echo "brew install $item"; done

echo "brew install caskroom/cask/brew-cask"
brew cask list | while read cask; do echo "brew cask install $cask"; done

echo "brew cleanup"

if [ -n "$(brew cask list | grep alfred)" ]; then
	echo "brew cask alfred link"
fi
