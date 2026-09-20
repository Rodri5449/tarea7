CREATE TABLE IF NOT EXISTS alumnos (
    id SERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL
);

INSERT INTO alumnos (nombres, apellidos, correo)
VALUES
    ('Ana', 'Perez', 'ana.perez@example.com'),
    ('Luis', 'Gomez', 'luis.gomez@example.com'),
    ('Maria', 'Torres', 'maria.torres@example.com');
