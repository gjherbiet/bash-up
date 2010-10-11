#
# Add customized Perl path
#
if [ -d $HOME/lib/perl5 ]; then
	export PERL5LIB=$HOME/lib/perl5:$PERL5LIB
fi

if [ -d $HOME/share/man ]; then
	export MANPATH=$HOME/share/man:$MANPATH
fi

