FROM debian:bullseye-slim

# نصب وابستگی‌ها
RUN apt update && \
    apt install -y curl unzip xz-utils wget gnupg ca-certificates supervisor caddy && \
    mkdir -p /etc/xray /var/log/xray /usr/local/bin /etc/cloudflared && \
    rm -rf /var/lib/apt/lists/*

# نصب Xray
RUN wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm -rf /tmp/xray.zip

# نصب cloudflared
RUN wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

COPY config.json /etc/xray/config.json
COPY start.sh /start.sh
COPY cloudflared /etc/cloudflared
COPY Caddyfile /etc/caddy/Caddyfile

RUN chmod +x /start.sh

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]
