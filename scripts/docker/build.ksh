if [ -z "$DOCKER_HOST" ]; then
   echo "ERROR: no DOCKER_HOST defined"
   exit 1
fi

rm -fr tmp/fcrepo4-* > /dev/null 2>&1
rm -fr tmp/solr-* > /dev/null 2>&1

echo "*****************************************"
echo "building on $DOCKER_HOST"
echo "*****************************************"
docker build -t uvadave/sf-wrapper .
