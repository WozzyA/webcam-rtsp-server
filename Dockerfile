FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm gcc pkgconf gstreamer gst-plugins-ugly gst-plugins-good gst-rtsp-server base-devel v4l-utils

WORKDIR /app

COPY stream.c /app/stream.c
COPY Makefile /app/Makefile
COPY setv4l2.sh /app/setv4l2.sh

RUN make

EXPOSE 54100

#CMD ["/bin/sh", "-c", "./rtsp-server"]
CMD ["/bin/sh", "-c", "./setv4l2.sh && ./rtsp-server"]