#!/bin/bash

set -e 

cert_days=3650
logstash_key=./logstash/logstash-forwarder.key
logstash_crt=./logstash/logstash-forwarder.crt

function make_certs {
    openssl req -x509 -days $cert_days -batch -nodes -newkey rsa:2048 \
    -keyout $logstash_key \
    -out $logstash_crt \
    -subj /CN=$domain_name
}

# Check if both certs are present
if [ ! -f $logstash_key ] && [ ! -f $logstash_crt ] ; then
    echo "Generating self signed certs for logstash"
    echo "Enter fqdn for cert"
    read domain_name
    make_certs
    echo "Done"
elif [ ! -f $logstash_key ] || [ ! -f $logstash_crt ] ; then
    echo "Cert missing. Removing old certs and regenerating."
    rm -f ./logstash/logstash-forwarder*
    echo "Enter fqdn for cert"
    read domain_name
    make_certs
else
    echo "Certificates already exist!"
fi
