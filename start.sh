#!/bin/sh

# Configs
AUUID=${AUUID:-$(uuidgen)}
PORT=${PORT:-8080}

echo "Generated UUID: $AUUID"

mkdir -p /etc/caddy /usr/share/caddy

# Basic HTML index
echo "<h1>Xray + Caddy running</h1>" > /usr/share/caddy/index.html

# Replace UUID in config files
envsubst < /xray.json > /tmp/xray.json && mv /tmp/xray.json /xray.json
envsubst < /Caddyfile > /tmp/Caddyfile && mv /tmp/Caddyfile /etc/caddy/Caddyfile

# Start services
tor &
xray -config /xray.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
