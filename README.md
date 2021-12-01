
![Bild Docker image workflow](https://github.com/gleamingbamboo/docker-trexminer/actions/workflows/docker-image.yml/badge.svg)
[![Build an push Docker](https://github.com/gleamingbamboo/docker-trexminer/actions/workflows/docker-publish.yml/badge.svg?event=push)](https://github.com/gleamingbamboo/docker-trexminer/actions/workflows/docker-publish.yml)
# T-Rex NVIDIA GPU miner (Ethash / Kawpow / Octopus / MTP)
Original repository: https://github.com/trexminer/T-Rex
I remove some strings in Dockerfile, add docker-compose and update to latest version

##Install docker-compose
You can skip this if docker-compose already installed on your machine.
If not:
1. [Install latest docker](https://docs.docker.com/engine/install/ "Install docker-compose")
2. [Install docker-compose](https://docs.docker.com/compose/install/ "Install docker-compose")



##Prepare
1. Clone this repo:
`git clone https://github.com/gleamingbamboo/docker-trexminer.git && cd docker-trexminer`
2. Edit config:
`nano entrypoint.sh`
3. Set your pool, wallet and worker name in:
```
SERVER=
ETH_ADDRESS=
WORKER_NAME=
```

## Run

```
docker-compose up -d
```

##Troubleshooting
If something wont work you can run container without `-t`:
`docker-compose up` where you can find your problem and create an issue in this repo.

## Get pre built image (in progress...)
https://hub.docker.com/r/gleamingbamboo/t-rex

##TODO:
```
Create branch version
Deploy container and push it to docker hub
```

## Buy me a Coffe
ETH: 0xa4268fabd1f3d947a3f783925ec93b2aef0e52d4
