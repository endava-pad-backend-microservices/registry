FROM openjdk:12
ADD ./target/registry-1.0.0.jar registry.jar
ENTRYPOINT ["java","-jar","/registry.jar"]

EXPOSE 8761