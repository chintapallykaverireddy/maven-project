FROM maven:3.9.4-openjdk-17 AS build
WORKDIR /usr/src/helloprint
COPY . /usr/src/helloprint/
RUN mvn clean package

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /usr/src/helloprint/target/helloprint-maven-0.0.1-SNAPSHOT-jar-with-dependencies.jar .
CMD ["java", "-jar", "helloprint-maven-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]