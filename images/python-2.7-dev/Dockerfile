FROM centos-dev:latest
MAINTAINER Mark Bonano "mark@chazmar.com"

# set python version
ENV PYTHON_VERSION 2.7.13

# Install python
WORKDIR /tmp
ADD https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz /tmp/
RUN tar -xvzf Python-$PYTHON_VERSION.tgz
WORKDIR /tmp/Python-$PYTHON_VERSION
RUN ./configure --prefix=/usr/local && \
    make && \
    make altinstall

# create a symlink python -> python2.7
RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

# install pip
WORKDIR  /tmp
ADD https://bootstrap.pypa.io/ez_setup.py /tmp/
RUN python ez_setup.py
RUN easy_install pip

# map source volume from host
VOLUME /var/local/app
WORKDIR /var/local/app
