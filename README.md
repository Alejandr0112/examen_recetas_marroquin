# Examen Recetas Marroquin

Repositorio para el examen de recetas marroquies.

## Base de datos

La migracion de chefs esta en:

```text
database/migrations/001_create_chefs_tables.sql
```

Incluye las tablas:

- `chefs`
- `especialidades_chef`
- `redes_chef`

Para cargarla en MySQL o MariaDB:

```bash
mysql -u root -p < database/migrations/001_create_chefs_tables.sql
```
