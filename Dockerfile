FROM ubuntu AS root

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt -qq update ; \
    apt install -y  \
		libproj15 \
		texlive-binaries \
		texlive-metapost



FROM root AS compiling
RUN apt install -y \
		git \
		libproj-dev \
		libvtk7-dev \
		libwxgtk3.0-gtk3-dev \
		ghostscript \
		imagemagick \
		survex && \
		sed -i '/pattern="PDF"/d' /etc/ImageMagick-6/policy.xml

WORKDIR /usr/src
RUN git clone --depth 1 -b v5.5.4 https://github.com/therion/therion.git

WORKDIR /usr/src/therion
RUN	make config-debian && make install



FROM root

COPY --from=compiling /usr/local/bin/therion /usr/local/bin
ENTRYPOINT /usr/local/bin/therion
RUN apt remove -y --purge python3 ruby && \
    apt autoremove -y --purge && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /opt
