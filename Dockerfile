#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL Gershon <gershon@medooza.io>

WORKDIR /root

ENV version=0.24.7 

RUN apt update
RUN apt -y install wget 
RUN wget https://trex-miner.com/download/t-rex-$version-linux-cuda11.1.tar.gz

RUN tar -xzf t-rex-0.19.14-linux-cuda11.1.tar.gz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
