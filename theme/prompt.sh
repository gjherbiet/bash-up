#
# Set the command line as colored
#
export CLICOLOR='1'

#
# Prompt template
#
export PS1='\[\033[00m\]\u\[\033[1;0m\]@\h\[\033[00m\]:\[\033[01;33m\]\W$(__git_ps1 "\[\033[0;36m\][%s]")\[\033[1;34m\]>\[\033[00m\] '

#
# Put current directory in terminal window/tab title
#
export PROMPT_COMMAND='echo -ne "\033]0;`hostname -s`:`pwd -P`\007";'
