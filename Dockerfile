FROM openjdk:8u131-slim
RUN mkdir app
WORKDIR /app
EXPOSE 8080
COPY pipes-0.0.1-SNAPSHOT.war ./pipes-0.0.1-SNAPSHOT.war
CMD [ "java" , "-jar", "pipes-0.0.1-SNAPSHOT.war"]