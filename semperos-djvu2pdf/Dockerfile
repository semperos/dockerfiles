# djvu2pdf docker image to convert djvu files to pdfs

FROM alpine:3.5

WORKDIR /tmp

ENV BIN_INSTALL=/usr/local/bin

ENV DJVULIBRE_TARBALL=djvulibre-3.5.27.tar.gz
ENV DJVULIBRE_URL=https://downloads.sourceforge.net/project/djvu/DjVuLibre/3.5.27/djvulibre-3.5.27.tar.gz?r=http%3A%2F%2Fdjvu.sourceforge.net%2F&ts=1492513328&use_mirror=svwh

ENV DJVU2PDF_TARBALL=djvu2pdf-0.9.2.tar.gz
ENV DJVU2PDF_URL=http://0x2a.at/site/projects/djvu2pdf/$DJVU2PDF_TARBALL

RUN apk add --update build-base ca-certificates bash ghostscript gnupg openssl tar wget && update-ca-certificates && rm -rf /var/cache/apk/*

RUN mkdir -p $BIN_INSTALL \
    && wget -q $DJVU2PDF_URL \
    && mkdir ./djvu2pdf \
    && tar -xzf $DJVU2PDF_TARBALL -C ./djvu2pdf/ --strip-components=1 \
    && mv ./djvu2pdf/djvu2pdf $BIN_INSTALL/djvu2pdf \
    && chmod 0755 $BIN_INSTALL/djvu2pdf

RUN mkdir -p $BIN_INSTALL \
    && wget -q $DJVULIBRE_URL -O $DJVULIBRE_TARBALL \
    && mkdir ./djvulibre \
    && tar -xzf $DJVULIBRE_TARBALL -C ./djvulibre/ --strip-components=1 \
    && cd ./djvulibre \
    && ./configure \
    && make \
    && make install

ENV PATH=$PATH:$BIN_INSTALL

ENTRYPOINT ["djvu2pdf"]
