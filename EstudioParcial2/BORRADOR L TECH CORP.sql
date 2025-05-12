/*CREACION Y USO BASE DE DATOS*/
create database TechCorp;
use TechCorp;

/*TABLAS TECHCORP Y RELACIONES DE LLAVES*/
create table Empleados(
idEmpleado int auto_increment PRIMARY KEY,
nombreEmpleado varchar(255) not null,
edadEmpleado int not null,
salarioEmpleado float not null,
fecha_ingresoEmpleado date not null, 
idCargoFK int,
idDepartamentoFK int,
FOREIGN KEY (idCargoFK) REFERENCES Cargo (idCargo) on delete cascade on update cascade, 
FOREIGN KEY (idDepartamentoFK) REFERENCES Departamentos (idDepartamento) on delete cascade on update cascade 
);

create table Departamentos(
idDepartamento int PRIMARY KEY not null, 
nombreDepartamento varchar(255) not null
);

create table Cargo_Empleados(
idCargo int PRIMARY KEY not null,
nombreCargo varchar(255)
);

/*INCERSIONES*/
describe Empleados;
select * from Empleados; 
insert into Empleados values(" ","Julio Cesar",62,1.800,02/05/2025,5656,5503),
(" ","Cameron Beltran",26,2.999,11/11/2012,4141,5503),(" ","Bernardo",32,4.400,24/02/2022,0202,2032),
(" ","Tomas Santodomingo",20,5.000,03/08/2020,1111,1011),(" ","Mattheo Rojas",28,5.234,20/03/2018,1111,1011); 


describe Departamentos; 
insert into Departamentos values(1011,"Recursos Humanos"),
(5503,"Ventas"),(2032,"IT"); 

describe Cargo_Empleados;
insert into Cargo_Empleados values(5656,"Secretario"),
(4141,"Lider"),(0202,"Administrador"),(1111,"Gerente"); 

/*CONSULTAS*/
