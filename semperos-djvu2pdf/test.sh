#!/usr/bin/env bash

set -eu

# Workdir
cd /tmp

export DJVU2PDF_TARBALL=djvu2pdf-0.9.2.tar.gz
export DJVU2PDF_URL=http://0x2a.at/site/projects/djvu2pdf/$DJVU2PDF_TARBALL
export DJVU2PDF_INSTALL=/tmp/bin

# RUN apk add --update ca-certificates bash gnupg openssl tar wget && update-ca-certificates && rm -rf /var/cache/apk/*

mkdir -p $DJVU2PDF_INSTALL \
    && wget -q $DJVU2PDF_URL \
    && mkdir ./djvu2pdf \
    && tar -xzf $DJVU2PDF_TARBALL -C ./djvu2pdf/ --strip-components=1 \
    && mv ./djvu2pdf/djvu2pdf $DJVU2PDF_INSTALL/djvu2pdf \
    && chmod 0755 $DJVU2PDF_INSTALL/djvu2pdf
