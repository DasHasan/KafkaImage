FROM openjdk:8

ENV SCALA_VERSION 2.13
ENV KAFKA_VERSION 2.6.0

RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O /opt/kafka.tgz && tar -xzf /opt/kafka.tgz -C /opt/ && rm /opt/kafka.tgz
ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} 
WORKDIR ${KAFKA_HOME}
CMD sh -c "bin/zookeeper-server-start.sh config/zookeeper.properties & sleep 2 && bin/kafka-server-start.sh config/server.properties"
