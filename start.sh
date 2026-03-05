#!/bin/bash
#=============================================================================#
# Project: BASH FOUNDATION
# File:    start.sh
#
# Initial file for further experiments
#=============================================================================#

#=============================================================================#
# basic setups and checks
# error handling
set -euo pipefail
# check for root or sudo
if [[ "$(whoami)" == "root" ]]; then 
	echo -e "\e[5m\e[42m\e[37m"
	echo -e "+------------------+"
	echo -e "| root check is ok |"
	echo -e "+------------------+"
	echo -e "\e[0m"
	sleep 1
else
	echo -e "\e[5m\e[41m\e[30m"
	echo -e "+--------------------------+"
	echo -e "| !!! root check fails !!! |"
	echo -e "|                          |"
	echo -e "| restart as root          |"
	echo -e "+--------------------------+"
	echo -e "\e[0m"
	exit 1
fi
# set curren directory as PROJECT_DIR and check for dir and file structure
if [[ -f "$(pwd)/start.sh" ]]; then
	echo -e "\e[5m\e[42m\e[37m"
	echo "+-----------------+"
	echo "| init file found |"
	echo "+-----------------+"
	echo -e "\e[0m"
	sleep 1
else
	echo -e "\e[5m\e[41m\e[30m"
	echo "+----------------------------------------------------+"
	echo "| !!! wrong start folder or init file is missing !!! |"
	echo "|                                                    |"
	echo "| reload project                                     |"
	echo "+----------------------------------------------------+"
	echo -e "\e[0m"
	exit 1
fi

if [[ -f "$(pwd)/functions/functions.sh" ]]; then
	echo -e "\e[5m\e[42m\e[37m"
	echo "+---------------------------+"
	echo "| functions main file found |"
	echo "+---------------------------+"
	echo -e "\e[0m"
	sleep 1
else
	echo -e "\e[5m\e[41m\e[30m"
	echo "+---------------------------------------+"
	echo "| !!! functions main file not found !!! |"
	echo "|                                       |"
	echo "| reload project                        |"
	echo "+---------------------------------------+"
	echo -e "\e[0m"
	exit 1
fi

if [[ -f "$(pwd)/constants/constants.sh" ]]; then
	echo -e "\e[5m\e[42m\e[37m"
	echo "+---------------------------+"
	echo "| constants main file found |"
	echo "+---------------------------+"
	echo -e "\e[0m"
	sleep 1
else
	echo -e "\e[5m\e[5m\e[41m\e[30m"
	echo "+---------------------------------------+"
	echo "| !!! constants main file not found !!! |"
	echo "|                                       |"
	echo "| reload the project                    |"
	echo "+---------------------------------------+"
	echo -e "\e[0m"
	exit 1
fi

export PROJECT_DIR="$(pwd)"
#=============================================================================#
sleep 1

#clear

#=============================================================================#
# connecting modules
# constants
source ${PROJECT_DIR}/constants/constants.sh

# functions
source ${PROJECT_DIR}/functions/functions.sh

#=============================================================================#
# TESTING AREA

distro_detect_shortname
case "${DISTRO_SHORTNAME}" in
	"debian")
		echo_success "DEBIAN FOUND"
		source ${PROJECT_DIR}/configs/debian/default.sh
		;;
	*)
		echo_fail "+----------------+"
		echo_fail "| Unknown distro |"
		echo_fail "+----------------+"
		exit 1
		;;	
esac
