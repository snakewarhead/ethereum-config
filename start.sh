#!/bin/bash

DIR_DATA="/wallet/ethereum/data"

RPC_ADDR="172.21.123.118"
RPC_PORT="7000"

CACHE_SIZE="1024"

LISTENNING_PORT=5432

$DIR_DATA/stop.sh
echo -e "Starting \n"

geth --datadir $DIR_DATA --port $LISTENNING_PORT --rpc --rpcaddr $RPC_ADDR --rpcport $RPC_PORT -rpcapi personal,db,eth,net,web3 -maxpeers 50 --allow-insecure-unlock --cache $CACHE_SIZE >$DIR_DATA/stdout.txt 2>$DIR_DATA/stderr.txt &
echo $! >$DIR_DATA/node.pid
