# Acortador de URLs

Este es un proyecto de Ruby on Rails que permite acortar URLs. Está completamente configurado para ejecutarse en contenedores Docker y utiliza una base de datos PostgreSQL.

---

## 🚀 Tecnologías

- Ruby on Rails
- PostgreSQL
- Docker / Docker Compose

---

## 🐳 Instrucciones para levantar el proyecto

1. **Construir los contenedores:**

```bash
docker compose build
```

2. **Levantar los servicios:**

```bash
docker compose up
```

Esto levantará tanto la API como la base de datos. El proyecto estará disponible en [http://localhost:3005](http://localhost:3005)

3. **Ejecutar las migraciones (en otra terminal):**

```bash
docker compose exec rails_api rails db:migrate
```

---

## 🌐 Acceder al proyecto

Una vez que el contenedor esté levantado y las migraciones ejecutadas, puedes acceder al acortador de URLs ingresando en tu navegador a:

[http://localhost:3005](http://localhost:3005)

---

## 📂 Estructura del Proyecto

- `rails_api`: Contenedor principal con la aplicación Ruby on Rails.
- `db`: Contenedor de base de datos PostgreSQL.
- `Dockerfile`, `docker-compose.yml`: Archivos de configuración del entorno.

---

## 🧪 Notas

- El proyecto se ejecuta en el puerto **3005**.
- Asegúrate de tener Docker y Docker Compose instalados antes de comenzar.

---

## ✍️ Autor

Desarrollado por Fabian Andres Benavides Valencia
