FROM debian:stretch-slim

RUN apt-get update
RUN apt-get update

RUN apt-get install -y python-setuptools python python-pip

RUN apt-get install -y dos2unix libfontconfig git wget bzip2 libc6-dev --no-install-recommends && \
    pip install awscli && \
    apt-get autoremove --purge -y && \
    apt-get clean

RUN mkdir /docker-java-home
RUN wget --no-check-certificate https://download.java.net/java/GA/jdk12/GPL/openjdk-12_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-12_linux-x64_bin.tar.gz -C ./docker-java-home
ENV JAVA_HOME /docker-java-home/jdk-12
ENV JAVA_VERSION 12.0.0

CMD ["java"]
