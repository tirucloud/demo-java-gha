
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the shaded JAR built by Maven Shade Plugin
COPY target/gs-maven-0.1.0-shaded.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

# Stage 2: Run Java app
FROM eclipse-temurin:17-jdk as app
WORKDIR /app
COPY target/gs-maven-0.1.0-shaded.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

# Stage 3: Nginx reverse proxy
FROM nginx:alpine as nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
