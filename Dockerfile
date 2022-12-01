FROM ubuntu:20.04 AS root

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt -qq update ; \
    apt install -y --no-install-recommends \
		texlive-binaries \
		texlive-metapost \
		libproj15 \
		ghostscript \
		imagemagick \
		survex && \
	sed -i '/pattern="PDF"/d' /etc/ImageMagick-6/policy.xml

FROM root AS compiling
WORKDIR /usr/src
RUN apt install -y --no-install-recommends \
		ca-certificates \
		python3 \
		g++ \
		git \
		make pkg-config \
		tcl \
		libproj-dev && \
	git clone --depth 1 -b v6.1.3 https://github.com/therion/therion.git && \
	cd /usr/src/therion && \
    sed -i 's/^LOCHEXE/##LOCHEXE/' /usr/src/therion/Makefile && \
    make config-debian && \
    make ./therion

FROM root
COPY --from=compiling /usr/src/therion/therion /usr/local/bin
RUN rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/therion"]
