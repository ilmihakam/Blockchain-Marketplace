#!/bin/bash

# Start Ganache CLI and redirect output to a log file
ganache-cli -p 7545 -i 5777 -a 10 --deterministic --host 0.0.0.0 > ganache_log.txt &

# Wait for Ganache CLI to initialize
sleep 3

# Display the private keys by parsing the log file
echo "Ganache CLI has started. Here are the private keys for the accounts:"
grep "Private Keys" ganache_log.txt -A 10  # Grabs the private keys lines

# Compile and deploy contracts to the development network
truffle compile
truffle migrate --network development