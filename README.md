![Bild Docker image workflow](https://github.com/Gershon-A/docker-trexminer/actions/workflows/docker-image.yml/badge.svg)
# T-Rex NVIDIA GPU miner (Ethash / Kawpow / Octopus / MTP)
Original repository
https://github.com/trexminer/T-Rex

This image build [T-Rex CUDA miner] t-rex-0.19.11-linux-cuda11.1 from https://github.com/trexminer/T-Rex.
It requires a CUDA compatible docker implementation so you should probably go
for [nvidia-docker].

Originally, this docker image madded for use with Kubernetes for https://github.com/Gershon-A/AWS-EKS-Cluster-with-GPU-instances-and-miners project and not tested locally.

## Build images

```
git clone git remote add origin https://github.com/Gershon-A/docker-trexminer.git
cd docker-trexminer
docker build -t cuda-t-rex:latest .
```

## Publish it somewhere

```
docker tag cuda-t-rex:latest docker.domain.com/mining/cuda-t-rex:latest
docker push docker.domain.com/mining/cuda-t-rex:latest
```

## Test it (using DockerHub published image)

```
nvidia-docker pull gershona/cuda-t-rex:latest
nvidia-docker run -it --rm gershona/cuda-t-rex:latest /root/t-rex --help
```

An example command line to mine using ethermine.org on https://ethermine.org/ (on my account, you can use it to actually mine something for real if you haven't choose your pool yet):
```
export SERVER=us1.ethermine.org
export ETH_ADDRESS=0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
export WORKER_NAME=my-worker
nvidia-docker run -it --rm --name cuda-t-rex gershona/cuda-t-rex:latest /root/t-rex -a ethash -o stratum+tcp://$SERVER:4444 -u $ETH_ADDRESS -p x -w $WORKER_NAME
```

Ouput will looks like:
```
t-rex
20210109 12:15:02 T-Rex NVIDIA GPU miner v0.19.5 - [CUDA v11.10 | Linux]
t-rex
20210109 12:15:02 r.5f0b2f67355c
t-rex
20210109 12:15:02
t-rex
20210109 12:15:02 NVIDIA Driver v450.51.06
t-rex
20210109 12:15:02 CUDA devices available: 1
t-rex
20210109 12:15:02
t-rex
20210109 12:15:02 WARN: DevFee 1% (ethash)
t-rex
20210109 12:15:02
t-rex
20210109 12:15:02 URL : stratum+tcp://us1.ethermine.org:4444
t-rex
20210109 12:15:02 USER: 0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
t-rex
20210109 12:15:02 PASS: x
t-rex
20210109 12:15:02 WRK : Gershon-t-rex
t-rex
20210109 12:15:02
t-rex
20210109 12:15:02 Starting on: us1.ethermine.org:4444
t-rex
20210109 12:15:02 Using protocol: stratum1.
t-rex
20210109 12:15:02 Authorizing...
t-rex
20210109 12:15:02 Authorized successfully.
t-rex
20210109 12:15:02 ethash epoch: 387, block: 11620479, diff: 4.00 Gh
t-rex
20210109 12:15:02 ApiServer: HTTP server started on 0.0.0.0:4067
t-rex
20210109 12:15:02 --------------------------------------------------------
t-rex
20210109 12:15:02 For control navigate to: http://192.168.14.229:4067/trex
t-rex
20210109 12:15:02 --------------------------------------------------------
```

You can check the output using `docker logs cuda-t-rex -f`

You can check CUDA usage enter to running container and run `nvidia-smi` there:

```
nvidia-smi
Sat Jan  9 12:17:02 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.51.06    Driver Version: 450.51.06    CUDA Version: 11.1     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla M60           Off  | 00000000:00:1E.0 Off |                    0 |
| N/A   49C    P0    73W / 150W |   7618MiB /  7618MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```

[T-Rex CUDA miner]: https://bitcointalk.org/index.php?topic=4432704.0

## Buy me a Coffe
ETH: 0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
