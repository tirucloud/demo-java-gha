
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the shaded JAR built by Maven Shade Plugin
COPY target/gs-maven-0.1.0.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
