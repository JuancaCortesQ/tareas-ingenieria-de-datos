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


/*Crear tabla Debil VacunaMascota*/
create table VacunaMascota (
	/*Crear los campos que seran atributos*/
	PRIMARY KEY (codigoVacuna, codigoMascotas),
	codigoVacuna INT,
    codigoMascotas INT,
    FOREIGN KEY (codigoVacuna) REFERENCES Vacuna(codigoVacuna)
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


/*Crear tabla Cliente*/
create table Cliente (
	/*Crear los campos que seran atributos*/
	cedula INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    codigoMascotas INT,
    FOREIGN KEY (codigoMascotas) REFERENCES Mascota(codigoMascotas)
);


/*Crear tabla Venta*/
create table Venta (
	/*Crear los campos que seran atributos*/
	codigoVenta INT PRIMARY KEY AUTO_INCREMENT,
    fechaVenta DATETIME NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    cedula INT,
    FOREIGN KEY (cedula) REFERENCES Cliente(cedula)
);

/*Crear tabla debil VentaProducto*/
create table VentaProducto(
	/*Crear los campos que seran atributos*/
	PRIMARY KEY (codigoVenta, codigoProducto),
	codigoVenta INT,
    codigoProducto INT,
    FOREIGN KEY (codigoVenta) REFERENCES Venta(codigoVenta)
);


/*Crear tabla Producto*/
create table Producto (
	/*Crear los campos que seran atributos*/
	CodigoProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    marca VARCHAR(50) NOT NULL
);

