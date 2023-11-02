FROM jelastic/maven:3.9.5-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/Smartcontactmanager-0.0.1-SNAPSHOT.jar Smartcontactmanager.jar
EXPOSE 8282
ENTRYPOINT ["java", "-jar", "Smartcontactmanager.jar"]
