/*Cunsultas 24 09 2025 */
#
# EN ESTE CASO SE INICIA DESDE LA LINEA 162
#
 /*Bases de datos veterinaria*/
create database BDMascotas ;

/*Se establece que se va a trabajar sobre la base de datos*/
USE BDMascotas;


/*Crear tabla Vacuna*/
create table Vacuna (
    /*Crear los campos que seran atributos*/
    codigoVacuna INT PRIMARY KEY AUTO_INCREMENT,
    nombreVacuna VARCHAR(255) NOT NULL,
    dosis int NOT NULL,
    enfermedadTratada VARCHAR(255) NOT NULL
);

/*Crear tabla Mascota*/
CREATE TABLE Mascota (
    /*Crear los campos que seran atributos*/
    codigoMascotas INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    tipoMascota VARCHAR(50) NOT NULL,
    genero VARCHAR(25) NOT NULL
);


/*Crear tabla Debil VacunaMascota*/
create table VacunaMascota (
    /*Crear los campos que seran atributos*/
    PRIMARY KEY (codigoVacunaFK, codigoMascotasFK),
    codigoVacunaFK INT,
    codigoMascotasFK INT,
    FOREIGN KEY (codigoVacunaFK) REFERENCES Vacuna(codigoVacuna),
    FOREIGN KEY (codigoMascotasFK) REFERENCES Mascota(codigoMascotas)
);


/*Crear tabla Cliente*/
create table Cliente (
    /*Crear los campos que seran atributos*/
    cedula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    codigoMascotasfk INT,
    FOREIGN KEY (codigoMascotasfk) REFERENCES Mascota(codigoMascotas)
);

/*Tabala para los nuemros de telefonos*/
create table NumeroTel(
codigoTel int primary key auto_increment,
telefono varchar(50) not null,
cedulaclienteFk int,
FOREIGN KEY (cedulaclienteFk) REFERENCES cliente(cedula)
);


/*Crear tabla Venta*/
create table Venta (
    /*Crear los campos que seran atributos*/
    codigoVenta INT PRIMARY KEY AUTO_INCREMENT,
    fechaVenta DATETIME NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    cedulafk INT,
    FOREIGN KEY (cedulafk) REFERENCES Cliente(cedula)
);

/*Crear tabla Producto*/
create table Producto (
    /*Crear los campos que seran atributos*/
    CodigoProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    codigoVentafk int not null
);

/*Crear tabla debil VentaProducto*/
create table VentaProducto(
    /*Crear los campos que seran atributos*/
    PRIMARY KEY (codigoVentafk, codigoProductofk),
    codigoVentafk INT,
    codigoProductofk INT,
    FOREIGN KEY (codigoVentafk) REFERENCES Venta(codigoVenta),
    FOREIGN KEY (codigoProductofk) REFERENCES Producto(CodigoProducto)
);

/*Inserts and joins*/
#insert para las vacunas
describe vacuna;

insert into vacuna
values(NULL,"Antirrábica",1,"Rabia"),
(NULL,"Monovalente",1,"Parvovirosis canina"),
(NULL,"Monovalente",1,"Moquillo canino"),
(NULL,"Monovalente",1,"Leptospirosis canina"),
(NULL,"Monovalente",1,"Hepatitis infecciosa canina");

select * from vacuna;

#insert para las mascotas

describe mascota;

insert into mascota
values(NULL,"Max","Pitbull","Perro","Macho"),
(NULL,"Luna","Labrador Retriever","Perro","Hembra"),
(NULL,"Rocky","Pastor Alemán","Perro","Macho"),
(NULL,"Nala","Golden Retriever","Perro","Hembra"),
(NULL,"Zeus","Rottweiler","Perro","Macho"),
(NULL,"Canela","Beagle","Perro","Hembra");

select * from mascota;

#insert para clientes

describe cliente;
insert into cliente
values (NULL,"Juan","Pérez","Calle 123 #45-67","3001234567",1),
(NULL,"María","Gómez","Carrera 10 #20-30","3109876543",2),
(NULL,"Andrés","Ramírez","Av. Siempre Viva 742","3204567890",3),
(NULL,"Laura","Hernández","Calle 50 #15-22","3012345678",4),
(NULL,"Carlos","Rodríguez","Carrera 7 #40-15","3113456789",5);

#insert para telefonos
describe NumeroTel;

