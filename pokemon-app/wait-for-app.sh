#!/bin/sh

APP_SERVER=${1:-"localhost"}
APP_PORT=${2:-"3001"} # default one

echo ""
echo "Waiting for pokemon-app at ${APP_SERVER} ${APP_PORT}..."
wait_time=1
while ! nc -z ${APP_SERVER} ${APP_PORT}; do
   sleep ${wait_time}
   echo "Waiting ${wait_time} more secs for for pokemon-app."
done
sleep ${wait_time}
echo "...pokemon-app ready at ${APP_SERVER} ${APP_PORT}."
echo ""
