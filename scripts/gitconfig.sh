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

if which git &> /dev/null; then

	# Just a reminder that the file is generated from a template
	echo "# This file is auto-generated by the 'bash-up' utility. " > "$BU_DIRECTORY/external/.gitplopconfig"
	echo "# Edit '$BU_DIRECTORY/templates/gitconfig' instead and run 'reload'." >> "$BU_DIRECTORY/external/.gitplopconfig"

	# Copy the "raw" template to the "external" directory
	cat "$BU_DIRECTORY/templates/gitconfig" >> "$BU_DIRECTORY/external/.gitplopconfig"

	# Add the github API token from the "secret" directory
	cat "$BU_DIRECTORY/private/github" >> "$BU_DIRECTORY/external/.gitplopconfig"

	# Now add the good options on the "core section" based on the current system
	echo "[core]" >> "$BU_DIRECTORY/external/.gitplopconfig"
	echo "	excludesfile = $HOME/.gitcoreignore" >> "$BU_DIRECTORY/external/.gitplopconfig"
	
	# Current system is Mac OS X
	if [ $BU_SYSTEM == "Darwin" ]; then
		
		# Add TextMate as default editor if it is found
		if which mate &> /dev/null; then
			echo "	editor = mate -w" >> "$BU_DIRECTORY/external/.gitplopconfig"
		fi
	fi

fi