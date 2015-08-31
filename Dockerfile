FROM ubuntu:14.10
MAINTAINER Evonove info@evonove.it

# Update system libraries
RUN apt-get update && apt-get upgrade -y

# Build requirements
RUN apt-get install -y build-essential git curl python

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y nodejs
RUN npm install -g coffee-script gulp bower node-sass phantomjs

# Clean everything
#RUN npm config set tmp /root/.tmp && npm cache clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && npm cache clear

VOLUME  ["/opt/build"]
WORKDIR /opt/build

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
