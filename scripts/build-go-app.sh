#!/bin/bash

if [ "${1}" == "--upx" ]; then
  UPX=1
  shift;
fi

if [ $# -ne 2 ]; then
  echo "Usage:"
  echo "  ${0} [--upx] [SRC] [DEST]"
  echo "    --upx - Enables upx compression. SLOW!"
fi

APP=${1}
OUT=${2}

go get ${APP}
go build -x -o ${OUT} ${APP}

if [ -v UPX ]; then
  echo upx --brute ${OUT};
fi