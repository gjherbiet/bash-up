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

#
# Information about this particular machine
#
export BU_SYSTEM=`uname -s`
export BU_HOSTNAME=`hostname -s`

#
# Function to load all the files required by this particular machine
# under the requested section
# @param section name
#
function source_section () {
	if [ -z $1 ]; then
		fail "source_matching_files requires the section name to be given as argument" 2
	fi
	source_files $BU_DIRECTORY/$1
	source_files $BU_DIRECTORY/$1/$BU_SYSTEM
	source_files $BU_DIRECTORY/$1/$BU_SYSTEM/$BU_HOSTNAME
}

#
# Source the files of the given directory
# @param path of directory to browse
#
function source_files () {
	if [ -z $1 ]; then
		fail "source_files requires the directory path to be given as argument" 2
	fi
	
	if [ ! -d $1 ]; then
		oops "Directory $1 does not exist!"
	else
		find $1 -type f -maxdepth 1 | while read FILE
		do
			echo "$FILE"
		done
	fi
}

#
# Soucre the bash configuration file
#
function source_bashrc () {
	local found=0
	for BASHFILE in $HOME/.bashrc $HOME/.bash_profile;
	do
		if [ -f $BASHFILE ]; then
			echo $BASHFILE
			found=0
		fi
	done
	
	if [ $found -lt 1 ]; then
		oops "Unable to load your bash configuration file."
	fi
}

#---------------------------------------------------------------------------
# Output functions
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
#---------------------------------------------------------------------------
