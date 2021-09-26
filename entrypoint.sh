#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=us1.ethermine.org:5555
WORKER_NAME=$HOSTNAME

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME -i INTENSITY

