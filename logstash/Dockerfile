FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV LOGSTASH_VER 1.5.0.rc2
ENV LS_HEAP_SIZE=2g
WORKDIR /opt

# Dependencies
RUN apt-get update -qq && \
 apt-get install -y -qq \
 wget \
 python \
 openjdk-7-jre-headless

# Install Logstash
RUN wget --quiet "https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VER.tar.gz" -O "/opt/logstash-$LOGSTASH_VER.tar.gz" --no-check-certificate && \
 tar zxf logstash-$LOGSTASH_VER.tar.gz && \
 mv logstash-$LOGSTASH_VER logstash

# Install plugins
RUN /opt/logstash/bin/plugin update logstash-output-zeromq
RUN /opt/logstash/bin/plugin install logstash-input-log-courier

# Config files
ADD server.conf /etc/logstash/server.conf
ADD logstash-forwarder.key /etc/logstash/logstash-forwarder.key
ADD logstash-forwarder.crt /etc/logstash/logstash-forwarder.crt

# lumberjack port
EXPOSE 4545
# log-courier port
EXPOSE 4546

CMD /opt/logstash/bin/logstash -f /etc/logstash/server.conf
