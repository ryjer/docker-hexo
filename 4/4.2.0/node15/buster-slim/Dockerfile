FROM node:15-buster-slim

WORKDIR /hexo
VOLUME ["/hexo"]

EXPOSE 4000 

RUN npm install -g hexo-cli \
    && apt-get update \
    && apt-get install git -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]
