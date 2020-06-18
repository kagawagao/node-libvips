FROM node

ENV LIBVIPS_VERSION=8.9.2

RUN apt-get update
RUN apt-get install -y build-essential glib2.0-dev pkg-config

RUN curl -L https://github.com/libvips/libvips/releases/download/v${LIBVIPS_VERSION}/vips-${LIBVIPS_VERSION}.tar.gz -o vips-${LIBVIPS_VERSION}.tar.gz
RUN tar xf vips-${LIBVIPS_VERSION}.tar.gz
WORKDIR /vips-${LIBVIPS_VERSION}
RUN ./configure && make && make install && ldconfig

ENV PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig
RUN pkg-config --modversion vips-cpp
