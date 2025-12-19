
/*Ejercicio 1 – Crear Base de Datos 
Crear una base de datos llamada veterinaria_patitas_felices.*/;

CREATE DATABASE IF NOT EXISTS `veterinaria_patitas_felices` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `veterinaria_patitas_felices`;

/*Ejercicio 2 – Crear tabla duenos 
Crear la tabla duenos con las siguientes columnas*/;

create table duenos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    direccion VARCHAR(100)
);


/*Ejercicio 3 – Crear tabla mascotas 
Crear la tabla mascotas con las siguientes columnas:*/;

create table mascotas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
    );


/*Ejercicio 4 – Crear tabla veterinarios 
Crear la tabla veterinarios con las siguientes columnas:*/;

create table veterinario (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL, 
matricula VARCHAR(20) NOT NULL UNIQUE, 
especialidad VARCHAR(50) NOT NULL
);

/*Ejercicio 5 – Crear tabla historial_clinico 
Crear la tabla historial_clinico con las siguientes columnas:*/;

create table historial_clinico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE
);

/*Ejercicio 6 – Insertar registros 
Insertar: listo*/;
/*● 3 dueños con información completa */;
INSERT INTO `duenos` (`id`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES
(1, 'mike', 'kaer', '11-2233-4455', 'mercedes'),
(2, 'jose', 'carrasco', '11-3356-5555', 'belgrano'),
(3, 'ezio', 'audiotre', '?????', '?????');

/*● 3 mascotas, cada una asociada a un dueño */;
INSERT INTO `mascotas` (`id`, `nombre`, `especie`, `fecha_nacimiento`, `id_dueno`) VALUES
(1, 'kurt', 'pitbull', '2022-05-15', 1),
(2, 'lizy', 'komodoro', '2021-10-10', 2),
(3, 'firu', 'chihuahua', '2020-05-10', 3);

/*● 2 veterinarios con especialidades distintas */;
INSERT INTO `veterinario` (`id`, `nombre`, `apellido`, `matricula`, `especialidad`) VALUES
(1, 'Alejandro', 'Díaz', '555-4001', 'Cardiología Veterinaria'),
(2, 'Camila', 'Soto', '555-4002', 'Odontología Veterinaria');


/*● 3 registros de historial clínico*/;
INSERT INTO `historial_clinico` (`id`, `id_mascota`, `id_veterinario`, `fecha_registro`, `descripcion`) VALUES
(1, 1, 2, '2022-02-02 00:00:00', 'revision'),
(2, 2, 2, '2022-02-03 00:00:00', 'remplazo de diente'),
(3, 3, 1, '2022-02-03 00:00:00', 'chequeo de emergencia');



/*Ejercicio 7 – Actualizar registros 
Realizar las siguientes actualizaciones:*/;
/*1. Cambiar la dirección de un dueño (por ID o nombre).*/;
UPDATE duenos SET direccion = 'Avenida Central' 
WHERE id = 1;

/*2. Actualizar la especialidad de un veterinario (por ID o matrícula). */;

UPDATE veterinario 
SET especialidad = 'Dermatología Veterinaria' 
WHERE id = 2;

/*3. Editar la descripción de un historial clínico (por ID).*/;
UPDATE historial_clinico 
SET descripcion = 'El paciente muestra mejoría. Se ajustó la dosis de analgésicos y se recomienda reposo por 3 días más.' 
WHERE id = 3;

/*Ejercicio 8 – Eliminar registros 
1. Eliminar una mascota (por ID o nombre). */;
DELETE FROM `mascotas` WHERE id = 3;
/*2. Verificar que se eliminen automáticamente los registros del historial clínico asociados */;


/*Ejercicio 9 – JOIN simple 
Consulta que muestre: 
● Nombre de la mascota 
● Especie 
● Nombre completo del dueño (nombre + apellido)*/;

SELECT 
    m.nombre AS mascota, 
    m.especie AS especie, 
    CONCAT(d.NOMBRE, ' ', d.APELLIDO) AS dueno,
    d.TELEFONO AS Contacto
FROM mascotas AS m
INNER JOIN duenos AS d ON m.id_dueno = d.id
WHERE d.NOMBRE = 'Mike';

/*Ejercicio 10 – JOIN múltiple con historial 
Consulta que muestre todas las entradas del historial clínico con:
● Nombre y especie de la mascota 
● Nombre completo del dueño 
● Nombre completo del veterinario 
● Fecha de registro 
● Descripción*/;

SELECT 
    m.nombre AS nombre_mascota,
    m.especie,
    CONCAT(d.NOMBRE, ' ', d.APELLIDO) AS nombre_completo_dueno,
    CONCAT(v.nombre, ' ', v.apellido) AS nombre_completo_veterinario,
    hc.fecha_registro,
    hc.descripcion
FROM historial_clinico AS hc
INNER JOIN mascotas AS m ON hc.id_mascota = m.id
INNER JOIN duenos AS d ON m.id_dueno = d.id
INNER JOIN veterinario AS v ON hc.id_veterinario = v.id
ORDER BY hc.fecha_registro DESC;

