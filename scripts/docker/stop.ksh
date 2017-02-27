if [ -z "$DOCKER_HOST" ]; then
   echo "ERROR: no DOCKER_HOST defined"
   exit 1
fi

if [ $# -ne 1 ]; then
   echo "$0 [0|1|2|3|4]"
   exit 1
fi

# set the definitions
INSTANCE=sf-wrapper
NAMESPACE=uvadave
NAME=$INSTANCE-$1

# stop the running instance
docker stop $NAME

# remove the instance
docker rm -f $NAME
