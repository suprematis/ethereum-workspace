#!/bin/bash

# ETH-EMF
#
# Starts geth in CPU mining mode, attaching it to the main geth process.
#
# The main geth process must be running (startmain.sh).
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

set -x

ethminer --cpu -t 1 2>&1 | tee -a "$ETHEMF_HOME/log/cpuminer_console.log"
