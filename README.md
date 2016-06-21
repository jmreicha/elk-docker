# elk-docker
Run the ELK stack the "Docker" way.

Currently to get this setup working you will need to do the following:

 * [Install Docker](https://docs.docker.com/engine/installation/)
 * [Install docker-compose](https://docs.docker.com/compose/install/)

Run `docker-compose up` or `docker-compose up -d` from the root of this repo to start up the ELK stack.

To change the default behavior of any of the individual components there are a few environment variables you can adjust.

For example, you can modify the default amount of heap memory used for Elasticsearch by editing the `ES_JAVA_OPTS=-Xmx1g -Xms1g` values in the elasticsearch definition of the docker-compose.yml file.

Similarly, you can adjust the heap memory for Logstash by editing the `LS_HEAP_SIZE=2048m` section in the logstash definition.

The default values for these are 1GB (for ES) and 2GB (for Logstash).
