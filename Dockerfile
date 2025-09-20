FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy JAR built by GitHub Actions
COPY target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
