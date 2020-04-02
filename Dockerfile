FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /root/cloud-torrent
ENV PATH=$HOME/go/bin:$PATH 
RUN git clone https://github.com/boypt/cloud-torrent.git . && \
    go get -v -u github.com/shuLhan/go-bindata/... && \
    go get -v -t -d ./... && \
    cd static && \
    sh generate.sh

ENV GO111MODULE=on CGO_ENABLED=0
RUN go build -ldflags "-s -w -X main.VERSION=$(git describe --tags)" -o /usr/local/bin/cloud-torrent

FROM lsiobase/alpine:3.11

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="blog.auska.win version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Auska"

COPY --from=builder /usr/local/bin/cloud-torrent /usr/local/bin/cloud-torrent

ENV TZ=Asia/Shanghai PORT=3099 VER=0.8.25 AUTH=admin:admin

RUN \
	echo "**** install packages ****" \
	&& apk add --no-cache ca-certificates

# copy local files
COPY root/ /

# ports and volumes
EXPOSE $PORT
VOLUME /downloads /watch /config
