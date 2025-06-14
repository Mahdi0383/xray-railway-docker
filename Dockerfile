FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor unzip wget curl && \
    wget -qO xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip -q xray.zip && \
    mv xray /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray && \
    rm -rf xray.zip geo* LICENSE README.md

COPY start.sh /start.sh
COPY xray.json /etc/xray/config.json
COPY Caddyfile /etc/caddy/Caddyfile

RUN chmod +x /start.sh

CMD ["/start.sh"]
