#
# Easy directory cleaning
#
alias texclear='rm -f `find -E . -type f -regex ".*[^/]+\.(bbl|blg|maf|mtc|mtc0|log|aux|fdb.*|synctex\.gz|tns|out|pdfsync)$"`'
alias pyclear='rm -f `find . -type f -name "*.pyc"`'
alias svnclear='rm -rf `find . -type d -name ".svn"`'