insert into NumeroTel
values (NULL,"3001234567",1),
(NULL,"3109876543",2),
(NULL,"3204567890",3),
(NULL,"3012345678",4),
(NULL,"3113456789",5);

#insert para las ventas
describe venta;

insert into venta
values	(NULL,"2025-01-15 10:30:00",250000.00,1),
(NULL,"2025-01-20 14:45:00",180000.00,2),
(NULL,"2025-02-05 09:15:00",320000.00,3),
(NULL,"2025-02-10 16:20:00",150000.00,4),
(NULL,"2025-02-18 11:05:00",275000.00,5);

#insert para las producto
describe producto;

insert into producto
values (NULL,"Concentrado Dog Chow 10kg",120000.00,"Purina",1),
(NULL,"Collar ajustable mediano",35000.00,"PetLovers",2),
(NULL,"Vacuna Antirrábica",50000.00,"Zoetis",3),
(NULL,"Cama acolchada grande",180000.00,"PetComfort",4),
(NULL,"Juguete mordedor resistente",25000.00,"Kong",5);

select * from producto;


/*Consultas basicas para SQL
select * from nombre tabla -> en este caso consulta toda la tabla
select codigoMascota from mascota -> en este caso  solo consulta el codigo de las mascotas
*/

/*
Consultas especificas
ordenar
agrupar
condicionar
parametros
calculadas
*/

/*Consultas especificas*/
select * from cliente;
select cedula as "cedula", nombre as "nombre estudiante" from cliente;

#consulta con alias para mascotas
# consulta con alias para mascotas

select * from mascota;
select codigoMascotas as "codigo", nombre as "nombre de la mascota" from mascota;

#Consultas con condicionales and or y not o se pueden hacer comparaciones con > >= < <= = != 
#tambien se trabaja el between, el like y el In

#Clausula where para bases de datos
#igual
#show databases permite consultar todas las bases de datos

select * from mascota where nombre = "max";
select * from mascota where nombre = "luna";

#consulta usando el mayor que
select * from venta;
select * from venta where valorTotal >=150000;

#consulta usando el menor que
select * from venta where valorTotal <=150000;

#consulta el between (seimpre debe estar acompaño de and (operador logico) only for numerico)
select * from venta where valorTotal between 150000 and 180000;

#patron like, funciona para buscar patrones de texto solo (varchar o char)
#comodines forma de buscar el patron

#PAREMETROS
/*El comidin porcentaje % representa 0, 1 o muchos caracters estos
mientras que el _ (guion bajo representa un solo caacter) 
que comience por ciertos caracteres va like xxxx%
que terminen por ciertos caracteres va like %xxxx
que contengan ciertos caracteres va like %xxxx%
un solo caractere uso el patron like xxxx_xxxx
*/
select * from vacuna;
#Para iniciar, en este caso la cadena incia con mono
select * from vacuna where nombreVacuna like "mono%";

#Para terminar, en este caso la cadena termina con canina
select * from vacuna where enfermedadTratada like "%canina";

#Para que contenga determinados caracteres en este caso contiene can
select * from vacuna where enfermedadTratada like "%can%";

#ejemplo con _ guion abajo hay que poner toda la cadena
select * from vacuna where nombreVacuna like "m_novalente";

#parametro In
#In valor in (valor1, valor2, ... , valorn)
#para numerico

select * from venta where valorTotal in (150000, 180000);

#para varcahr o char
describe mascota;
select * from mascota where tipoMascota in ("perro");

#Operadores And or & Not
select * from venta;
describe venta;
#select * from nombre tabla where valor=valor de comparacion "and or not" valor de comparacion
#and
select * from venta where valorTotal=150000 and cedulafk=4;
#or
select * from venta where valorTotal>=275000 or cedulafk=4;
#not
select * from venta where not valorTotal=150000;

#order se puede orderan de manera asecende o descente 
#sintaxis select campo1, campo2 from nombretabla order by campoordenar
#para varcahr o char
select * from cliente order by nombre asc;
select * from cliente order by nombre desc;

#para enteros y numericos
select * from venta order by valorTotal desc;
select * from venta order by valorTotal asc;

#agrupar (Normalmente se acompaña de funciones calculadas o de agregacion)
#cuales son las funciones de agregacion count, sum, avg, max
/*
count()
sum()
avg()
max()
min()
*/

# select * from columna funcionagregacion() form table group by campos