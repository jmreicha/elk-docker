# Pull base image.
FROM dockerfile/java:oracle-java7

# Set install version
ENV ES_PKG_NAME elasticsearch-1.5.0
ENV ES_HEAP_SIZE=8g

# Install ElasticSearch
RUN \
 cd / && \
 wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
 tar xvzf $ES_PKG_NAME.tar.gz && \
 rm -f $ES_PKG_NAME.tar.gz && \
 mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Custom ES config
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Expose ports
EXPOSE 9200
EXPOSE 9300

# Default command
CMD ["/elasticsearch/bin/elasticsearch"]
