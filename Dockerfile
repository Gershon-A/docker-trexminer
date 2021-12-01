FROM ubuntu:20.04 AS builder

WORKDIR /tmp


RUN apt update
RUN apt -y install wget curl

RUN curl -s https://api.github.com/repos/trexminer/T-Rex/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux | xargs wget

RUN tar -xzf t-rex*

FROM nvidia/cuda:11.4.2-base-ubuntu20.04

# Bug fix
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-ml.so

COPY --from=builder /tmp/t-rex /root/t-rex
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4067
ENTRYPOINT ["/root/t-rex"]
