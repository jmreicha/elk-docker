#!/bin/bash

set -e 

function make_certs {
    openssl req -x509 -days 3650 -batch -nodes -newkey rsa:2048 \
    -keyout ./logstash/logstash-forwarder.key \
    -out ./logstash/logstash-forwarder.crt
}

# Check if both certs are present
if [ ! -f ./logstash/logstash-forwarder.key ] && [ ! -f ./logstash/logstash-forwarder.crt ] ; then
    echo "Generating self signed certs for logstash"
    make_certs
    echo "Done"
elif [ ! -f ./logstash/logstash-forwarder.key ] || [ ! -f ./logstash/logstash-forwarder.crt ] ; then
    echo "Cert missing. Removing old certs and regenerating."
    rm -f ./logstash/logstash-forwarder*
    make_certs
else
    echo "Certificates already exist!"
fi
