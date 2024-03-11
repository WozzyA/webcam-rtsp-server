# REQUIRED PACKAGES (PACMAN): gstreamer gst-plugins-ugly gst-plugins-good gst-rtsp-server

CC=gcc

FLAGS_LIBS=`pkg-config --cflags --libs gstreamer-1.0 gstreamer-rtsp-server-1.0`

TARGET=rtsp-server

SRC=stream.c

$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(SRC) $(FLAGS_LIBS)

.PHONY: clean

clean:
	rm -f $(TARGET)
