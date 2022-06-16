#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=us-eth.2miners.com:2020
ETH_ADDRESS=37mhdudJWA8PSXfaQi9MhwvKFd9YVUCouz
WORKER_NAME=$HOSTNAME

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME 

