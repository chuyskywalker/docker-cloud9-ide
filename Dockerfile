FROM ubuntu

# Install build items, clone in c9, build c9, install dumb-init, remove all build items and cleanup
RUN apt-get update \
 && apt-get install -y wget build-essential git python \
\
 && git clone --depth=1 git://github.com/c9/core.git /c9 \
 && /c9/scripts/install-sdk.sh \
 && mkdir /workspace \
\
 && wget https://github.com/Yelp/dumb-init/releases/download/v1.0.3/dumb-init_1.0.3_amd64.deb \
 && dpkg -i dumb-init_*.deb \
\
 && apt-get purge -y wget build-essential git python \
 && apt-get autoremove -y --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /workspace

CMD [ "dumb-init", "/root/.c9/node/bin/node", "/c9/server.js", "--listen", "0.0.0.0", "-p", "80", "-a", ":", "-w", "/workspace" ]
