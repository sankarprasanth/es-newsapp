#
# ElasticSearch Dockerfile
#
# https://github.com/dockerize/elasticsearch
#

# Pull base image
FROM dockerize/java:1.8

MAINTAINER Dockerize "http://dockerize.github.io"

# Install ElasticSearch
ENV VERSION 2.4.4
ENV FILE elasticsearch-$VERSION.tar.gz

RUN wget -O /tmp/$FILE https://download.elasticsearch.org/elasticsearch/elasticsearch/$FILE
RUN tar -xzf /tmp/$FILE -C /tmp
RUN mv /tmp/elasticsearch-$VERSION /elasticsearch

# Install plugins
# RUN /elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
# RUN /elasticsearch/bin/plugin -install mobz/elasticsearch-head
# RUN /elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/master
# RUN /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.1.1

# Mountable directory
VOLUME ["/mnt/ed01/es"]

# Working directory
#WORKDIR /mnt/ed01/es

#copy elasticsearch.yml
COPY ./elasticsearch.yml /elasticsearch/config

# Expose ports (9200: HTTP, 9300: Transport)
EXPOSE 9200 9300

# RUN
ENTRYPOINT ["/elasticsearch/bin/elasticsearch","-Des.insecure.allow.root=true"]
