for i in \
ImageMagick \
TeXShop \
Xft2 \
apr-util \
aspell \
aspell-dict-en \
aspell-dict-fr \
autoconf \
automake \
blinky \
cairo \
cairomm \
coreutils \
dcraw \
doxygen \
fontconfig \
freetype \
gconf \
gd2 \
gimp2 \
glut \
gnome-icon-theme \
gnome-vfs \
gnuplot \
gqview \
graphviz \
gtk2 \
gtk-chtheme \
gtk-engines2 \
gtkmm \
gv \
icon-naming-utils \
imlib2 \
inkscape \
intltool \
jasper \
jpeg2ps \
keychain \
lcms \
libbonobo \
libcroco \
libdc1394 \
libgdiplus \
libglade2 \
libgnomecanvas \
libgnomeprint \
libgnomeprintui \
libmng \
libpng \
libsdl_ttf \
libtool \
libwmf \
mednafen \
mono \
ncurses \
neon \
netpbm \
opencv \
openssl \
orbit2 \
pango \
qt3-mac \
readline \
sqlite3 \
subversion \
teTeX \
tiff \
transfig \
urw-fonts \
wget \
xfig \
xv \
; do
sudo port uninstall $i
done