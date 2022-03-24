#!/usr/bin/env bash

# NOTE: Make sure docker daemon is running

set -e

# The directory on the local filesystem to be mounted into docker
if [ -z $1 ]; then
    echo 'Provide the folder to mount into docker'
else
    repo=$1
fi

# Optionally provide a directory to scan. Otherwise scans root of $target
if [ -z $2 ]; then
    target='.'
else
    target=$2
fi
echo $dir

docker pull trailofbits/eth-security-toolbox

mnt='/code'

cmd="npm install hardhat ; slither $target"

# Install hardhat locally in mount folder, then run slither
# Takes a long time
docker run -d -v $repo:/$mnt -w $mnt trailofbits/eth-security-toolbox
cid=$(docker ps | grep trailofbits | cut -d ' ' -f 1)


# get container id
echo "docker exec $cid \"$cmd\"";
docker exec $cid bash -c "$cmd"

# clean up
docker kill $cid
