# Put homebrew in front of path
if which brew &> /dev/null; then
	export PATH=/usr/local/Library/Contributions/examples:/usr/local/bin:/usr/local/sbin:$PATH
fi
