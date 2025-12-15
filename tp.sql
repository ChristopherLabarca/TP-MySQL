Ejercicio 1 – Crear Base de Datos 
Crear una base de datos llamada veterinaria_patitas_felices. 

create tabla duenos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL
    APELLIDO VARCHAR(50) NOT NULL
    TELEFONO VARCHAR(50) NOT NULL
)

Ejercicio 2 – Crear tabla duenos 
Crear la tabla duenos con las siguientes columnas:

Ejercicio 3 – Crear tabla mascotas 
Crear la tabla mascotas con las siguientes columnas:

Ejercicio 4 – Crear tabla veterinarios 
Crear la tabla veterinarios con las siguientes columnas:

Ejercicio 5 – Crear tabla historial_clinico 
Crear la tabla historial_clinico con las siguientes columnas:

Ejercicio 6 – Insertar registros 
Insertar: 
● 3 dueños con información completa 
● 3 mascotas, cada una asociada a un dueño 
● 2 veterinarios con especialidades distintas 
● 3 registros de historial clínico

Ejercicio 7 – Actualizar registros 
Realizar las siguientes actualizaciones: 
1. Cambiar la dirección de un dueño (por ID o nombre). 
2. Actualizar la especialidad de un veterinario (por ID o matrícula). 
3. Editar la descripción de un historial clínico (por ID).

Ejercicio 8 – Eliminar registros 
1. Eliminar una mascota (por ID o nombre). 
2. Verificar que se eliminen automáticamente los registros del historial clínico asociados 
(ON DELETE CASCADE).

Ejercicio 9 – JOIN simple 
Consulta que muestre: 
● Nombre de la mascota 
● Especie 
● Nombre completo del dueño (nombre + apellido)

Ejercicio 10 – JOIN múltiple con historial 
Consulta que muestre todas las entradas del historial clínico con: 
● Nombre y especie de la mascota 
● Nombre completo del dueño 
● Nombre completo del veterinario 
● Fecha de registro 
● Descripción

Ordenados por fecha de registro descendente (DESC). 

Recomendaciones 
Se valorará especialmente: 
● Código SQL limpio y comentado 
● Organización del proyecto 
● Nomenclatura clara y consistente 
● Buenas prácticas: 
○ Uso de índices en claves foráneas 
○ Restricciones NOT NULL cuando corresponda 
Recursos adicionales 
● Documentación oficial de MySQL 
● Tutoriales básicos de SQL 
Soporte 
Ante dudas, consultar: 
● Documentación de MySQL 
● Materiales del curso 
● Instructor/a