export PFX=/opt/gstreamer/
export PATH=$PFX/bin:$PATH
export LD_RUN_PATH=$LD_RUN_PATH:$PFX/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PFX/lib/pkgconfig
export GST_PLUGIN_PATH=$PFX/lib/gstreamer-1.0

clone()
{
git clone http://anongit.freedesktop.org/git/gstreamer/gst-rtsp-server
git clone http://anongit.freedesktop.org/git/gstreamer/gstreamer.git
git clone https://anongit.freedesktop.org/git/gstreamer/gst-plugins-base.git
git clone https://anongit.freedesktop.org/git/gstreamer/gst-plugins-good.git
git clone https://anongit.freedesktop.org/git/gstreamer/gst-libav.git
git clone https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad.git
git clone http://cgit.freedesktop.org/gstreamer/orc/
git clone https://anongit.freedesktop.org/git/gstreamer/gstreamer-vaapi.git
git clone https://anongit.freedesktop.org/git/gstreamer/gst-plugins-ugly.git
}

go()
{
cd orc/
./autogen.sh --prefix=$PFX
make -j4 && \
sudo make install
cd ..

cd gstreamer/
./autogen.sh --enable-orc --prefix=$PFX
make -j4 && \
sudo make install
cd ..

cd gst-plugins-base/
./autogen.sh --enable-orc --prefix=$PFX
make -j4 && \
sudo make install
cd ..

cd gst-plugins-good/
./autogen.sh --enable-orc --prefix=$PFX
make -j4 && \
sudo make install
cd ..

cd gst-plugins-bad/
./autogen.sh --enable-orc --prefix=$PFX
make -j4 && \
sudo make install
cd ..

cd gst-rtsp-server/
./autogen.sh --enable-orc --prefix=$PFX
make -j4 && \
sudo make install
}


