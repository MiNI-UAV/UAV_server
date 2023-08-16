FROM ubuntu:latest

ADD ./scripts_docker /UAV

RUN apt-get update && \
    apt-get install -y gcc g++ make cmake \
    build-essential curl autoconf automake \
    libtool pkg-config libsodium-dev wget \
    git libx11-dev && \
    apt-get update

#C++
RUN apt-get install -y libcxxopts-dev
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libzmq3-dev
RUN apt-get install -y librapidxml-dev
RUN wget https://github.com/zeromq/cppzmq/archive/refs/tags/v4.10.0.tar.gz && \
    tar -xvf v4.10.0.tar.gz && cd cppzmq-4.10.0 && mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && make install && cd ../..

#Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo --version

WORKDIR /UAV

RUN ./init.sh

WORKDIR /UAV/UAV_aggregator

ENTRYPOINT ["cargo", "run"]
