# ensure encoding uses UTF-8`
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"

# update the path as necessary
export PATH=$PATH:/usr/local/bundle/bin

# start SOLR
solr_wrapper &
sleep 15

# start Fedora
fcrepo_wrapper &
sleep 999d
