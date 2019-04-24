FROM openjdk:12
ADD ./target/discovery-1.0.0.jar discovery.jar
ENTRYPOINT ["java","-jar","/discovery.jar"]

EXPOSE 8761