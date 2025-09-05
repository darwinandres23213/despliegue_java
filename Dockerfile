FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copiamos Maven wrapper y pom.xml
COPY .mvn/ .mvn/
COPY mvnw mvnw
COPY pom.xml .

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B

# Copiamos el código fuente
COPY src ./src

# Construcción del JAR
RUN ./mvnw clean package -DskipTests

# Usar el puerto dinámico que asigna Koyeb
EXPOSE 8000

# Ejecutar con el puerto que Koyeb pase en la variable de entorno PORT
CMD ["sh", "-c", "java -jar target/despliegue-0.0.1-SNAPSHOT.jar --server.port=${PORT}"]
