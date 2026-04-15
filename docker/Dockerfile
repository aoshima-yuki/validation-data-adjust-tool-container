# NiFi 1系で動作確認する場合
FROM apache/nifi:1.28.1

# 将来 2系に戻す場合は下記を使用
# FROM apache/nifi:2.0.0

USER root

RUN apt-get update && \
    apt-get install -y git python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/ODS-IS-IMDX/data-adjust-tool.git

# data-adjust-tool を NiFi に配置
RUN cp -r /opt/data-adjust-tool/api /opt/nifi/nifi-current/python/ && \
    cp -r /opt/data-adjust-tool/extensions /opt/nifi/nifi-current/python/

# Python Processor 用設定
# 1系で SpatialID Processor を読み込ませるための暫定設定
RUN printf "\n\
nifi.python.command=python3\n\
nifi.python.extensions.directory=./python\n\
nifi.python.framework.directory=./python\n" \
>> /opt/nifi/nifi-current/conf/nifi.properties

# 元の設定（2系に戻す場合の参考）
# RUN printf "\n\
# nifi.python.command=python3\n\
# nifi.python.extensions.directory=./python/extensions\n\
# nifi.python.framework.directory=./python/framework\n" \
# >> /opt/nifi/nifi-current/conf/nifi.properties

COPY docker/start-http.sh /opt/nifi/nifi-current/start-http.sh
RUN chmod +x /opt/nifi/nifi-current/start-http.sh

WORKDIR /opt/nifi/nifi-current
USER nifi
ENTRYPOINT ["./start-http.sh"]
