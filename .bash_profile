
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/Library/Frameworks/play/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/phantomjs/latest/bin:$PATH"
export PATH="$HOME/Library/Frameworks/tests/slimerjs/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/casperjs/latest/bin:$PATH"
export PATH="$HOME/Documents/workspace/ghar/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"


source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

# requires `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

source $HOME/Documents/workspace/ghar/ghar-bash-completion.sh
source $HOME/.bash_aliases
source $HOME/.prompt.bash


eval "$(jenv init -)"

export DOCKER_HOST="tcp://localhost:4243"
export GIT_MERGE_AUTOEDIT=no
