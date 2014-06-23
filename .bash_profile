
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/Library/Frameworks/play/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/phantomjs/latest/bin:$PATH"
export PATH="$HOME/Library/Frameworks/tests/slimerjs/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/casperjs/latest/bin:$PATH"
export PATH="$HOME/Documents/workspace/ghar/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source $HOME/Documents/workspace/ghar/ghar-bash-completion.sh
source $HOME/.bash_aliases
source $HOME/.prompt.bash


eval "$(jenv init -)"

export DOCKER_HOST="tcp://localhost:4243"
