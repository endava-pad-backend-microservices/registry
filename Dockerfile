FROM maven:3.6.1-jdk-12 AS builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /build/src/
RUN mvn package

FROM openjdk:12 as Target
COPY --from=Builder /build/target/registry-1.0.0.jar registry.jar 
ENTRYPOINT ["java","-jar","registry.jar"]

EXPOSE 8761