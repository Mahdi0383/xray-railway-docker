FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget unzip && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - -d /usr/bin && \
    chmod +x /usr/bin/xray && \
    rm -rf /var/cache/apk/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
