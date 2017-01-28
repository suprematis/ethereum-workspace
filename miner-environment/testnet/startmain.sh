#!/bin/bash

# ETH-EMF
#
# Starts the geth tool on the local test blockchain with open IPC/RPC
# interfaces and starts mining. This is the main process that has to run 
# when using other scripts in this directory. 
#
# NOTE: DON'T RUN THESE SCRIPTS USING A USER ACCOUNT
#       THAT HAS ANOTHER BLOCKCHAIN ACTIVE.
#
#       THIS SCRIPT IS SUPPOSED TO WORK ON THE LOCAL CUSTOM TEST BLOCKCHAIN.
#
#       A coin base has to be set ion order to use geth for mining. 
#       You can do this by executing "geth account new".
#
# Project: https://github.com/imifos/ethereum-miner
#

if [ -z "$ETHEMF_HOME" ]; then 
    echo 'ETHEMF_HOME not set. Environment not correclty set-up. Please consult documentation.'
    exit -3;
fi

source $ETHEMF_HOME/config/setenv.sh

if [ -z "$ETH_BASE" ] ; then
    echo 'ETH_BASE not set. Please update $ETHEMF_HOME/config/setenv.sh first!'
    exit -2;
fi

echo ""
echo "This script starts a geth process as miner on the LOCAL TEST BLOCKCHAIN."
echo "It also open all RPC and IPC interfaces, thus giving access to the account"
echo "to everybody able to connect."
echo ""
echo "Would you like to proceed [y/n]?"
read ans

if [ -z "$ans" -o $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ] ;
then
   echo ""
else
   echo "Cancel!"
   exit -5
fi

set -x

geth --mine -rpccorsdomain "*" --ipcapi "admin,eth,miner" --rpcapi "eth,web3" --networkid 1100 -nodiscover -maxpeers 5 --minerthreads 1


