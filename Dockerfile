FROM node

ENV SHARP_VERSION=8.9.1

ENV SHARP_DIST_BASE_URL=https://npm.taobao.org/mirrors/sharp-libvips/${SHARP_VERSION}/

# 修改源
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y libvips
