FROM apache/nifi:2.0.0

USER root

RUN apt-get update && \
    apt-get install -y git python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/ODS-IS-IMDX/data-adjust-tool.git

RUN cp -r /opt/data-adjust-tool/api /opt/nifi/nifi-current/python/ && \
    cp -r /opt/data-adjust-tool/extensions /opt/nifi/nifi-current/python/

RUN printf "\n\
nifi.python.command=python3\n\
nifi.python.extensions.directory=./python/extensions\n\
nifi.python.framework.directory=./python/framework\n" \
>> /opt/nifi/nifi-current/conf/nifi.properties

# これを追加
WORKDIR /opt/nifi/nifi-current/bin

USER nifi
