#!/bin/bash

# ETH-EMF
#
# Starts the geth tool, imports the custom genesis block
# and initialises the custom local test blockchain into the
# default Ethereum directory.
#
# It does not start mining, so hit CTRL+C or type exit to 
# exit the tools when it concluded work.
#
# NOTE: DON'T RUN THESE SCRIPTS USING A USER ACCOUNT
#       THAT HAS ANOTHER BLOCKCHAIN ACTIVE.
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
echo "This script sets up a local custom test blockchain."
echo "It should never be used by a user account that has"
echo "already another active blockchain in his home Ethereum"
echo "installation."
echo ""
echo "IMPORTANT: Once GETH has finished all operations and is in wait mode,"
echo "           type 'exit' or do ctrl+C to exit."
echo ""
echo "Would you like to proceed [y/n]?"
read ans

if [ -z "$ans" -o $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ] ;
then
   echo "Proceeding..."
else
   echo "Cancel!"
   exit -5
fi

echo "Type 'exit' or hit CTRL+C when the tool has finished the process after some seconds."

set -x

geth --genesis $ETHEMF_HOME/testnet/customgenesis.json --networkid 1100 -nodiscover -maxpeers 0 console

