# Base Ubuntu Precise 12.04 LTS image
# Based on: http://robtweed.wordpress.com/2014/03/02/ewd-js-and-vista-lets-get-started/
FROM ubuntu:precise
MAINTAINER htaox htaox@hotmail.com

# Setup a volume for data
VOLUME ["/data"]

# Set correct source list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# install a few other useful packages
RUN apt-get update && apt-get upgrade -y
##RUN apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
RUN apt-get install -y git-core

# Docker messes up /etc/hosts and adds two entries for 127.0.0.1
# we try to recover from that by giving /etc/resolv.conf and therefore
# the nameserver priority
RUN sed -i s/"files dns"/"dns files"/ /etc/nsswitch.conf

EXPOSE 8080

# add vistA-ewdjs config file templates
ADD files /root/vista_ewdjs_files

RUN chmod 700 /root/vista_ewdjs_files/default_cmd
CMD ["/root/vista_ewdjs_files/default_cmd"]
