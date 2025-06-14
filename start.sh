#!/bin/bash
set -e

AUUID=${AUUID:-"$(uuidgen)"}
PORT=${PORT:-8080}
export AUUID

# ساخت فایل ساده برای Caddy
mkdir -p /usr/share/caddy
cat <<EOF > /usr/share/caddy/index.html
<h1>Xray + Caddy Tunnel is Running</h1>
EOF

# جایگذاری متغیرها در فایل‌ها
envsubst < /xray.json > /tmp/xray.json && mv /tmp/xray.json /xray.json
envsubst < /Caddyfile > /tmp/Caddyfile && mv /tmp/Caddyfile /etc/caddy/Caddyfile

# اجرای Xray و Caddy
/usr/local/bin/xray -config /xray.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &

# اجرای cloudflared tunnel
echo "$TUNNEL_TOKEN" | cloudflared tunnel run --no-autoupdate --token - &

wait -n
