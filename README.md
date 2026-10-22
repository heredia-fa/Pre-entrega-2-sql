# Pre-entrega-2-sql
Segunda pre entrega Coder House

Esquema base de un proyecto retail en **PostgreSQL**, con las tablas `clientes`, `productos` y `ventas`, restricciones de integridad y una carga inicial de datos.

## Requisitos

- PostgreSQL instalado
- pgAdmin (opcional, para ejecutarlo desde una interfaz gráfica)

## Cómo ejecutarlo

1. Crear la base de datos (una sola vez), por ejemplo desde pgAdmin o con:

```sql
   CREATE DATABASE retail_project;
```

2. Conectarse a la base `retail_project` y ejecutar el script `pre-entrega-2.sql`:

   **Opción A: pgAdmin**
   - Clic derecho sobre `retail_project` y abrir el Query Tool.
   - Abrir el archivo `pre-entrega-2.sql` y ejecutarlo completo con F5 (sin nada seleccionado).

   **Opción B: terminal con psql**

```
   psql -U tu_usuario -d retail_project -f pre-entrega-2.sql
```

## Contenido del script

- **DDL**
  - `clientes`: clave primaria, email único y no nulo, `CHECK (edad >= 18)`.
  - `productos`: clave primaria `SERIAL`, precio `DECIMAL(10,2)` con `CHECK (precio > 0)` y stock con `CHECK (stock >= 0)`.
  - `ventas`: clave primaria, dos claves foráneas (hacia `clientes` y `productos`), `CHECK (cantidad > 0)` y fecha de tipo `DATE`. Se crea al final, después de las otras dos tablas.
- **DML**
  - Carga inicial de datos en las tres tablas dentro de una transacción explícita (`BEGIN ... COMMIT`).
  - `UPDATE` masivo de precios (aumento del 10% a los productos con precio menor a 200000), con `WHERE`.
  - `DELETE` de un cliente de prueba, con `WHERE`.
  - `SELECT` previos al UPDATE y al DELETE, y `SELECT` finales para verificar el resultado.

## Importante

El script comienza con `DROP TABLE IF EXISTS`, por lo que **elimina y recrea las tablas cada vez que se ejecuta**. Usar solo en un entorno de desarrollo o prueba.
