#!/bin/sh
v4l2-ctl -d /dev/video0 --set-fmt-video=width=1280,height=960,pixelformat=1 --set-parm=30
