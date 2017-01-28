#!/bin/bash

# ETH-EMF
#
# Starts the geth monitor into multiple tabbed terminal windows 
# -> in WINDOWED MODE.
#
# The main geth process must be running (startmain.sh).
#
# Project: https://github.com/imifos/ethereum-miner
#
# Notes:
# * Uses the terminal of the XFCE4 Desktop Manager. 
#   Command must be adapted for other Desktops.

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

xfce4-terminal --working-directory="$ETHEMF_HOME" -e "geth monitor chain/inserts/Overall chain/inserts/AvgRate15Min" -T "Ethereum Chain" --tab -e "geth monitor p2p/InboundConnects/AvgRate15Min p2p/InboundTraffic/AvgRate15Min p2p/InboundTraffic/Overall" -T "Ethereum Inbound Traffic" --tab -e "geth monitor p2p/OutboundConnects/AvgRate15Min p2p/OutboundTraffic/AvgRate15Min p2p/OutboundTraffic/Overall" -T "Ethereum Outbound Traffic" --tab -e "geth monitor system/disk/readcount/Overall system/disk/readdata/Overall system/disk/writecount/Overall system/disk/writedata/Overall" -T "Ethereum Disk" --tab -e "geth monitor system/memory/inuse/AvgRate15Min system/memory/inuse/Overall system/memory/allocs/Overall system/memory/frees/Overall" -T "Ethereum Memory"   --disable-server &

# Options for fullscreen display: --fullscreen --hide-menubar --hide-borders --hide-toolbar 

