create dataBase Colegio;
use Colegio;
create table Estudiantes(
idEstudiante int NOT NULL primary key,
nombreEstudiante varchar(255) NOT NULL,
apellidoEstudiante varchar(255) NOT NULL,
edadEstudiante int,
idCursoFK int,
idMateriaFK int,
idCalificacion int,
FOREIGN KEY (idCursoFK) REFERENCES Curso (idCurso) on delete cascade on update cascade, 
FOREIGN KEY (idMateriaFK) REFERENCES Materias (idMateria) on delete cascade on update cascade, 
FOREIGN KEY (idCalificacion) REFERENCES Calificaciones (idCalificacion) on delete cascade on update cascade
);

create table Curso(
idCurso int NOT NULL primary key,
nombreCurso varchar(255) NOT NULL
);

create table Materias(
idMateria int NOT NULL primary key,
nombreMateria varchar(255) NOT NULL,
creditos int NOT NULL
);

create table Calificaciones(
idCalificacion int NOT NULL primary key,
tipoCalificacion varchar(255) NOT NULL
);

/*INSERCIONES*/
insert into Curso
values(12,"magia");

/*CONSULTAS BASICAS
SINTAXIS:
-- SELECT nombreCampo from  nombreTabla; -- 
*/

SELECT * from Curso; -- todos los atributos dentro de Curso--
SELECT nombreCurso from Curso where idCurso = 12; 