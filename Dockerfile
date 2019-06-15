FROM node:10-stretch
MAINTAINER Owen Peng
WORKDIR /tmp
RUN npm install -g protractor mocha jasmine && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y vim xvfb wget openjdk-8-jre-headless && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /protractor

WORKDIR /protractor

ADD conf.js /protractor/
COPY test /protractor/test
ADD init.sh /init.sh
RUN chmod +x /init.sh
# Fix for the issue with Selenium, as described here:
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

ENTRYPOINT ["sh", "/init.sh"]


