CREATE DATABASE IF NOT EXISTS examen_recetas_marroquin
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE examen_recetas_marroquin;

CREATE TABLE IF NOT EXISTS chefs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  apellido VARCHAR(120) NOT NULL,
  email VARCHAR(180) NOT NULL UNIQUE,
  telefono VARCHAR(30) NULL,
  ciudad VARCHAR(100) NOT NULL,
  biografia TEXT NULL,
  anios_experiencia TINYINT UNSIGNED NOT NULL DEFAULT 0,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS especialidades_chef (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  chef_id BIGINT UNSIGNED NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  descripcion VARCHAR(255) NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_especialidades_chef
    FOREIGN KEY (chef_id) REFERENCES chefs(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT uq_especialidad_por_chef UNIQUE (chef_id, nombre)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS redes_chef (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  chef_id BIGINT UNSIGNED NOT NULL,
  plataforma VARCHAR(80) NOT NULL,
  url VARCHAR(255) NOT NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_redes_chef
    FOREIGN KEY (chef_id) REFERENCES chefs(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT uq_red_por_chef UNIQUE (chef_id, plataforma)
) ENGINE=InnoDB;

INSERT INTO chefs
  (nombre, apellido, email, telefono, ciudad, biografia, anios_experiencia)
VALUES
  (
    'Amina',
    'Benali',
    'amina.benali@example.com',
    '+212600000001',
    'Marrakech',
    'Chef especializada en cocina tradicional marroqui y preparaciones familiares.',
    12
  ),
  (
    'Karim',
    'El Fassi',
    'karim.elfassi@example.com',
    '+212600000002',
    'Fez',
    'Chef dedicado a recetas clasicas, panes artesanales y platos con especias.',
    9
  )
ON DUPLICATE KEY UPDATE
  nombre = VALUES(nombre),
  apellido = VALUES(apellido),
  telefono = VALUES(telefono),
  ciudad = VALUES(ciudad),
  biografia = VALUES(biografia),
  anios_experiencia = VALUES(anios_experiencia);

INSERT INTO especialidades_chef (chef_id, nombre, descripcion)
SELECT id, 'Tajine', 'Preparaciones lentas con especias, verduras y carnes.'
FROM chefs
WHERE email = 'amina.benali@example.com'
ON DUPLICATE KEY UPDATE descripcion = VALUES(descripcion);

INSERT INTO especialidades_chef (chef_id, nombre, descripcion)
SELECT id, 'Cuscus', 'Cuscus tradicional con verduras y caldo especiado.'
FROM chefs
WHERE email = 'karim.elfassi@example.com'
ON DUPLICATE KEY UPDATE descripcion = VALUES(descripcion);

INSERT INTO redes_chef (chef_id, plataforma, url)
SELECT id, 'Instagram', 'https://instagram.com/amina.benali'
FROM chefs
WHERE email = 'amina.benali@example.com'
ON DUPLICATE KEY UPDATE url = VALUES(url);

INSERT INTO redes_chef (chef_id, plataforma, url)
SELECT id, 'Instagram', 'https://instagram.com/karim.elfassi'
FROM chefs
WHERE email = 'karim.elfassi@example.com'
ON DUPLICATE KEY UPDATE url = VALUES(url);
