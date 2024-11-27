#!/bin/bash

echo "GOROOT: $GOROOT / GOPATH: $GOPATH"

export GOOS=linux 
export GOARCH=amd64
export GOPROXY=https://proxy.golang.org,direct
export CGO_ENABLED=0
go build -trimpath -buildvcs=false -ldflags="-s -w -buildid="

sha256sum ./go-test