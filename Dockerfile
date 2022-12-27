FROM openjdk:8u131-slim
RUN mkdir app
EXPOSE 8080
RUN apt-get update && apt-get install -y wget
RUN wget https://downloads.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz 
RUN mkdir /opt/maven
RUN tar xzvf apache-maven-3.8.6-bin.tar.gz -C /opt/maven
RUN export PATH=$PATH:/opt/maven/apache-maven-3.8.6/bin
USER root
RUN mkdir pipes
COPY pipes/ /pipes/
WORKDIR /pipes
RUN /opt/maven/apache-maven-3.8.6/bin/mvn package
CMD [ "java" , "-jar", "/pipes/target/pipes-0.0.1-SNAPSHOT.war"]