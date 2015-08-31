#! /bin/bash

set -e

if [ "$1" = 'shell' ]; then
    exec "/bin/bash"
else
    if [ -n "$HTTP_PROXY" ]; then
        echo "Setting proxy $HTTP_PROXY"
        npm config set proxy $HTTP_PROXY
        npm config set https-proxy $HTTP_PROXY
    fi

    npm install -g gulp && npm install --no-registry && bower install --allow-root --config.interactive=false
    gulp "$@"
fi
