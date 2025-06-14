FROM alpine:latest

# نصب ابزارهای مورد نیاز
RUN apk add --no-cache wget curl unzip caddy bash

# نصب Xray
RUN wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    | bsdtar -xvf- -C /usr/local/bin && \
    chmod +x /usr/local/bin/xray

# نصب cloudflared
RUN wget -qO /usr/local/bin/cloudflared \
    https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

# ساخت پوشه‌ها
RUN mkdir -p /etc/xray /etc/caddy /usr/share/caddy

# کپی فایل‌ها
COPY start.sh /start.sh
COPY xray.json /xray.json
COPY Caddyfile /Caddyfile

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
