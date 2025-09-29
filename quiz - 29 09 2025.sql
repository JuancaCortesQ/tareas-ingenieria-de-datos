 /*Bases de datos BDTechCorp*/
 /*Clase del 29 09 2025*/
 
 #drop database BDTechCorp ;
 
create database BDTechCorp ;
/*Se establece que se va a trabajar sobre la base de datos*/
USE BDTechCorp;

CREATE TABLE tabladepartamento (
    /*Crear los campos que seran atributos*/
    codigodepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nombreDepartamento VARCHAR(150) NOT NULL,
    telefonoDepartamento VARCHAR(150) NOT NULL
);

#tabla de empleados
CREATE TABLE tablaempleados (
    /*Crear los campos que seran atributos*/
    codigoempleado INT PRIMARY KEY AUTO_INCREMENT,
    nombreEmpleado VARCHAR(150) NOT NULL,
    edadEmpleado int(50) not null,
    DepartamentoEmpleado VARCHAR(150) NOT NULL,
    salarioEmpleado int(50) NOT NULL,
    FechaContratacion DATETIME NOT NULL,
    codigodepartamentofk int(50),
    foreign key (codigodepartamentofk) references tabladepartamento(codigodepartamento)
);

#insert de los datos
insert into tablaempleados
values (NULL,"Andres Gonzales", 35 ,"Departamento de ventas", 4000,"2025-02-18 11:05:00",1),
(NULL, "Carlos Mendoza", 32, "Departamento de ventas", 4500, "2023-08-12 09:30:00",1),
(NULL, "Camila Torres", 28, "Departamento de TI", 5200, "2021-11-05 14:20:00",2),
(NULL, "Cristian Ramírez", 37, "Departamento de ventas", 3900, "2025-01-17 08:45:00",1),
(NULL, "Claudia Gómez", 30, "Departamento de TI", 5800, "2020-06-29 10:15:00",2),
(NULL, "César Villalba", 25, "Departamento de TI", 3100, "2018-03-11 13:50:00",2),
(NULL, "Cintia Herrera", 40, "Departamento de TI", 6000, "2019-09-03 16:10:00",2);	

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
select * from tablaempleados where DepartamentoEmpleado <> "Departamento de TI";

# 10 ¿Quién es el empleado con el salario más alto?
select max(salarioEmpleado) as "salario Maximo" from tablaempleados;


insert into tabladepartamento
values (NULL,"Departamento de ventas", "555 4321"),
(NULL,"Departamento de TI", "555 4322"),
(NULL, "Departamento de Finanzas", "555 4323"),
(NULL, "Departamento de RRHH", "555 4324"),
(NULL, "Departamento de Seguridad", "555 4326");

#SUBCONSULTAS
#Se ejcuta las subconsultas y luego lo demas
#Existen escalares -> devuelven un solo valor
#de fila->registro completo
#De tabla->devuelven varios registros (varias filas)

describe tablaempleados;

#Conusltas multitablas
# 10 ¿Quién es el empleado con el salario más alto?

select nombreEmpleado, salarioEmpleado
from tablaempleados
where salarioEmpleado=(select max(salarioEmpleado) as "salario Maximo" from tablaempleados);

describe tabladepartamento;

#Empleados que pertenecen al departamento de ventas
select nombreEmpleado, nombreDepartamento
from tablaempleados
where DepartamentoEmpleado=(select tablaempleados where DepartamentoEmpleado = "Departamento de ventas");

/* Consultas multitabla
inner join->Cosas que coincidadn las dos tablbas
left join-> Me devuelve todas las filas de la izquierda que no tenga la derecha
right join->Me devuelve todas las filas de la derecha que no tenga la izquierda
full join join union join
*/

describe tabladepartamento;
describe tablaempleados;

#tabla principal es la derecha, mi tabla izquierda es la secundaria

#inner join
select te.nombreEmpleado as "empleado", td.nombreDepartamento as "Departamento"
from tablaempleados te
inner join tabladepartamento td on  te.codigodepartamentofk=td.codigodepartamento;

#1 Conusltar los empleados cuyo salario sea mayor al promedio de la empresa
#2 Encuentre el nombre del empleado con el segundo salario mas alto -> subconsulta
#3 Utilando left join muestre los departamentos que no tienen empleados asignados
#4 Mestre el total de empleado por cada departamento

/*Solucion*/
#1 Conusltar los empleados cuyo salario sea mayor al promedio de la empresa
select * from tablaempleados where salarioEmpleado >= (select avg(salarioEmpleado) from tablaempleados);

#2 Encuentre el nombre del empleado con el segundo salario mas alto -> subconsulta
select nombreEmpleado, nombreDepartamento
from tablaempleados
where DepartamentoEmpleado=(select tablaempleados where DepartamentoEmpleado = "Departamento de ventas");

#3 Utilando left join muestre los departamentos que no tienen empleados asignados
select te.nombreEmpleado as "empleado", td.nombreDepartamento as "Departamento"
from tablaempleados te
left join tabladepartamento td on  te.codigodepartamentofk=td.codigodepartamento;


