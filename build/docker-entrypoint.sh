#!/usr/bin/env bash

# Exit immediately on non-zero return codes.
set -ex

# Run start command if only options given.
if [ "${1:0:1}" = '-' ]; then
  set -- usr/local/bin/bitcoind -printtoconsole
fi

# Run boot scripts before starting the server.
if [ "$1" = 'usr/local/bin/bitcoind' ]; then

	# Prepare the data directory.
	mkdir -p /data/.bitcoin

	if [ ! -f /data/.bitcoin/bitcoin.conf ]
	then
		echo "rpcuser=rpcuser" >> /data/.bitcoin/bitcoin.conf
		echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> /data/.bitcoin/bitcoin.conf
		chmod 600 /data/.bitcoin/bitcoin.conf
	fi

	chown -R bitcoin:bitcoin /data/.bitcoin

  # Run via steam user if the command is `startserver.sh`.
  set -- gosu bitcoin "./$@"
fi

# Execute the command.
exec "$@"
