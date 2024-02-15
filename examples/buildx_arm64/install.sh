#!/bin/sh

VERSION=v0.73.0 && \
OS=linux && \
ARCH=arm64 && \
ORG=sikalabs && \
BIN=slu && \
curl -fsSL https://github.com/${ORG}/${BIN}/releases/download/${VERSION}/${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz -o ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz && \
tar -xzf ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz ${BIN} && \
rm ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz && \
mv ${BIN} /usr/local/bin/
