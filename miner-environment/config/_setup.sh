#!/bin/bash

# ETH-EMF
#
# Environment set-up. Run once.
#
# IMPORTANT
# Does NOT install Ethereum tools (cf ethereum_install.sh) and does NOT set
# the environment variables (cf setenv.sh). This has to be done manually.
#
# Project: https://github.com/imifos/ethereum-miner
#

echo ""
echo "ETH-EMF: Environment set-up (Run once)"
echo "+-----------------------------------------------------"
echo "|"
if [ -z "$ETHEMF_HOME" ]; then 
    echo "| ETHEMF_HOME not set. Configure the project correctly before to continue."
else 
    echo "| Creates script to manually set ETHEMF_HOME."
    echo "|    Execute with:"
    echo "|    $ . "$ETHEMF_HOME"/config/sethome.sh"
    echo "export ETHEMF_HOME=`pwd`/ethereum-miner" > $ETHEMF_HOME"/config/sethome.sh"
    echo "|"
	    
    echo "| Makes scripts executable for user."
    chmod 744 $ETHEMF_HOME/config/*.sh
    chmod 744 $ETHEMF_HOME/scripts/*.sh
fi
echo "|"
echo "+-----------------------------------------------------"
echo ""

