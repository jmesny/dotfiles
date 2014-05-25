#!/usr/bin/env bash

# This prompt configuration uses parts of the https://github.com/revans/bash-it project

source $HOME/.bashit.base.theme.bash
source $HOME/.bashit.colors.theme.bash



DEFAULT_COLOR="${white}"
REF_COLOR="${purple}"

# SCM prompts
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_THEME_PROMPT_PREFIX=' on '
SCM_THEME_PROMPT_SUFFIX=''

# Max length of PWD to display
MAX_PWD_LENGTH=20

# Max length of Git Hex to display
MAX_GIT_HEX_LENGTH=7



function git_prompt_info() {
    if [[ -n $(git status -s 2> /dev/null |grep -v ^# |grep -v "working directory clean") ]]; then
        state=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    else
        state=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    fi
    prefix=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
    suffix=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    commit_id=$(git rev-parse HEAD 2>/dev/null) || return

    echo -e "$prefix${REF_COLOR}${ref#refs/heads/}:${DEFAULT_COLOR} ${commit_id:0:$MAX_GIT_HEX_LENGTH}$state$suffix"
}


# Displays last X characters of pwd 
function limited_pwd() {

    # Replace $HOME with ~ if possible 
    RELATIVE_PWD=${PWD/#$HOME/\~}

    local offset=$((${#RELATIVE_PWD}-$MAX_PWD_LENGTH))

    if [ $offset -gt "0" ]
    then
        local truncated_symbol="..."
        TRUNCATED_PWD=${RELATIVE_PWD:$offset:$MAX_PWD_LENGTH}
        echo -e "${truncated_symbol}/${TRUNCATED_PWD#*/}"
    else
        echo -e "${RELATIVE_PWD}"
    fi
}


# Displays the current prompt
function prompt() {
    local UC=${white}
    [ $UID -eq "0" ] && UC=${red}

	local uh=`echo -n $(whoami)@; uname -n | sed 's/.local/::/' | sed 's/.produit.aix/::/'`
	local len=${#uh}
	local scm=$(scm_prompt_info)

	if [ -z "${scm}" ]
	then 
		PS1="\n${cyan}\\--(${purple}\d${cyan})--(${purple}\T${cyan})--(${purple}$(limited_pwd)${cyan})--/\n\n${UC}    \u${white}@\h::${reset_color} "
	else
		PS1="\n${cyan}\\--(${purple}\d${cyan})--(${purple}\T${cyan})--(${purple}$(limited_pwd)${cyan})--(${purple}$(scm_char)$(scm_prompt_info)${cyan})--/\n\n${UC}    \u${white}@\h::${reset_color} "
	fi
    PS2="${white}    $(printf "%${len}s" '  ----->::')${reset_color} "
}



export PROMPT_COMMAND=prompt