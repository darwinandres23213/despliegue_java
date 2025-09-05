FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY .mvn/ .mvn/
COPY mvnw mvnw
COPY pom.xml .
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B
COPY src ./src
RUN ./mvnw clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/despliegue-0.0.1-SNAPSHOT.jar"]

