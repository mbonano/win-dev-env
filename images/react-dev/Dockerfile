FROM centos-dev:latest
MAINTAINER Mark Bonano "mark@chazmar.com"

# install core dependencies
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs npm

# map source volume from host
VOLUME /var/local/app
WORKDIR /var/local/app
