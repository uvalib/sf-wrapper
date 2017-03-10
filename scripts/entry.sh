# ensure encoding uses UTF-8`
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"

# configure SOLR memory pool
export SOLR_HEAP=2048m

# update the path as necessary
export PATH=$PATH:/usr/local/bundle/bin

# start SOLR
solr_wrapper &
sleep 15

# start Fedora
fcrepo_wrapper &

# some housekeeping
oom_script=$APP_HOME/tmp/solr/bin/oom_solr.sh
if [ -f $oom_script ]; then
   chmod +x $oom_script
fi

# sleep forever
sleep 999d
