FROM openjdk:8

ENV SCALA_VERSION 2.13
ENV KAFKA_VERSION 2.6.0
ENV KAFKA_HOME /opt/kafka
ENV TOPIC topic-0

RUN curl -s https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | \
    tar -xvz -C /opt && \
    mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME}

WORKDIR ${KAFKA_HOME}

CMD bin/zookeeper-server-start.sh config/zookeeper.properties & \
    sleep 5 && bin/kafka-topics.sh --create --topic ${TOPIC} --bootstrap-server localhost:9092 & \
    sleep 2 && bin/kafka-server-start.sh config/server.properties
