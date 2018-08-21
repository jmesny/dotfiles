export WS="$HOME/Workspace"
export PATH="$WS/ghar/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/Applications/Firefox.app/Contents/MacOS:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

function pyenv {
	export PYTHONPATH="$WS/python-ws-api/src"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/common/src"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/connectors"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/customer-tools"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/fluid-api/src"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/indexing"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/internal"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/lib"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/pdf-server"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/reply"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/scheduler"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/standalone"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/python/tools"
	export PYTHONPATH="$PYTHONPATH:$WS/fluid-topics/tests"
	export PYTHONPATH="$PYTHONPATH:$WS/jenkins-jobs"
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

alias update-osx="$HOME/.update-osx.sh"


alias backup-brew="$HOME/.backup-brew.sh > $HOME/Dropbox/Antidot/brew-restore.sh && chmod +x $HOME/Dropbox/Antidot/brew-restore.sh"

function launch_brew_and_backup() {
    /usr/local/bin/brew $@
    while test $# -gt 0; do
        case "$1" in
            install|uninstall) backup-brew
                ;;
        esac
        shift
    done
}

alias brew=launch_brew_and_backup

alias backup-pip3="$HOME/.backup-pip3.sh > $HOME/Dropbox/Antidot/pip3-restore.sh && chmod +x $HOME/Dropbox/Antidot/pip3-restore.sh"

function launch_pip3_and_backup() {
    /usr/local/bin/pip3 $@
    while test $# -gt 0; do
        case "$1" in
            install|uninstall) backup-pip3
                ;;
        esac
        shift
    done
}

alias pip3=launch_pip3_and_backup

alias backup-workspace="$HOME/.backup-workspace.sh > $HOME/Dropbox/Antidot/workspace-restore.sh && chmod +x $HOME/Dropbox/Antidot/workspace-restore.sh"

function launch_git_and_backup() {
    command="/usr/local/bin/git"
    for arg in "$@"; do
        if [[ ${arg} =~ [[:space:]] ]]; then
            arg=\"${arg}\"
        fi
        command="${command} ${arg}"
    done
    eval ${command}
    while test $# -gt 0; do
        case "$1" in
            clone|remote) backup-workspace
                ;;
        esac
        shift
    done
}

alias git=launch_git_and_backup

# requires `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# requires `brew install jenv`
export JENV_ROOT=/usr/local/var/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


source ${WS}/ghar/ghar-bash-completion.sh
source $HOME/.prompt.bash

export GIT_MERGE_AUTOEDIT=no


# https://github.com/playframework/playframework/blob/master/documentation/manual/gettingStarted/IDE.md#navigate-from-an-error-page-to-the-source-code
export PLAY_EDITOR="http://localhost:63342/api/file/?file=%s&line=%s"
