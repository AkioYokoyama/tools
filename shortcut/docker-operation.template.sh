#!/bin/bash
command=$1
container=$2
path=/  # Change to the appropriate path

cd $path 

if [ $command == "up" ]; then
    docker-compose $command -d
elif [ -n "$container" ]; then
    docker-compose $command $container
else
    docker-compose $command
fi
