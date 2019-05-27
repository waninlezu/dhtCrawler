FROM node:10-alpine

ADD https://github.com/beilunyang/dhtCrawler/archive/master.tar.gz /Downloads/master.tar.gz

RUN tar -xzf /Downloads/master.tar.gz && \
    mv /dhtCrawler-master /dhtCrawler && \
    cd /dhtCrawler && \
    npm i --ignore-scripts && \
    npm cache clean --force && \
    adduser --disabled-password --gecos "dhtCrawler" --home /dhtCrawler --no-create-home dhtCrawler

WORKDIR /dhtCrawler

USER dhtCrawler

CMD [ "npm", "start" ]