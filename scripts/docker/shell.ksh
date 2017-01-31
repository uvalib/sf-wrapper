if [ -z "$DOCKER_HOST" ]; then
   echo "ERROR: no DOCKER_HOST defined"
   exit 1
fi

docker run -t -i -p 8052:8983 -p 8053:8984 uvadave/sf-wrapper /bin/bash -l
