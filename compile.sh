BASE_URL="git://source.ffmpeg.org/ffmpeg.git"

# Clone if necessary
if [ ! -d "ffmpeg" ]; then
	git clone $BASE_URL --depth 1
fi

# Patch if not already patched
cd ffmpeg &&
if [ ! -e "PATCHED" ]; then
	git am ../patches/*.patch &&
	touch PATCHED &&
	git add . && git commit -m "Patched by Myy"
fi

# Configure and die quickly if v4l2 is not enabled.
# I don't understand why the configure script don't die by itself
# when you request a feature that cannot be compiled...
./configure --enable-v4l2-request --enable-libdrm --enable-libudev --enable-shared --enable-pic | grep "v4l2_request"
if [ ! $? = 0 ]; then
	echo "Unable to enable v4l2 request support on FFmpeg"
	echo "See ffmpeg/ffbuild/config.log"
	exit
fi

# Compile
make

# You'll still have to do make install yourself !
