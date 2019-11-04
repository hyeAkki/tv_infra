#!/bin/bash
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=hiakki
# image name
IMAGE=my-nginx

loc=$(dirname "$0")
cd $PWD/$loc


git clone https://github.com/hyeAkki/tricksvibe.git app
cp ../test.php app/
docker build -t $USERNAME/$IMAGE .
rm -rf app