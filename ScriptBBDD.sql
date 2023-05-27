-- Programación
CREATE DATABASE IF NOT EXISTS app_biblioteca;
USE app_biblioteca;

CREATE TABLE alumno(
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(30) NOT null,
	apellido VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL);
	
CREATE TABLE empleado(
	id_empleado INT(3) PRIMARY KEY AUTO_INCREMENT,
	dni VARCHAR(9) NOT NULL UNIQUE,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL);

CREATE TABLE libro(
	id_libro INT(3) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	categoria VARCHAR(15) NOT NULL,
	numPaginas INT(5) NOT NULL,
	prestado BOOLEAN NOT NULL DEFAULT FALSE);
	
CREATE TABLE prestar(
	id_prestar INT(3) PRIMARY KEY AUTO_INCREMENT,
	id_empleado INT(3),
	id_libro INT(3),
	dni VARCHAR(9),
	fechaPrestado DATETIME DEFAULT NOW(),
	CONSTRAINT prestEmpleado FOREIGN KEY(id_empleado)
	REFERENCES empleado(id_empleado)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT prestLibro FOREIGN KEY(id_libro)
	REFERENCES libro(id_libro)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT prestAlumno FOREIGN KEY(dni)
	REFERENCES alumno(dni)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
	
CREATE TABLE devolver(
	id_prestar INT(3) PRIMARY KEY AUTO_INCREMENT,
	id_empleado INT(3),
	id_libro INT(3),
	dni VARCHAR(9),
	fechaDevuelto DATETIME DEFAULT NOW(),
	CONSTRAINT devolEmpleado FOREIGN KEY(id_empleado)
	REFERENCES empleado(id_empleado)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT devolLibro FOREIGN KEY(id_libro)
	REFERENCES libro(id_libro)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT devoltAlumno FOREIGN KEY(dni)
	REFERENCES alumno(dni)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
	