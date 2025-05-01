#! /bin/bash

#name for unique/temporary file to hold environment variables.
ENVFILE=/tmp/$(uuidgen)

# save PUID & PGID variables for linuxserver.io docker setup.
cat > $ENVFILE << DONE
PUID=$(id -u)
PGID=$(id -g)
SERVERS=$(pwd)
DONE

sudo docker compose --env-file $ENVFILE $@
