FROM ubuntu:latest
RUN apt-get update -y && apt-get install wget -y && apt-get install tar -y && apt-get install xz-utils -y
ADD https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz  /
RUN tar -xJf  sfdx-linux-amd64.tar.xz
WORKDIR /sfdx-cli-v7.82.0-3d0c527ac6-linux-x64
RUN ./install
WORKDIR ../
RUN apt-get install --assume-yes \
  openjdk-11-jdk-headless \
  jq

RUN apt-get autoremove --assume-yes \
  && apt-get clean --assume-yes \
  && rm -rf /var/lib/apt/lists/*

