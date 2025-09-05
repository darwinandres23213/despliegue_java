# Aplicación Spring Boot - Despliegue en Koyeb

## Descripción
API REST para gestión de productos con Spring Boot, JPA/Hibernate y base de datos.

## Configuración Local
Para desarrollo local, la aplicación usa H2 (base de datos en memoria):
```bash
./mvnw spring-boot:run
```

La aplicación estará disponible en: http://localhost:8080
- H2 Console: http://localhost:8080/h2-console

## Despliegue en Koyeb

### 1. Configuración de Variables de Entorno en Koyeb
En el panel de Koyeb, configura estas variables de entorno:
- `JDBC_DATABASE_URL`: URL de tu base de datos MySQL/PostgreSQL
- `JDBC_DATABASE_USERNAME`: Usuario de la base de datos
- `JDBC_DATABASE_PASSWORD`: Contraseña de la base de datos
- `SPRING_PROFILES_ACTIVE`: prod

### 2. Comandos de Build
```bash
# Para desarrollo local
./mvnw spring-boot:run

# Para generar JAR para Koyeb
./mvnw clean package -DskipTests
```

### 3. Endpoints de la API
- `GET /api/productos` - Listar todos los productos
- `GET /api/productos/{id}` - Obtener producto por ID
- `POST /api/productos` - Crear nuevo producto
- `PUT /api/productos/{id}` - Actualizar producto
- `DELETE /api/productos/{id}` - Eliminar producto

### 4. Estructura del Proyecto
```
src/
├── main/
│   ├── java/com/example_despliegue/despliegue/
│   │   ├── controller/ProductoController.java
│   │   ├── entity/Producto.java
│   │   ├── repository/ProductoRepository.java
│   │   ├── service/ProductoService.java
│   │   └── DespliegueApplication.java
│   └── resources/
│       ├── application.properties (desarrollo local)
│       └── application-prod.properties (producción)
```

## Notas Importantes
- En desarrollo local usa H2 (base de datos en memoria)
- En producción (Koyeb) usa las variables de entorno para la base de datos real
- Los tests se saltan durante el build para evitar problemas de configuración
