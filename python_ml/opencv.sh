mkdir -p /opt/
cd /opt/
wget https://github.com/opencv/opencv/archive/3.4.1.zip
unzip 3.4.1.zip
cd opencv-3.4.1/
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/opt/opencv-3.4.1 -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF \
-D BUILD_EXAMPLES=OFF -D WITH_FFMPEG=1 -D WITH_CUDA=0 -D PYTHON2_EXECUTABLE=/opt/anaconda2/bin/python \
-D PYTHON_INCLUDE_DIR=/opt/anaconda2/include/python2.7 -D PYTHON_INCLUDE_DIR2=/opt/anaconda2/include/python2.7 \
-D PYTHON_LIBRARY=/opt/anaconda2/lib/libpython2.7.so -D PYTHON2_PACKAGES_PATH=/opt/anaconda2/lib/python2.7 \
-D PYTHON2_NUMPY_INCLUDE_DIRS=/opt/anaconda2/lib/python2.7/site-packages/numpy/core/include ..
make -j 4
make install
cd ..
rm -rf build

