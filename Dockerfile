FROM alpine:edge

RUN apk update && apk add --no-cache ca-certificates caddy tor wget unzip bash

# دانلود و نصب Xray
RUN wget -qO xray-core.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray-core.zip && chmod +x xray && mv xray /usr/local/bin/xray && rm xray-core.zip

COPY start.sh /start.sh
COPY xray.json /xray.json
COPY Caddyfile /etc/caddy/Caddyfile

RUN chmod +x /start.sh

CMD ["/start.sh"]
