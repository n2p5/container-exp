# derived from https://github.com/ziglang/docker-zig
FROM alpine:3.20.3 AS zig_download
RUN apk update && \
    apk add \
    curl xz
ARG ZIGVER=0.14.0-dev.2310+b0dcce93f
ARG ZIGPKG=zig-linux-aarch64-$ZIGVER

ARG ZIGURL=https://ziglang.org/builds/${ZIGPKG}.tar.xz
RUN mkdir -p /deps
WORKDIR /deps

RUN curl ${ZIGURL} -O && \
    tar xf ${ZIGPKG}.tar.xz && \
    mv ${ZIGPKG}/ local/

## Prepare Go image
FROM golang:1.23.3-alpine3.20
RUN apk --no-cache add \
    libc-dev \
    xz \
    samurai \
    git \
    cmake
COPY --from=zig_download /deps/local/ /deps/local/
RUN ln -s /deps/local/zig /usr/local/bin