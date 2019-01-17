FROM lsiobase/alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="blog.auska.win version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Auska"

ENV TZ=Asia/Shanghai PORT=3099 VER=0.8.25 PASSWD=admin:admin

RUN \
	echo "**** install packages ****" \
	&& apk add --no-cache curl unzip \
	&& cd /tmp \
	&& curl -fSL https://github.com/jpillora/cloud-torrent/releases/download/${VER}/cloud-torrent_linux_amd64.gz -o cloud-torrent.gz \
	&& mkdir -p /defaults \
	&& gzip -d cloud-torrent.gz \
	&& mv /tmp/cloud-torrent /defaults/cloud-torrent \
	&& chmod a+x /defaults/cloud-torrent \
	&& apk del curl \
	&& rm -rf /tmp

# copy local files
COPY root/ /

# ports and volumes
EXPOSE $PORT
VOLUME /mnt
