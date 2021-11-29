#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=eu1.ethermine.org:4444
ETH_ADDRESS=0xa4268fabd1f3d947a3f783925ec93b2aef0e52d4
WORKER_NAME=KAMPUKTER_t-rex

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME 

