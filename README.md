# elk-docker
Run the ELK stack the "Docker" way

Currently to get this setup working you will need to do the following:

 * Generate certificate(s) for Logstash
 * create a /data directory (or mount) to place LS and ES data

To change the default behavior of these Docker images you can adjust a few environment variables.

For example, you can modify the default amount of heap memory used for the Logstash and Elasticsearch images by adding a section in the config for `ES_HEAP_SIZE` and `LS_HEAP_SIZE`.  The default values for these are 8GB (for ES) and 2GB (for LS).

### Generate certificates for logstash

Modify the generate_certs.sh script to be executable and then generate certs by running `chmod +x generate_certs.sh` from the command line.

The certs should be placed in to the correct location within this repo for the Docker images to build correctly.

### Create /data directory to place data

For this configuration to work correctly you will either need to create the directories by hand or run the setup_dirs script to create the volume mounts that Docker containers use to write data to persistent storage.
