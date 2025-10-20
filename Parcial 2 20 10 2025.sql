 /*Bases de datos veterinaria*/
create database TechNova ;

/*Se establece que se va a trabajar sobre la base de datos*/
USE TechNova;

CREATE TABLE Departamento (
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DECIMAL(12,2) CHECK (presupuesto > 0)
);

CREATE TABLE Empleado (
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
cargo VARCHAR(50),
salario DECIMAL(10,2) CHECK (salario > 0),
id_departamento INT,
fecha_ingreso DATE,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Proyecto (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
fecha_inicio DATE,
presupuesto DECIMAL(12,2),
id_departamento INT,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Asignacion (
id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
id_empleado INT,
id_proyecto INT,
horas_trabajadas INT CHECK (horas_trabajadas >= 0),
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

/*Inserciones de las tablas departamento*/

insert into Departamento
values(NULL,"TI",1000000000),
(NULL,"RH",1000000000),
(NULL,"FINANZAS",1000000000);

select * from Departamento;

/*Inserciones de las tablas de empleado*/

insert into Empleado
values(NULL,"Juan","Junior",1000000000,1,"2025-02-05 09:15:00"),
(NULL,"carlos","jefe",1000000000,1,"2024-02-10 09:15:00"),
(NULL,"fabian","junior",1000000000,1,"2023-02-10 09:15:00"),
(NULL,"andres","jefe",1000000000,1,"2023-03-10 09:15:00"),
(NULL,"luis","jefe",1000000000,1,"2021-02-10 09:15:00");

select * from Empleado;

/*Inserciones de las tabla proyecto*/

insert into Proyecto
values(NULL,"proyecto 1","2020-07-05 09:15:00",1000000,2),
(NULL,"proyecto 2","2020-04-05 09:15:00",1000000,2),
(NULL,"proyecto 3","2020-03-05 09:15:00",1000000,2),
(NULL,"proyecto 4","2020-02-05 09:15:00",1000000,2),
(NULL,"proyecto 5","2020-01-05 09:15:00",1000000,2);

select * from Proyecto;

/*insersion de las asignaciones*/

insert into Asignacion
values(NULL,5,1,80),
(NULL,1,3,80),
(NULL,2,2,80),
(NULL,3,1,80),
(NULL,4,1,80);

insert into Asignacion
values(NULL,5,2,80);


select * from Asignacion;
/*caso numero 1*/

/*Función: ProyectosPorEmpleado(id_empleado)*/

DELIMITER $$
CREATE FUNCTION ProyectosPorEmpleado(id_empleado int)
RETURNS int(255)
DETERMINISTIC
BEGIN
    DECLARE v_nombremepleado VARCHAR(150);
    DECLARE v_proyectoEmpleado VARCHAR(50);

    SELECT E.nombre, P.id_proyecto 
    INTO v_nombremepleado, v_proyectoEmpleado
    FROM Mascota M
    INNER JOIN Cliente C ON C.codigoMascotasfk = M.codigoMascotas
    WHERE M.codigoMascotas = p_idMascota;

    SET resultado = CONCAT('Mascota: ', v_nombreMascota, ', Raza: ', v_raza, ', Dueño: ', v_nombreCliente, ' ', v_apellidoCliente);
    RETURN resultado;
END $$
DELIMITER ;

/*• Procedimiento: IncrementarPorDesempeño()*/


/*• Trigger: registrar incrementos en HistorialAumentos.*/

/*Tabla para almacenar el aumento de los salarios*/
CREATE TABLE IF EXISTS empleadoAumento(
	id empleado INT,
    nombre VARCHAR(150),
    fechaCambiosalario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER trg_backup_salario
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO ClienteEliminados(cedula, nombre, apellido, direccion, telefono)
    VALUES(OLD.cedula, OLD.nombre, OLD.apellido, OLD.direccion, OLD.telefono);
END $$
DELIMITER ;

