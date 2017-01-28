#!/bin/bash

# ETH-EMF
#
# Starts the main process that connects to the Ethereum production network.
# The process keeps the local blockchain up to date and provides a RPC 
# (remote procedure call) interface for other processes wanting to interact
# with the blockchain.
#
# Project: https://github.com/imifos/ethereum-miner
#
# Notes:
# * Start as background process from command line by adding a & character 
#   at the end of the line.
# * If this process should also CPU mine, add the --mine flag.

if [ -z "$ETHEMF_HOME" ]; then 
    echo 'ETHEMF_HOME not set. Environment not correclty set-up. Please consult documentation.'
    exit -3;
fi

source $ETHEMF_HOME/config/setenv.sh

if [ -z "$ETH_BASE" ] ; then
    echo 'ETH_BASE not set. Please update $ETHEMF_HOME/config/setenv.sh first!'
    exit -2;
fi

set -x

geth --identity "$ETH_NODENAME" --metrics --etherbase "$ETH_BASE" --rpc --logfile "$ETHEMF_HOME/log/startmain_log.log" 2>&1 | tee -a "$ETHEMF_HOME/log/startmain_console.log"

