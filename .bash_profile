export WS="$HOME/Documents/workspace"
export PATH="$WS/ghar/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/Applications/Firefox.app/Contents/MacOS:$PATH"

function pyenv {
	export PYTHONPATH="$WS/python-ws-api/src"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/indexing"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/lib"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/pafconfig"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/reply"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/saas-tools"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/standalone"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/tools"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/tests/ui/suites"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/internal"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/tests"
	export PYTHONPATH="$PYTHONPATH:$WS/afstestframework/src"
	export PYTHONPATH="$PYTHONPATH:$WS/jenkins-jobs"
}

function ft_find_java_home {
	return $JAVA_HOME
}

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ls="ls -G"
alias ll="ls -G -l"
alias la="ls -G -a"
alias lla="ls -G -la"
alias grep="grep --color=auto"
alias scp="scp -vC"
alias ssh="ssh -vC"

alias ws="cd $WS"
alias ft="cd $WS/fluid-topics"
alias fti="cd $WS/fluid-topics/interface"
alias fts="cd $WS/fluid-topics/interface/fluid-topics-server"
alias ftt="cd $WS/fluid-topics-projects-configuration"


alias restore-terminal="osascript \
    -e 'tell application \"Terminal\"' \
    -e ' activate' \
    -e ' set requestedTabs to 3' \
    -e ' set existingTabs to number of tabs of front window' \
    -e ' repeat with i from existingTabs to requestedTabs - 1' \
    -e '   tell application \"System Events\" to keystroke \"t\" using command down' \
    -e ' end repeat' \
    -e ' do script \"fts\" in tab 1 of front window' \
    -e ' do script \"fti\" in tab 2 of front window' \
    -e ' do script \"ftt\" in tab 3 of front window' \
    -e 'end tell' \
"

alias update-osx="~/.update-osx.sh"
alias brew-backup="~/.brew-backup.sh > ~/Dropbox/brew-restore.sh"

function launch_brew_and_backup() {
    brew $@
    while test $# -gt 0
    do
        case "$1" in
            install|uninstall) brew-backup
                ;;
        esac
        shift
    done
}

alias brew=launch_brew_and_backup


# requires `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# requires `brew install jenv`
export JENV_ROOT=/usr/local/var/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


source $WS/ghar/ghar-bash-completion.sh
source $HOME/.prompt.bash

export GIT_MERGE_AUTOEDIT=no


# https://github.com/playframework/playframework/blob/master/documentation/manual/gettingStarted/IDE.md#navigate-from-an-error-page-to-the-source-code
export PLAY_EDITOR="http://localhost:63342/api/file/?file=%s&line=%s"
