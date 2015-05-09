# elk-docker
Run the ELK stack the "Docker" way

Currently to get this setup working you will need to do the following:

 * Generate your certificate for Logstash
 * Update Elasticsearch and kibana Dockerfiles to use correct domain
 * create a /data directory (or mount) to place LS and ES data
