# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest
WORKDIR /app

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

COPY ./target/docker-app.jar /app

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

EXPOSE 8080
CMD ["java", "-jar", "docker-app.jar"]
