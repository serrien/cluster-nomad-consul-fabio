FROM ubuntu:xenial
LABEL maintainer="Signal Sciences Corp."

RUN apt-get update; apt-get install -y apt-transport-https curl ; curl -slL https://apt.signalsciences.net/release/gpgkey | apt-key add -; apt-get update;
RUN echo "deb https://apt.signalsciences.net/release/ubuntu/ xenial main" | tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update
RUN apt-get install sigsci-agent

RUN systemctl enable sigsci-agent

ENTRYPOINT ["/usr/sbin/sigsci-agent"]