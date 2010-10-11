# Add Java links
if [ -d /usr/local/java ]; then
	export JAVA_HOME=/usr/local/java
	export CLASSPATH=$JAVA_HOME/lib
	export PATH=$PATH:$JAVA_HOME/bin
fi

