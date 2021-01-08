# T-Rex NVIDIA GPU miner (Ethash / Kawpow / Octopus / MTP)
Original repository
https://github.com/trexminer/T-Rex

This image build [T-Rex CUDA miner] from Mega.NZ link.
It requires a CUDA compatible docker implementation so you should probably go
for [nvidia-docker].


## Build images

```
git clone https://github.com/eLvErDe/docker-cuda-t-rex
cd docker-cuda-t-rex
docker build -t cuda-t-rex:latest .
```

## Publish it somewhere

```
docker tag cuda-t-rex:latest docker.domain.com/mining/cuda-t-rex:latest
docker push docker.domain.com/mining/cuda-t-rex:latest
```

## Test it (using DockerHub published image)

```
nvidia-docker pull acecile/cuda-t-rex:latest
nvidia-docker run -it --rm acecile/cuda-t-rex:latest /root/t-rex --help
```

An example command line to mine using bsod.pw on Infinex (IFX) (on my account, you can use it to actually mine something for real if you haven't choose your pool yet):
```
nvidia-docker run -it --rm --name cuda-t-rex acecile/cuda-t-rex:latest /root/t-rex -a lyra2z -o stratum+tcp://pool.bsod.pw:2142 -u iMjR82P4zj34FYu9ohm5jXTbbqJcdUer4L.t-rex-catch-all -p c=IFX,t-rex-catch-all
```

Ouput will looks like:
```
Built with CUDA Toolkit 9.1

[2018-06-19 20:22:20] Starting on stratum+tcp://pool.bsod.pw:2142
[2018-06-19 20:22:20] GPU monitoring is not available.
[2018-06-19 20:22:20] 3 miner threads started, using 'lyra2z' algorithm.
[2018-06-19 20:22:20] New difficulty: 1 (0.00391)
[2018-06-19 20:22:20] lyra2z block 120763, diff 199.676
[2018-06-19 20:22:20] GPU#1: Intensity set to 17, 131072 cuda threads
[2018-06-19 20:22:20] GPU#0: Intensity set to 17, 131072 cuda threads
[2018-06-19 20:22:20] GPU#2: Intensity set to 17, 131072 cuda threads
[2018-06-19 20:22:25] [ OK ] [A/R]: 1/1, diff: 0.021, 4301.31 kH/s
[2018-06-19 20:22:27] lyra2z block 120764, diff 197.683
[2018-06-19 20:22:28] [ OK ] [A/R]: 2/2, diff: 0.009, 11.75 MH/s
[2018-06-19 20:22:30] [ OK ] [A/R]: 3/3, diff: 0.012, 11.77 MH/s
[2018-06-19 20:22:31] [ OK ] [A/R]: 4/4, diff: 0.078, 11.77 MH/s
[2018-06-19 20:22:32] lyra2z block 120765, diff 196.984
[2018-06-19 20:22:33] [ OK ] [A/R]: 5/5, diff: 0.014, 11.77 MH/s
[2018-06-19 20:22:49] [ OK ] [A/R]: 17/17, diff: 0.010, 11.75 MH/s
[2018-06-19 20:22:51] GPU#1: GeForce GTX 1080 Ti, 3918.14 kH/s
[2018-06-19 20:22:51] [ OK ] [A/R]: 18/18, diff: 0.007, 11.75 MH/s
[2018-06-19 20:22:51] [ OK ] [A/R]: 19/19, diff: 0.015, 11.75 MH/s
[2018-06-19 20:22:52] [ OK ] [A/R]: 20/20, diff: 0.007, 11.75 MH/s
[2018-06-19 20:22:53] GPU#0: GeForce GTX 1080 Ti, 3943.19 kH/s
[2018-06-19 20:22:53] [ OK ] [A/R]: 21/21, diff: 0.019, 11.75 MH/s
[2018-06-19 20:22:55] [ OK ] [A/R]: 22/22, diff: 0.005, 11.74 MH/s
[2018-06-19 20:22:56] GPU#2: GeForce GTX 1080 Ti, 3855.81 kH/s
[2018-06-19 20:22:56] [ OK ] [A/R]: 23/23, diff: 0.010, 11.74 MH/s
```

## Background job running forever

```
nvidia-docker run -dt --restart=unless-stopped --name cuda-t-rex acecile/cuda-t-rex:latest /root/t-rex -a lyra2z -o stratum+tcp://pool.bsod.pw:2142 -u iMjR82P4zj34FYu9ohm5jXTbbqJcdUer4L.t-rex-catch-all -p c=IFX,t-rex-catch-all
```

You can check the output using `docker logs cuda-t-rex -f`


## Use it with Mesos/Marathon

Edit `mesos_marathon.json` to replace algorithm and pool mining pool parameter, change application path as well as docker image address (if you dont want to use public docker image provided).
Then simply run (adapt application name here too):

```
curl -X PUT -u marathon\_username:marathon\_password --header 'Content-Type: application/json' "http://marathon.domain.com:8080/v2/apps/mining/cuda-t-rex?force=true" -d@./mesos\_marathon.json
```

You can check CUDA usage on the mesos slave (executor host) by running `nvidia-smi` there:

```
Tue Jun 19 22:24:46 2018       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 390.42                 Driver Version: 390.42                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 108...  On   | 00000000:04:00.0 Off |                  N/A |
| 48%   63C    P2    61W / 200W |    197MiB / 11178MiB |     31%      Default |
+-------------------------------+----------------------+----------------------+
|   1  GeForce GTX 108...  On   | 00000000:05:00.0 Off |                  N/A |
| 60%   69C    P2    62W / 200W |    197MiB / 11178MiB |     30%      Default |
+-------------------------------+----------------------+----------------------+
|   2  GeForce GTX 108...  On   | 00000000:06:00.0 Off |                  N/A |
| 40%   59C    P2    59W / 200W |    197MiB / 11178MiB |     32%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      7988      C   /root/t-rex                                  179MiB |
|    1      7988      C   /root/t-rex                                  179MiB |
|    2      7988      C   /root/t-rex                                  179MiB |
+-----------------------------------------------------------------------------+
```

[T-Rex CUDA miner]: https://bitcointalk.org/index.php?topic=4432704.0
[nvidia-docker]: https://github.com/NVIDIA/nvidia-docker
[Mesos]: http://mesos.apache.org/documentation/latest/gpu-support/
