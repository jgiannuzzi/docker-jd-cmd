FROM java:8-alpine

ENV JDCMD_VERSION 1.0.0.Final
ENV JDCMD_SHA256 b87ec7ca0243bab697f2806ffe4e425618860787bf6cff3daff2e44bfd4a266a

RUN set -ex \
 && mkdir -p /tmp/jd-cli \
 && cd /tmp/jd-cli \
 && apk add --no-cache openssl \
 && wget https://github.com/kwart/jd-cmd/releases/download/jd-cmd-${JDCMD_VERSION}/jd-cli-${JDCMD_VERSION}-dist.tar.gz \
 && apk del openssl \
 && echo "${JDCMD_SHA256}  jd-cli-${JDCMD_VERSION}-dist.tar.gz" | sha256sum -c - \
 && tar xzvf jd-cli-${JDCMD_VERSION}-dist.tar.gz \
 && mkdir -p /usr/local/share/jd-cli \
 && mv jd-cli.jar /usr/local/share/jd-cli \
 && cd / \
 && rm -rf /tmp/jd-cli

COPY docker-entrypoint.sh jd-cli /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["jd-cli"]
