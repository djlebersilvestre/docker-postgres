###############################################################
## Dockerfile to build a ready to go PostgreSQL database     ##
###############################################################

# Pull base image
FROM postgres:9.4.1
MAINTAINER Daniel Silvestre (djlebersilvestre@github.com)

# Authorizing connections
ADD fix-acl.sh /docker-entrypoint-initdb.d/

# \o/
RUN echo "Ready to go! Check README.md for more instructions on how to run and connect to the container." >> /etc/bash.bashrc
