FROM maven:3.9.9-openjdk-21 AS build
COPY target/helloprint-maven-0.0.1-SNAPSHOT-jar-with-dependencies.jar /usr/src/helloprint/ 
WORKDIR /usr/src/helloprint
CMD ["java", "-jar", "helloprint-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
