FROM ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install \
    automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev clang git make nano screen && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/dockerhint/cpuminer-xzc.git /cpuminer && \
    cd /cpuminer && \
    ./build.sh

WORKDIR /cpuminer

ENTRYPOINT	["./cpuminer"]

CMD ["--help"]
