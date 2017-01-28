#!/bin/bash
 
# ETH-EMF
#
# Sets the Ethereum environment variables allowing processes and tools
# to know the configuration.
#
# Project: https://github.com/imifos/ethereum-miner
#

if [ -z "$ETHEMF_HOME" ]; then 
    echo 'ETHEMF_HOME not set. Environment not correclty set-up. Please consult documentation.'
    exit -3;
fi

# UPDATE THESE VALUES BEFORE USING PROJECT SCRIPTS:
# =================================================

# Ethereum account that receives mining rewards
# Obtained when creating account with 'geth account new'.
# Displayed by executing 'geth account' (or 'geth account list').
# Example: export ETH_BASE="6f4a39525060cfaf1a413f996dc03ad69a066e78"
export ETH_BASE="50d0502b97c6964749a433f8e4cd21a6ccae97b6"


# Node name on the Frontier network
export ETH_NODENAME="ETHER-NOSHIP"

# Ethereum data directory, blockchain and keystore directory (defaults to ~/.ethereum)
export ETH_HOME=~/.ethereum

