export PFX=/opt/kramer/gstreamer/
export PATH=$PFX/bin:$PATH
export LD_RUN_PATH=$LD_RUN_PATH:$PFX/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PFX/lib/pkgconfig
export GST_PLUGIN_PATH=$PFX/lib/gstreamer-1.0

go()
{
cd orc/
./autogen.sh --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
cd ..

cd gstreamer/
./autogen.sh --enable-orc --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
cd ..

cd gst-plugins-base/
./autogen.sh --enable-orc --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
cd ..

cd gst-plugins-good/
./autogen.sh --enable-orc --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
cd ..

cd gst-plugins-bad/
./autogen.sh --enable-orc --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
cd ..

cd gst-rtsp-server/
./autogen.sh --enable-orc --prefix=/opt/kramer/gstreamer/
make -j4 && \
sudo make install
}

run()
{
GST_DEBUG=3 rtsp_port=8554 rtsp_folder=stream ./rtsp_h264_enc_variable.aac.ovr $1
}

dbg()
{
GST_DEBUG=3 rtsp_port=8554 rtsp_folder=stream kdbg ./bin/gst-variable-rtsp-server
}

