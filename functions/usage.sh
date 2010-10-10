#
# Disk usage per directory
#
function usage () {
	if [ -z $1 ]; then
		du -hd $1
	else
		du -hd 1
	fi
}
