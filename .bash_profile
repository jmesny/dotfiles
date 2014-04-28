
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/Library/Frameworks/play/latest:$PATH"
export PATH="$HOME/Library/Frameworks/activator/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/phantomjs/latest/bin:$PATH"
export PATH="$HOME/Library/Frameworks/tests/slimerjs/latest:$PATH"
export PATH="$HOME/Library/Frameworks/tests/casperjs/latest/bin:$PATH"
export PATH="$HOME/Documents/workspace/ghar/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

source $HOME/Documents/workspace/ghar/ghar-bash-completion.sh
source $HOME/.bash_aliases

eval "$(jenv init -)"

export DOCKER_HOST="tcp://localhost:4243"

####################################################################
#                         BASH-IT !
####################################################################

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

if [ -d $BASH_IT ]; then
	if [ -d $HOME/.bash_it_themes ]; then

		if [ ! -L $BASH_IT/themes/J0n ]; then
			ln -s $HOME/.bash_it_themes/J0n $BASH_IT/themes
		fi

		# Lock and Load a custom theme file
		# location /.bash_it/themes/
		export BASH_IT_THEME="J0n"
	fi

	# Set my editor and git editor
	export EDITOR="/usr/bin/vi"
	export GIT_EDITOR="/usr/bin/vi"

	# Don't check mail when opening terminal.
	unset MAILCHECK

	# Load Bash It
	source $BASH_IT/bash_it.sh
fi
