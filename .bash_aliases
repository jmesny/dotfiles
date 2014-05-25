alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -G'
alias l='ls -G'
alias ll='ls -G -l'
alias la='ls -G -a'
alias lla='ls -G -la'
alias ddu='du --max-depth=1 -h'
alias df='df -h'
alias cls='tput reset'
alias grep='grep --color=auto'
alias scp='scp -vC'
alias ssh='ssh -vCX'
alias cll="clear;ls -l"
alias clla="clear;ls -la"
alias dpkgrep="dpkg -l | grep"
alias agu="sudo apt-get -y update && sudo apt-get -y dist-upgrade"
alias agi="sudo apt-get install"
alias acs="apt-cache search"


function psgrepkill(){
	kill `psgrep $1 | grep -v grep | awk '{print $2}'`
}

function psgrep(){
	ps aux | grep $1 | grep -v grep
}

alias ws='cd ~/Documents/workspace'
alias ft='cd ~/Documents/workspace/fluid-topics'
alias ftw='cd ~/Documents/workspace/fluid-topics/interface/fluid-topics-widgets'
alias fts='cd ~/Documents/workspace/fluid-topics/interface/fluid-topics-portal'
alias ftc='cd ~/Documents/workspace/fluid-topics-projects-configuration'
alias afs='cd ~/Documents/workspace/afs'


alias restore-terminal="osascript \
	-e 'tell application \"Terminal\"' \
	-e ' activate' \
	-e ' set requestedTabs to 4' \
	-e ' set existingTabs to number of tabs of front window' \
	-e ' repeat with i from existingTabs to requestedTabs - 1' \
	-e '   tell application \"System Events\" to keystroke \"t\" using command down' \
	-e ' end repeat' \
	-e ' do script \"afs\" in tab 1 of front window' \
	-e ' do script \"ftw\" in tab 2 of front window' \
	-e ' do script \"ftc\" in tab 3 of front window' \
	-e ' do script \"fts\" in tab 4 of front window' \
	-e 'end tell' \
"
