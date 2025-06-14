#!/bin/bash
set -e

# خواندن UUID و Port از متغیرهای محیطی یا مقدار پیش‌فرض
AUUID=${AUUID:-"$(uuidgen)"}
export AUUID
PORT=${PORT:-8080}

echo "UUID: $AUUID, PORT: $PORT"

mkdir -p /usr/share/caddy

echo "<h1>Xray + Caddy is running</h1>" > /usr/share/caddy/index.html

# جایگذاری UUID در فایل xray.json
envsubst < /xray.json > /tmp/xray.json && mv /tmp/xray.json /xray.json

# اجرای Xray و Caddy
/usr/local/bin/xray -config /xray.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
