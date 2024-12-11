# Utiliser une image Java comme base
FROM openjdk:17-jdk-slim

# Copier le fichier JAR de l'application
COPY target/examen-devops-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port de l'application
EXPOSE 8888

# Lancer l'application
ENTRYPOINT ["java", "-jar", "/app.jar"]

