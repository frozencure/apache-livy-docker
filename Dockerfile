FROM openjdk:8-jdk

ENV APACHE_SPARK_VERSION 2.4.4
ENV HADOOP_VERSION 2.7


RUN cd /tmp && \
        wget http://mirrors.hostingromania.ro/apache.org/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && \
        tar zxvf spark-2.4.4-bin-hadoop2.7.tgz -C /usr/local --owner root --group root --no-same-owner && \
        rm spark-2.4.4-bin-hadoop2.7.tgz

RUN cd /usr/local && ln -s spark-2.4.4-bin-hadoop2.7 spark
ENV SPARK_HOME /usr/local/spark
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info


RUN mkdir -p /src/livy
WORKDIR /src/livy

RUN apt-get update && apt-get install -y wget
RUN wget http://mirror.evowise.com/apache/incubator/livy/0.6.0-incubating/apache-livy-0.6.0-incubating-bin.zip

RUN apt-get update && apt-get install unzip
RUN unzip apache-livy-0.6.0-incubating-bin.zip

COPY ./livy.conf /src/livy/apache-livy-0.6.0-incubating-bin/conf/

SHELL ["/bin/bash", "-c"]
RUN mkdir -p /src/livy/apache-livy-0.6.0-incubating-bin/logs
CMD ["/src/livy/apache-livy-0.6.0-incubating-bin/bin/livy-server"]