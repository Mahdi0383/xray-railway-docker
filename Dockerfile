FROM alpine:latest

# نصب curl و xray و cloudflared
RUN apk add --no-cache curl bash && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && mv xray /usr/local/bin/ && rm -rf xray.zip geo* LICENSE && \
    chmod +x /usr/local/bin/xray && \
    curl -L -o /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

COPY entrypoint.sh /entrypoint.sh
COPY config.json /etc/xray/config.json
COPY tunnel.yml /etc/cloudflared/config.yml

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
