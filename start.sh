#!/bin/bash

if ! test -f created; then
    docker build -t streamachine .
    touch created
fi

docker run --device=/dev/video0:/dev/video0 -p 54100:54100 streamachine
#docker run -it --device=/dev/video0:/dev/video0 -p 54100:54100 streamachine /bin/bash
