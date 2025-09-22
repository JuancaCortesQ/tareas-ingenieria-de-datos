create database ejemplo1a1;
use ejemplo1a1;
create table clientes(
idCliente int auto_increment primary key,
nombreCliente varchar(100) not null,
emailCliente varchar(100) unique
);

create table perfiles(
idPerfil int auto_increment primary key,
idClienteFK int unique, /*clave foereana*/
direccion varchar(100),
fechaRegistro date,
foreign key (idClienteFk) references Clientes(idCliente)
);


/*Compartir la llave priamria */
/*La linea punteada en el modelo es que sea no obligatoria*/ 

create table clientes1(
idCliente int auto_increment primary key,
nombreCliente varchar(100) not null,
emailCliente varchar(100) unique
);

create table perfiles1(
idCliente int primary key, /*clave foereana*/
direccion varchar(100),
fechaRegistro date,
foreign key (idCliente) references Clientes1(idCliente)
);


# INSERT CON NUEVA BASE DE DATOS
create database universidad;
use universidad;
create table Estudiantes(
idEstudiantes int auto_increment primary key,
nomEstudiantes varchar(100),
carrera varchar(100),
semestre int
);


#forma larga para insert para regsitrar datos
/*Uso insert into(nombreTabla) (Campos) values (valor 1) (valor 2) (valor 3)*/

#forma corta para insert para regsitrar datos
/*Uso insert into(nombreTabla) values values (valor 1) (valor 2) (valor 3)*/

#forma larga

describe estudiantes;
insert into Estudiantes (idEstudiantes,nomEstudiantes, carrera, semestre) 
values("", "Tatiana Cabrera","Ing Electrica",8); 
#Para las fechas se pone guiones

#forma corta, inseratr varios

insert into estudiantes
values ("","Paula Vargas","Veterinaria",6),
("","Carlso perez","Economia",2),
("","Santiago orduz","Finanzas",4),
("","Valentina arevalo","Adminsitracion de empresas",8);

/*Sintaxis del select select *from nombretabala */

select * from estudiantes;

create table cursos(
idCurso int auto_increment primary key,
nombreCurso varchar(100),
creditos int
);

create table inscripciones(
idInscripciones int auto_increment primary key,
idEstudianteFk int,
idCursoFK int,
fechaInscripcion date,
foreign key (idEstudianteFk) references Estudiantes(idEstudiantes),
foreign key (idCursoFk) references Cursos(idCurso)
);

describe cursos;
describe inscripciones;

insert into cursos
values ("","Ingenieria de datos",3),
("","Alforitmso",3),
("","Electiva",2);

select * from cursos;


describe inscripciones;
select * from estudiantes;
select * from cursos;
#insertar para las llaves foraneas
insert into inscripciones
values("",2,2,"2025-08-28"),
("",4,1,"2025-08-28")

