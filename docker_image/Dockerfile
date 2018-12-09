FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils build-essential wget

# Install Cim
# http://folk.uio.no/simula67/cim.shtml
RUN wget http://simula67.at.ifi.uio.no/Cim/cim-3.37.tar.gz
RUN tar -xf cim-3.37.tar.gz
WORKDIR cim-3.37
RUN ./configure
RUN make
RUN make install
RUN ldconfig /usr/local/lib

WORKDIR /simula
COPY run_simula /usr/bin
