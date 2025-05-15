/*DDL es el lenguaje de definicion de los datos, es decir, lo que permite la creacion de bases de datos, tablas, index, etc...

-> TABLAS 
   -> CREACION 
   create table nombre_tabla(
   columna1 tipo_dato
   columna2 tipo_dato
   );
estos tipos de datos contienen ciertas restricciones o CONSTRAINTS como NOT NULL o UNIQUE

DML es el lenguaje de manipulacion de los datos, es decir, lo que permite realizar incersiones, 
cambios, eliminacion, actualizaciones, uniones , etc... de los datos previamente delimitados en el DML
 
 -> MODIFICACION DE TABLAS 

-> AÑADIR COLUMNA  
	    ALTER_TABLE nombre_tabla 
        ADD nombre_columna tipo_dato;

-> BORRAR TABLA 
		DROP TALUM nombre_Tabla;
        
-> INSERT INTO: agrega datos a una tabla existente 
        insert into mi_Tabla 
        values(valor1,valor2...);
        
-> UPDATE: actualizar datos en una tabla existente 
        UPDATE mi_tabla 
        SET columna1 = valor1, columna2 = valor2,...
        WHERE condicion; 
*/

create database Universidad;
use Universidad; 

create table Estudiante(
	id_estudiante int auto_increment PRIMARY KEY,
    nombre_estudiante varchar(100) not null,
    correo_estudiante varchar(100) UNIQUE not null,
    fecha_registro date not null,
    id_cursoFK int, 
    id_matriculaFK int, 
    FOREIGN KEY (id_cursoFK) REFERENCES Cursos (id_curso) on delete cascade on update cascade,
    FOREIGN KEY (id_matriculaFK) REFERENCES Matriculas (id_matricula) on delete cascade on update cascade
);

create table Cursos(
    id_curso int auto_increment PRIMARY KEY,
    nombre_curso varchar(100)
);

create table Matriculas(
    id_matricula int auto_increment PRIMARY KEY,
    id_cursoFK int,
    FOREIGN KEY (id_cursoFK) REFERENCES Cursos (id_curso) on delete cascade on update cascade
);

/*INSERCIONES*/

describe Estudiante;
select * from Estudiante; 
insert into Estudiante values(" ","Julio Cesar","jc@gmail.com","2017-03-02","3","2"),
(" ","Mattheo Balencia","mv12@gmail.com","2022-08-01","2","1"),
(" ","Bernardo Ruiz","ruizbb@gmail.com","2025-05-05","1","3");

describe Cursos;
select * from Cursos; 
insert into Cursos values(" ","INGENIERIA DE DATOS"),
(" ","LENGUAS EXTRANGERAS"),(" ","BIOLOGIA");

describe Matriculas;
select * from Matriculas; 
insert into Matriculas values("1","3"),("2","1"),("3","2");

/*CONSULTA*/
select nombre_estudiante,nombre_curso from Estudiante;

/*SUBCONSULTA*/
select nombre_estudiante,nombre_curso from Estudiante where nombre_curso = (select nombre_curso as "Contiene la palabra DATOS" from Cursos where nombre_curso like "%DATOS%"); 

/*PROCEDIMIENTOS*/
DELIMITER //

CREATE PROCEDURE listar_estudiantes(IN fecha_registro date)
BEGIN
    SELECT id_estudiante, nombre_estudiante, correo_estudiante
    FROM Estudiante
    WHERE fecha_registro = Lista_registros;
END //

DELIMITER ;

DELIMITER //
call listar_estudiantes();

CREATE PROCEDURE Obtener_estudiante_por_cursoID(IN id_curso int)
BEGIN
    SELECT id_estudiante, nombre_estudiante
    FROM Estudiante
    WHERE id_curso = nombre_estudiante;
END //

DELIMITER ;
call Obtener_estudiante_por_cursoID (1);

/*TRIGGER*/


/*VENTAJAS DE LOS TRIGGERS Y PROCEDIMIENTOS RN UN SISTEMA DE GESTION DE DATOS 
Los procedimientos al ser una especie de "consulta automatica" facilitan y agilisan el proceso de la busqueda, 
incersion, modificacion, etc... dentro de una base de datos. Por otro lado los triggers 
*/