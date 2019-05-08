FROM maven:3.6.1-jdk-12 AS Builder
COPY ./ .
RUN mvn clean package


FROM openjdk:12 as Target
COPY --from=Builder target/registry-1.0.0.jar registry.jar 
ENTRYPOINT ["java","-jar","registry.jar"]

EXPOSE 8761