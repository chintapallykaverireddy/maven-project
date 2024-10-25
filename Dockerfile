# Build stage with Maven
FROM maven:3.8.7 AS build
WORKDIR /usr/src/helloprint
COPY . /usr/src/helloprint/
RUN mvn clean package -DdescriptorId=jar-with-dependencies

# Runtime stage with OpenJDK
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /usr/src/helloprint/target/helloprint-0.0.1-SNAPSHOT-jar-with-dependencies.jar .
CMD ["java", "-jar", "helloprint-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
