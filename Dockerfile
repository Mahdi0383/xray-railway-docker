FROM teddysun/xray:latest

COPY ./config.json /etc/xray/config.json
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
CMD ["xray", "-c", "/etc/xray/config.json"]
ENTRYPOINT ["/entrypoint.sh"]
