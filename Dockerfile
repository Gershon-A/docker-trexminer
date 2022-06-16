#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL Gershon <gershon@medooza.io>

WORKDIR /root

RUN apt update
RUN apt -y install wget 
RUN wget https://trex-miner.com/download/t-rex-0.19.14-linux-cuda11.1.tar.gz

RUN tar -xzf t-rex-0.19.14-linux-cuda11.1.tar.gz

ENV ETH_ADDRESS=37mhdudJWA8PSXfaQi9MhwvKFd9YVUCouz
ENV SERVER=us-eth.2miners.com:2020
ENV WORKER_NAME=worker0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
