FROM teddysun/xray

COPY entrypoint.sh /entrypoint.sh
COPY config.json /etc/xray/config.json

RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
