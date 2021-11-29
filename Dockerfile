FROM ubuntu:20.04 AS builder

WORKDIR /tmp

ENV version=0.24.7 

RUN apt update
RUN apt -y install wget 
RUN wget https://trex-miner.com/download/t-rex-$version-linux.tar.gz

RUN tar -xzf t-rex-$version-linux.tar.gz

FROM nvidia/cuda:11.4.2-base-ubuntu20.04

# Bug fix
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-ml.so

COPY --from=builder /tmp/t-rex /root/t-rex
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE 4067
ENTRYPOINT /entrypoint.sh
