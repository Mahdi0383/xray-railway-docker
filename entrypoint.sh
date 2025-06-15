#!/bin/sh

# ایجاد فایل config با مقدار UUID سفارشی اگر env تنظیم شده باشد
if [ -n "$UUID" ]; then
  sed -i "s/UUID_REPLACE/$UUID/g" /etc/xray/config.json
else
  export UUID=$(xray uuid)
  sed -i "s/UUID_REPLACE/$UUID/g" /etc/xray/config.json
fi

echo "✅ UUID: $UUID"
echo "✅ Starting Xray..."

exec xray run -c /etc/xray/config.json
