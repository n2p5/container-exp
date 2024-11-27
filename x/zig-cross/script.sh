#!/bin/bash
set -euxo pipefail

export CGO_ENABLED=1 
export GOOS=linux 
export GOARCH=amd64 
export GOPROXY=https://proxy.golang.org,direct
export CC="zig cc -target x86_64-linux" 
export CXX="zig c++ -target x86_64-linux" 

go build -trimpath -buildvcs=false -ldflags="-s -w -buildid=" -o app-$GOOS-$GOARCH

sha256sum ./app-$GOOS-$GOARCH