# =========================================
# ベースイメージ
# =========================================

# 現在：NiFi 1系（CloudShell / HTTP確認用）
FROM apache/nifi:1.28.1

# ▼ NiFi 2系に戻す場合はこちらに切り替え
# FROM apache/nifi:2.0.0

# =========================================
# 依存関係インストール
# =========================================

USER root

RUN apt-get update && \
    apt-get install -y git python3 && \
    rm -rf /var/lib/apt/lists/*

# =========================================
# data-adjust-tool 配置
# =========================================

WORKDIR /opt

RUN git clone https://github.com/ODS-IS-IMDX/data-adjust-tool.git

RUN cp -r /opt/data-adjust-tool/api /opt/nifi/nifi-current/python/ && \
    cp -r /opt/data-adjust-tool/extensions /opt/nifi/nifi-current/python/

# =========================================
# Python Processor 設定
# =========================================

# ▼ NiFi 1系用（暫定）
RUN printf "\n\
nifi.python.command=python3\n\
nifi.python.extensions.directory=./python\n\
nifi.python.framework.directory=./python\n" \
>> /opt/nifi/nifi-current/conf/nifi.properties

# ▼ NiFi 2系用（戻す場合はこちらを使用）
# RUN printf "\n\
# nifi.python.command=python3\n\
# nifi.python.extensions.directory=./python/extensions\n\
# nifi.python.framework.directory=./python/framework\n" \
# >> /opt/nifi/nifi-current/conf/nifi.properties

# =========================================
# 起動スクリプト
# =========================================

COPY docker/start-http.sh /opt/nifi/nifi-current/start-http.sh
RUN chmod +x /opt/nifi/nifi-current/start-http.sh

# =========================================
# 実行設定
# =========================================

WORKDIR /opt/nifi/nifi-current
USER nifi

# ▼ HTTPモードで起動（CloudShell用）
ENTRYPOINT ["./start-http.sh"]

# ▼ NiFi標準起動に戻す場合
# ENTRYPOINT ["../scripts/start.sh"]
