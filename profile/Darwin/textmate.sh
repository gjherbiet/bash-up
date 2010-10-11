# Export the TextMate path
if [ -f /Applications/TextMate.app/Contents/MacOS/TextMate ]; then
	export TEXTMATE_PATH=/Applications/TextMate.app/Contents/MacOS/TextMate
fi

# Set TextMate as my default editor
if [ -f /usr/bin/mate ]; then
	export EDITOR='/usr/bin/mate -w'
else
	if [ -f /Applications/TextMate.app/Contents/Resources/mate ]; then
		export EDITOR='/Applications/TextMate.app/Contents/Resources/mate -w'
	fi	
fi
