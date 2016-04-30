# docker run -e TEAMCITY_SERVER=http://teamcity:8111 -dt -p 9090:9090 pluribuslabs/centos7-teamcity-agent

FROM pluribuslabs/centos7-oracle-jdks-7-8

MAINTAINER Pluribus Labs Docker Dev <docker-dev@pluribuslabs.com>

ADD agent-setup.sh /agent-setup.sh
RUN yum -y update && \
    yum -y upgrade && \
    yum -y install wget unzip sudo && \
    adduser teamcity;

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /agent-setup.sh run"
