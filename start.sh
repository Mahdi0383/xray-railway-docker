#!/bin/bash

# اجرای cloudflared tunnel
cloudflared tunnel run --config /etc/cloudflared/config.yml &

# اجرای xray
/usr/local/bin/xray -config /etc/xray/config.json &

# اجرای caddy
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
