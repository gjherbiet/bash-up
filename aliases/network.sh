#
# Network-related shortcuts
#
alias pingg='ping www.google.fr'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ping="ping -c 5"