#TCCBOOT=https://github.com/spratt/tccboot/archive/master.zip
TCCBOOT=http://bellard.org/tcc/tccboot-0.1.tar.gz
TCC=https://github.com/spratt/tcc/archive/master.zip

TOPLEVEL=$PWD
DOWNLOAD=$TOPLEVEL/download
LIBSRC=$TOPLEVEL/libsrc
LIBBLD=$TOPLEVEL/libbld

function mkdir_cd {
    mkdir -p $1 && cd $1
}

function download {
    if [ ! -f $DOWNLOAD/$(basename $1) ]; then
        echo "Downloading: $1"
        curl $1 -O
    fi
}

function clean() {
    echo TODO
}

function build_tcc() {
    echo TODO
}

function build_tccboot() {
    mkdir_cd $DOWNLOAD
    download $TCCBOOT
    mkdir_cd $LIBSRC/tccboot
    tar xf $DOWNLOAD/$(basename $TCCBOOT) --strip-components 1
}

while [ $# -gt 0 ]; do case "$1" in
tcc)
    build_tcc;;
tccboot)
    build_tccboot;;
clean)
	clean;;
*)
	echo unknown argument: $1
	echo available actions: tcc, tccboot, clean;;
esac; shift; done
