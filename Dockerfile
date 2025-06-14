FROM debian:bullseye-slim

# نصب ابزارهای ضروری
RUN apt update && apt install -y curl unzip wget ca-certificates supervisor

# دانلود Xray
RUN mkdir -p /etc/xray /usr/local/bin
RUN wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray

# کپی فایل‌ها
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
