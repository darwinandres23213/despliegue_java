# Imagen base con JDK
FROM eclipse-temurin:17-jdk

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración de Maven Wrapper
COPY .mvn/ .mvn/
COPY mvnw mvnw
COPY pom.xml .

# Dar permisos de ejecución al wrapper
RUN chmod +x mvnw

# Descargar dependencias (caché)
RUN ./mvnw dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar y empaquetar la app (sin tests)
RUN ./mvnw clean package -DskipTests

# Exponer el puerto de Spring Boot
EXPOSE 8080

# Ejecutar la aplicación directamente
CMD ["java", "-jar", "target/despliegue-0.0.1-SNAPSHOT.jar"]

