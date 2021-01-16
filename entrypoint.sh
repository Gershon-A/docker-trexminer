#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=us1.ethermine.org:5555
ETH_ADDRESS=0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
WORKER_NAME=$HOSTNAME

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $WALLET-p x -w $WORKER_NAME 

