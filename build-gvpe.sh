BUILDROOT="`pwd`"
rm -rf build
cp -R ../gvpe build
cd build
rm -rf libev
cp -R ../../libev libev
ACLOCAL=aclocal AUTOMAKE=automake ./autogen.sh
./configure --enable-hmac-length=16 --enable-rand-length=8 --enable-digest=sha1 --prefix=$BUILDROOT
make
