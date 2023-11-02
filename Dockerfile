FROM jelastic/maven:3.9.5-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/smartcontact-0.0.1-SNAPSHOT.jar smartcontact.jar
EXPOSE 8282
ENTRYPOINT ["java", "-jar", "demo.jar"]