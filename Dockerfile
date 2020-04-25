FROM golang:1

ARG CFLAGS

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt -y upgrade && \
  apt-get -y install gcc-arm-linux-gnueabi upx-ucl && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/

COPY scripts/build-go-app.sh /usr/local/bin/build-go-app.sh

ENV CC=arm-linux-gnueabi-gcc
ENV CFLAGS=${CFLAGS}
ENV CXXFLAGS=${CFLAGS}
ENV LDFLAGS="-s -w"
ENV GOGCCFLAGS=${CFLAGS}
ENV CGO_CFLAGS=${CFLAGS}
ENV CGO_CXXFLAGS=${CXXFLAGS}
ENV CGO_LDFLAGS=${LDFLAGS}
ENV CGO_ENABLED=1
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=6

ENTRYPOINT [ "/usr/local/bin/build-go-app.sh" ]