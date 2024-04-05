FROM ubuntu:20.04 AS root

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        texlive-binaries \
        texlive-metapost \
        texlive-lang-czechslovak \
        texlive-lang-cyrillic \
        libproj15 \
        ghostscript \
        imagemagick \
        survex && \
    apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /usr/share/doc/* \
        /usr/share/info/* \
        /var/cache/debconf/* && \
    sed -i '/pattern="PDF"/d' /etc/ImageMagick-6/policy.xml

FROM root AS compiling
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        python3 \
        g++ \
        make \
        pkg-config \
        tcl \
        libproj-dev \
        libfmt-dev && \
        apt-get clean && \
        rm -rf \
            /var/lib/apt/lists/* \
            /usr/share/doc/* \
            /usr/share/info/* \
            /var/cache/debconf/*

COPY ./therion /usr/src/therion/
WORKDIR /usr/src/therion/
RUN sed -i 's/^LOCHEXE/##LOCHEXE/' /usr/src/therion/Makefile && \
    make config-debian && \
    make ./therion


FROM root
COPY --from=compiling /usr/src/therion/therion /usr/local/bin
RUN \
    useradd therion
ENTRYPOINT ["/usr/local/bin/therion"]
USER therion