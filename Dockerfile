FROM debian:bullseye-slim

# نصب Xray
RUN apt-get update && apt-get install -y wget unzip curl
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
RUN unzip Xray-linux-64.zip -d /usr/local/bin/
RUN chmod +x /usr/local/bin/xray

# ساخت کانفیگ
RUN mkdir /etc/xray
COPY config.json /etc/xray/config.json

# پورت
EXPOSE 8080

# اجرا
CMD ["xray", "-config", "/etc/xray/config.json"]
