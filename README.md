# elk-docker
Run the ELK stack the "Docker" way

Currently to get this setup working you will need to do the following:

 * Generate certificate(s) for Logstash
 * Update Elasticsearch and Kibana Dockerfiles to use correct domain
 * create a /data directory (or mount) to place LS and ES data


### Generate certificates for logstash

Modify the generate_certs.sh script to be executable and then generate certs by running `chmod +x generate_certs.sh` from the command line.

The certs should be placed in to the correct location within this repo for the Docker images to build correctly.

### Update Dockerfiles to use correct domain

Todo: Add the ability to configure the domain name for config files by passing the domain name as an environment variable.

### Create /data directory to place data

For this configuration to work correctly you will either need to create the directories by hand or run the setup_dirs script to create the volume mounts that Docker containers use to write data to persistent storage.
