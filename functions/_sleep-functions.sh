#!/bin/bash
#=============================================================================#
# Project: BASH FOUNDATION
# File:    _sleep-functions.sh
#
# sleep functions
# must be loaded in functions.sh
#=============================================================================#
function sleep_short () {
	sleep "${SLEEP_SHORT}"
}

function sleep_long () {
	sleep "${SLEEP_LONG}"
}

#=============================================================================#
# EXPORT AREA
export -f sleep_short
export -f sleep_long
