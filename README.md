# Webcam RTSP server

Some scripts to quickly get an RTSP server running using your webcam (to make your webcam usable with [Moducam](https://github.com/Moducam/moducam), for example)

## Running
### Method 1
- Make sure you have these packages installed: gstreamer gst-plugins-ugly gst-plugins-good gst-rtsp-server
- Optionally change setv4l2.sh to your liking and run it
- `make` and run with `./rtsp-server`

### Method 2 - Docker
- Make sure you have docker installed and docker.socket running
- Run `./start.sh`

## Notes
If your webcam isn't on /dev/video0, you'll need to adjust the stream.c source file. If you changed the resolution in setv4l2.sh, you'll also need to modify stream.c to reflect this.
