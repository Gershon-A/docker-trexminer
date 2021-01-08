#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04
MAINTAINER Matt LaPaglia <mlapaglia@gmail.com>
ENV ETH_ADDRESS=0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
ENV SERVER=us1.ethermine.org
ENV WORKER_NAME=worker0

WORKDIR /root

RUN apt update
RUN apt -y install wget 
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.5/t-rex-0.19.5-linux-cuda11.1.tar.gz
RUN tar -xzf t-rex-0.19.5-linux-cuda11.1.tar.gz


ENTRYPOINT ./t-rex -a ethash -o stratum+tcp://$SERVER:4444 -u $ETH_ADDRESS -p x -w $WORKER_NAME