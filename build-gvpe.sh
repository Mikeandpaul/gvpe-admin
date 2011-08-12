echo Building GVPE
if [ ! -e ./build/src/gvpectrl ]; then
    rm -rf build
    cp -R ../gvpe build
    cd build
    rm -rf libev
    cp -R ../../libev libev
    #ACLOCAL=aclocal AUTOMAKE=automake ./autogen.sh --enable-hmac-length=16 --enable-rand-length=8 --enable-digest=sha1 --prefix="" --exec-prefix=""
    ACLOCAL=aclocal AUTOMAKE=automake ./autogen.sh --enable-cipher=bf --enable-digest=md4 --prefix="" --exec-prefix=""
    cd lib
    make
    cd ../src
    make
    cd ../..
fi
echo Done
