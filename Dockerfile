#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL Gershon <gershon@medooza.io>

WORKDIR /root

RUN apt update
RUN apt -y install wget 
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.14/t-rex-0.19.14-linux-cuda11.1.tar.gz

RUN tar -xzf t-rex-0.19.14-linux-cuda11.1.tar.gz

ENV ETH_ADDRESS=0xaca8C3b75ce6511fB5274B5a5Df70EA2Ac243f64
ENV SERVER=us1.ethermine.org
ENV WORKER_NAME=worker0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
