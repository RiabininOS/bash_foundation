#!/bin/bash
#=============================================================================#
# Project: BASH FOUNDATION
# File:    _echo-functions.sh
#
# colored echo
# must be loaded in functions.sh
#=============================================================================#

function echo_default () {
	echo -en "${ECHO_CLEAR}"
}

function echo_success () {
	echo -en "${ECHO_BOLD}${ECHO_BG_GREEN}${ECHO_FG_WHITE}"
	echo -e ">>> ${1}"
	echo_default
}

function echo_info () {
	echo -en "${ECHO_BOLD}${ECHO_BG_YELLOW}${ECHO_FG_BLACK}"
	echo -e ">>> ${1}"
	echo_default
}

function echo_fail () {
	echo -en "${ECHO_BLINK}${ECHO_BOLD}${ECHO_BG_RED}${ECHO_FG_WHITE}"
	echo -e ">>> ${1}"
	echo_default
}


#=============================================================================#
# EXPORT AREA
export -f echo_default
export -f echo_success
export -f echo_info
export -f echo_fail
