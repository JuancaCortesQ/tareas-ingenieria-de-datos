 /*Bases de datos BDTechCorp*/
create database BDTechCorp ;
/*Se establece que se va a trabajar sobre la base de datos*/
USE BDTechCorp;

#tabla de empleados
CREATE TABLE tablaempleados (
    /*Crear los campos que seran atributos*/
    codigoempleado INT PRIMARY KEY AUTO_INCREMENT,
    nombreEmpleado VARCHAR(150) NOT NULL,
    edadEmpleado int(50) not null,
    DepartamentoEmpleado VARCHAR(150) NOT NULL,
    salarioEmpleado int(50) NOT NULL,
    FechaContratacion DATETIME NOT NULL
);

#insert de los datos
insert into tablaempleados
values (NULL,"Andres Gonzales", 35 ,"Departamento de ventas", 4000,"2025-02-18 11:05:00"),
(NULL, "Carlos Mendoza", 32, "Departamento de ventas", 4500, "2023-08-12 09:30:00"),
(NULL, "Camila Torres", 28, "Departamento de TI", 5200, "2021-11-05 14:20:00"),
(NULL, "Cristian Ramírez", 37, "Departamento de ventas", 3900, "2025-01-17 08:45:00"),
(NULL, "Claudia Gómez", 30, "Departamento de TI", 5800, "2020-06-29 10:15:00"),
(NULL, "César Villalba", 25, "Departamento de TI", 3100, "2018-03-11 13:50:00"),
(NULL, "Cintia Herrera", 40, "Departamento de TI", 6000, "2019-09-03 16:10:00");	

select * from tablaempleados;
# 1) Obtén los nombres, edades y salarios de todos los empleados de TechCorp
select nombreEmpleado,edadEmpleado, salarioEmpleado from tablaempleados;

#2) ¿Quiénes son los empleados que ganan más de $4,000?
select * from tablaempleados where salarioEmpleado >= 4000;

#3) : Extrae la lista de empleados que trabajan en el departamento de Ventas.
select * from tablaempleados where DepartamentoEmpleado IN ("Departamento de ventas");

#4)  Encuentra a los empleados que tienen entre 30 y 40 años
select * from tablaempleados where edadEmpleado >= 30 and edadEmpleado <= 40 ;

#5) ¿Quiénes han sido contratados después del año 2020?
select * from tablaempleados where FechaContratacion >= "2020-01-01 00:00:00" ;

#6) ¿Cuántos empleados hay en cada departamento?
select * from tablaempleados group by DepartamentoEmpleado;

#7) ¿Cuál es el salario promedio en la empresa?
select avg(salarioEmpleado) as "salario promedio" from tablaempleados;

#8) Muestra los empleados cuyos nombres comienzan con "A" o "C"
select * from tablaempleados where nombreEmpleado like "c%";
select * from tablaempleados where nombreEmpleado like "%a";

#9) : Encuentra a los empleados que no pertenecen al departamento de IT.


