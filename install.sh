#!/bin/bash
############################################################################
# Copyright 2010 Guillaume-Jean Herbiet
# <guillaume-jean@herbiet.net> - <http://www.herbiet.net>
# 
# This file is part of bash-up.
# 
# bash-up is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# bash-up is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with bash-up.  If not, see <http://www.gnu.org/licenses/>.
############################################################################

#---------------------------------------------------------------------------
# Utility functions
#

# Say something on behalf of bash-up
# @param array of things to say
function say () {
	echo "[bash-up]" $@
}

# Warn about and incorrect operation
# @param array of thins to say
function oops () {
	say "Warning: " $@ >&2
}

# Exit function/program with the given error code and message
# @param a string to say
# @param an int as exit code
function fail () {
	say "Error: " $1 >&2
	exit $2;
}

function backup () {
	if [ -z $1 ]; then
		fail "backup requires the file path to be given as argument" 1
	fi
	if [ -e $1 ]; then
		mv -f $1 $1.bash-up_backup
		if [ $? -gt 0 ]; then
			fail "Unable to perform backup of $1: $!" $?
		fi
	fi
}

function link_template () {
	if [[ -z $1  || -z $2 ]]; then
		fail "link requires the source and target file paths to be given as argument" 1
	fi
	ln -s $1 $2
	if [ $? -gt 0 ]; then
		fail "Unable to link $1 to $2: $!" 2
	fi
}

function set_install_dir () {
	if [ -z $1 ]; then
		fail "set_install_dir requires the path of file to update to be given as argument" 1
	fi
	REPLACEMENT="s,export BU_DIRECTORY=.*,export BU_DIRECTORY=${BU_INSTALL_DIRECTORY},g"
	sed "$REPLACEMENT" $1 > tmp && mv -f tmp $1
	
}

#---------------------------------------------------------------------------

#---------------------------------------------------------------------------
# Main install script
#

#
# Get the current working directory
#
BU_INSTALL_DIRECTORY=`pwd`
say "Using $BU_INSTALL_DIRECTORY as installation source directory."

#
# Backup the original configuration files if existing
#
say "Backing up your current configuration files."
backup $HOME/.profile
backup $HOME/.bashrc
backup $HOME/.bash_profile

#
# Update the install directory variable in the configuration files
#
say "Updating bash-up configuration files with your installation source directory."
set_install_dir $BU_INSTALL_DIRECTORY/profile_template
set_install_dir $BU_INSTALL_DIRECTORY/bashrc_template

#
# Link bash-up provided templates with the configuration files
#
say "Linking bash-up configuration files to your home."
link_template $BU_INSTALL_DIRECTORY/profile_template $HOME/.profile
link_template $BU_INSTALL_DIRECTORY/bashrc_template $HOME/.bashrc

say "Done! To use bash-up, add your configuration files in $BU_INSTALL_DIRECTORY/profile"
say "or in $BU_INSTALL_DIRECTORY/default"
say "or create new section directories in $BU_INSTALL_DIRECTORY."

#---------------------------------------------------------------------------
