# Note: CIM 3.37 segfaults at runtime on Ubuntu > 14.04 due to glibc incompatibilities
FROM ubuntu:14.04

# Install Cim
# https://www.mn.uio.no/tjenester/it/hjelp/programvare/simula/compilers/cim/index.html
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential wget unzip ca-certificates \
    && wget https://www.mn.uio.no/tjenester/it/hjelp/programvare/simula/compilers/cim/cim-3.37.zip \
    && unzip cim-3.37.zip \
    && cd cim-3.37 \
    && ./configure \
    && make \
    && make install \
    && ldconfig /usr/local/lib \
    && cd / \
    && rm -rf cim-3.37 cim-3.37.zip \
    && apt-get purge -y wget unzip \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /simula
COPY run_simula /usr/bin
