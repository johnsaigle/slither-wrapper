# slither-wrapper

Wrapper for launching Slither within the [Eth Security Toolbox](https://github.com/trailofbits/eth-security-toolbox/blob/master/Dockerfile) docker container on hardhat-based projects.

## Why?

I tried to scan a hardhat-based project using the eth-security-toolbox that failed because
hardhat was not installed within the image.

This script installs `hardhat` locally at the container mountpoint and then 
runs Slither on a directory of your choosing. 

## Usage

`slither-wrapper.sh path/to/repo <dir/to/scan>`

Make sure the Docker daemon is running.
