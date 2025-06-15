#!/bin/bash

echo "Starting cloudflared tunnel..."
cloudflared tunnel --config /etc/cloudflared/config.yml run &

sleep 5

echo "Starting xray..."
xray -c /etc/xray/config.json
