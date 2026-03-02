#!/bin/bash
#
#=============================================================================#
# Project: BASH FOUNDATION
# File:    _distro-detect.sh
#
# detecting current distro
# must be loaded in functions.sh
#=============================================================================#

function distro_detect_shortname () {
  DISTRO_SHORTNAME=$(grep "^ID=" /etc/os-release)
  DISTRO_SHORTNAME=${DISTRO_SHORTNAME:3}
  export DISTRO_SHORTNAME
}

#=============================================================================#
# EXPORT AREA
export -f distro_detect_shortname
