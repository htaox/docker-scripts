# Base Ubuntu Precise 12.04 LTS image w/ Java 8 & Maven installed
#
# FROM htaox/oracle-java8:latest
FROM java:8u45-jdk
MAINTAINER htaox htaox@hotmail.com

# Install tools
RUN apt-cache search maven
RUN apt-get install -y git maven openssh-server

RUN git clone https://github.com/apache/incubator-tinkerpop.git

RUN cd incubator-tinkerpop && mvn clean package -DskipTests

RUN cp incubator-tinkerpop/gremlin-server/target/gremlin-server-3.0.0-SNAPSHOT-distribution.zip /opt

RUN cd /opt && unzip gremlin-server-3.0.0-SNAPSHOT-distribution.zip

RUN ln -s /opt/gremlin-server-3.0.0-SNAPSHOT /opt/gremlin-server && cd /opt/gremlin-server

EXPOSE 8182

ADD files /root/gremlin_files
RUN chmod 700 /root/gremlin_files/default_cmd
CMD ["/root/gremlin_files/default_cmd"]
