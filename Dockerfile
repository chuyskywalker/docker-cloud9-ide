FROM ubuntu

RUN apt-get update \
 && apt-get install -y wget build-essential git python \
 && git clone --depth=1 git://github.com/c9/core.git /c9 \
 && /c9/scripts/install-sdk.sh \
 && apt-get purge -y wget build-essential git python \
 && apt-get autoremove -y --purge \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && mkdir /workspace

VOLUME /workspace

CMD [ "/root/.c9/node/bin/node", "/c9/server.js", "--listen", "0.0.0.0", "-p", "80", "-a", ":", "-w", "/workspace" ]
