#include <gst/gst.h>
#include <gst/rtsp-server/rtsp-server.h>

int main(int argc, char *argv[]) {
    GstRTSPServer *server;
    GstRTSPMountPoints *mounts;
    GstRTSPMediaFactory *factory;

    gst_init(&argc, &argv);

    server = gst_rtsp_server_new();
    mounts = gst_rtsp_server_get_mount_points(server);

    factory = gst_rtsp_media_factory_new();
    gst_rtsp_media_factory_set_launch(factory, "( v4l2src device=/dev/video0 ! image/jpeg,width=1280,height=960,framerate=30/1 ! jpegdec ! videoconvert ! x264enc tune=zerolatency ! rtph264pay name=pay0 pt=96 )");

    gst_rtsp_mount_points_add_factory(mounts, "/stream", factory);
    g_object_unref(mounts);

    gst_rtsp_server_set_service(server, "54100");

    gst_rtsp_server_attach(server, NULL);

    g_print("Stream ready at rtsp://127.0.0.1:54100/stream\n");
    g_main_loop_run(g_main_loop_new(NULL, FALSE));

    return 0;
}
