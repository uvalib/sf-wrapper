# ensure encoding uses UTF-8`
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"

# configure SOLR memory pool
export SOLR_HEAP=1g

# update the path as necessary
export PATH=$PATH:/usr/local/bundle/bin

# start SOLR
solr_wrapper &
sleep 15

# start Fedora
fcrepo_wrapper &
sleep 999d
