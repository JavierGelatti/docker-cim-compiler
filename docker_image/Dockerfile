FROM ubuntu:24.04 AS builder

# https://www.gnu.org/software/cim/
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential wget ca-certificates \
    && wget https://ftp.gnu.org/gnu/cim/cim-5.1.tar.gz \
    && tar xzf cim-5.1.tar.gz \
    && cd cim-5.1 \
    # Fix broken include paths in pre-generated C files (upstream packaging bug)
    && sed -i 's|#include "../../lib/cim.h"|#include "cim.h"|' lib/simset.c lib/simulation.c \
    && ./configure \
    && make \
    && make DESTDIR=/opt/cim install

# CIM translates Simula to C and compiles with gcc, so gcc is required at runtime
FROM ubuntu:24.04

LABEL org.opencontainers.image.source="https://github.com/JavierGelatti/docker-cim-compiler" \
      org.opencontainers.image.description="CIM Simula compiler"

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libc6-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/cim/usr/local/ /usr/local/
RUN ldconfig /usr/local/lib

WORKDIR /simula
COPY run_simula /usr/bin
