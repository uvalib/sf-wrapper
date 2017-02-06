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

case $1 in
0)
   PORT_OPT="-p 8048:8983 -p 8049:8984"
   ;;
1)
   PORT_OPT="-p 8050:8983 -p 8051:8984"
   ;;
2)
   PORT_OPT="-p 8052:8983 -p 8053:8984"
   ;;
3)
   PORT_OPT="-p 8054:8983 -p 8055:8984"
   ;;
4)
   PORT_OPT="-p 8056:8983 -p 8057:8984"
   ;;
*)
   echo "$0 [0|1|2|3|4]"
   exit 1
   ;;
esac

# stop the running instance
docker stop $NAME

# remove the instance
docker rm -f $NAME

# remove the previously tagged version
docker rmi $NAMESPACE/$INSTANCE:current  

# tag the latest as the current
docker tag -f $NAMESPACE/$INSTANCE:latest $NAMESPACE/$INSTANCE:current

# run it
docker run -t -d $PORT_OPT --log-opt tag=$NAME --name $NAME --restart=always $NAMESPACE/$INSTANCE:latest
