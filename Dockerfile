FROM debian:buster as jdk_full

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
    && curl \
        -L \
        -o openjdk.tar.gz \
        https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz \
    && mkdir jdk \
    && tar zxf openjdk.tar.gz -C jdk --strip-components=1 \
    && apt-get -y --purge autoremove curl \
    && rm -rf openjdk.tar.gz \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/jdk/bin/java"]
CMD ["-version"]
