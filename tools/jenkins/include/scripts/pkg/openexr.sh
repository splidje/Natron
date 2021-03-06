#!/bin/bash

# see ilmbase.sh
EXR_TAR="openexr-${EXR_VERSION}.tar.gz"
if download_step; then
    download "$EXR_SITE" "$EXR_TAR"
fi
if build_step && { force_build || { [ ! -s "$SDK_HOME/lib/pkgconfig/OpenEXR.pc" ] || [ "$(pkg-config --modversion OpenEXR)" != "$EXR_VERSION" ]; }; }; then    
    start_build
    untar "$SRC_PATH/$EXR_TAR"
    pushd "openexr-${EXR_VERSION}"
    env PATH="$SDK_HOME/bin:$PATH" ./bootstrap
    #mkdir build;cd build
    # cmake .. -DCMAKE_C_FLAGS="$BF" -DCMAKE_CXX_FLAGS="$BF -I${SDK_HOME}/include/OpenEXR" -DCMAKE_LIBRARY_PATH="${SDK_HOME}/lib" -DCMAKE_SHARED_LINKER_FLAGS="-L${SDK_HOME}/lib" -DCMAKE_EXE_LINKER_FLAGS="-L${SDK_HOME}/lib" -DCMAKE_C_COMPILER="$SDK_HOME/gcc/bin/gcc" -DCMAKE_CXX_COMPILER="${SDK_HOME}/gcc/bin/g++"  -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE" -DCMAKE_INSTALL_PREFIX="$SDK_HOME" -DBUILD_SHARED_LIBS=ON -DNAMESPACE_VERSIONING=ON
    env CFLAGS="$BF" CXXFLAGS="$BF" ./configure --prefix="$SDK_HOME" --libdir="$SDK_HOME/lib" --enable-shared --disable-static --disable-debug --disable-dependency-tracking
    make -j${MKJOBS}
    make install
    popd
    rm -rf "openexr-${EXR_VERSION}"
    end_build
fi
