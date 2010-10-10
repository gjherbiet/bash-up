#
# GIT stuff in user prompt
#
if which git &> /dev/null; then
	export GIT_PS1_SHOWDIRTYSTATE=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWSTASHSTATE=1
else
	alias __git_ps1='echo 0 > /dev/null'
fi
