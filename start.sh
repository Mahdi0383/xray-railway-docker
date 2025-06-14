#!/bin/sh

# اجرای سرویس‌ها
tor &

# اجرای xray
/usr/local/bin/xray -config /etc/xray/config.json &

# اجرای caddy برای وب‌سایت تقلبی یا دایرکتوری استاتیک
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
