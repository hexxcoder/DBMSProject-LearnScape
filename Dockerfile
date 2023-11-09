FROM jelastic/maven:3.9.5-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/SmartContactManager-0.0.1-SNAPSHOT.jar smartcontactmanager.jar
EXPOSE 8282
ENTRYPOINT ["java", "-jar", "smartcontactmanager.jar"]
