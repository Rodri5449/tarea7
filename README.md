# Ejercicio propuesto - PostgreSQL + Adminer

Este material implementa el ejercicio propuesto del taller: levantar un contenedor con PostgreSQL y acceder a la base de datos mediante Adminer.

## 1. Requisitos
- Docker instalado y funcionando.
- Docker Compose disponible como `docker compose`.
- Acceso a una terminal.

## 2. Opcion recomendada: Docker Compose

Entra a esta carpeta y ejecuta:

```bash
docker compose up -d
```

Comprueba los contenedores:

```bash
docker ps
```

Ver los logs de PostgreSQL:

```bash
docker logs postgres_c
```

Ver los logs de Adminer:

```bash
docker logs adminer_postgres_c
```

## 3. Acceso a Adminer

Abre en el navegador:

```text
http://localhost:8081
```

En una VM/cloud reemplaza `localhost` por la IP publica de la VM.

Datos de acceso:

- Sistema: PostgreSQL
- Servidor: `postgres`
- Usuario: `postgres`
- Contraseña: `utec`
- Base de datos: `ejercicio_postgres`

## 4. Validar la tabla de ejemplo

Al iniciar una base nueva, `init.sql` crea la tabla `alumnos` e inserta tres registros.

Consulta:

```sql
SELECT * FROM alumnos;
```

## 5. Validaciones utiles

Listar contenedores:

```bash
docker ps
```

Listar volumenes:

```bash
docker volume ls
```

Listar redes:

```bash
docker network ls
```

Entrar al cliente psql dentro del contenedor:

```bash
docker exec -it postgres_c psql -U postgres -d ejercicio_postgres
```

Salir de psql:

```text
\\q
```

## 6. Si prefieres hacerlo sin Compose

Crear volumen:

```bash
docker volume create postgres_data
```

Crear red:

```bash
docker network create red_bd
```

Ejecutar PostgreSQL:

```bash
docker run -d --name postgres_c --network red_bd \\
  -e POSTGRES_USER=postgres \\
  -e POSTGRES_PASSWORD=utec \\
  -e POSTGRES_DB=ejercicio_postgres \\
  -p 8006:5432 \\
  -v postgres_data:/var/lib/postgresql/data \\
  postgres:17
```

Ejecutar Adminer:

```bash
docker run -d --name adminer_postgres_c --network red_bd \\
  -e ADMINER_DEFAULT_SERVER=postgres_c \\
  -p 8081:8080 \\
  adminer:6.0.1-standalone
```

Luego entra a:

```text
http://localhost:8081
```

Y usa PostgreSQL / servidor `postgres_c` / usuario `postgres` / contraseña `utec`.

## 7. Evidencias recomendadas para Padlet

Toma capturas de pantalla donde se vea:

1. `docker ps` mostrando PostgreSQL y Adminer en ejecución.
2. `docker volume ls` mostrando `postgres_data`.
3. `docker network ls` mostrando `red_bd`.
4. Adminer mostrando el formulario de conexión.
5. Adminer conectado a PostgreSQL y mostrando la base `ejercicio_postgres`.
6. La tabla `alumnos` con los tres registros.
7. La consulta `SELECT * FROM alumnos;` con resultados.

## 8. Limpieza

Detener y eliminar los contenedores manteniendo los datos:

```bash
docker compose down
```

Eliminar tambien el volumen y perder los datos:

```bash
docker compose down -v
```
