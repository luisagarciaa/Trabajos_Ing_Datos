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

/*TALLER*/
/* 1.   Lista de empleados: Obtén los nombres, edades y salarios de todos los empleados de TechCorp.*/
select nombreEmpleado,edadEmpleado,salarioEmpleado from Empleados;

/*2. Altos ingresos: ¿Quiénes son los empleados que ganan más de $4,000?*/
select nombreEmpleado,idEmpleado,salarioEmpleado from Empleados where salarioEmpleado > "4000.00";

/*3. Fuerza de ventas: Extrae la lista de empleados que trabajan en el departamento de Ventas.*/
select nombreEmpleado,idEmpleado,idCargoFK from Empleados where idCargoFK = 5503;

/* 4. Rango de edad: Encuentra a los empleados que tienen entre 30 y 40 años. */
select nombreEmpleado,idEmpleado,edadEmpleado from Empleados where edadEmpleado >= "30" and edadEmpleado <= "40";

/* 5. Nuevas contrataciones: ¿Quiénes han sido contratados después del año 2020? */
select nombreEmpleado,idEmpleado,fecha_ingresoEmpleado from Empleados where fecha_ingresoEmpleado >= "01/01/2020";

/* 6. Distribución de empleados: ¿Cuántos empleados hay en cada departamento? */
select nombreEmpleado,idEmpleado,id ;

/* 7. Análisis salarial: ¿Cuál es el salario promedio en la empresa? */
select AVG(salarioEmpleado) as "Salario promedio" from Empleados;

/* 8. Nombres selectivos: Muestra los empleados cuyos nombres comienzan con "A" o "C"*/
select 

/* 9. Departamentos específicos: Encuentra a los empleados que no pertenecen al departamento de IT. */


/* 10. El mejor pagado: ¿Quién es el empleado con el salario más alto?*/

