/*CREACION Y USO BASE DE DATOS*/
create database TechCorp;
use TechCorp;

create table Departamentos(
idDepartamento int PRIMARY KEY not null, 
nombreDepartamento varchar(255) not null
);

create table Cargo_Empleados(
idCargo int PRIMARY KEY not null,
nombreCargo varchar(255)
);

/*TABLAS TECHCORP Y RELACIONES DE LLAVES*/
create table Empleados(
idEmpleado int auto_increment PRIMARY KEY,
nombreEmpleado varchar(255) not null,
edadEmpleado int not null,
salarioEmpleado float not null,
fecha_ingresoEmpleado date not null, 
idCargoFK int,
idDepartamentoFK int,

FOREIGN KEY (idCargoFK) REFERENCES Cargo_Empleados (idCargo) on delete cascade on update cascade, 
FOREIGN KEY (idDepartamentoFK) REFERENCES Departamentos (idDepartamento) on delete cascade on update cascade 
);

describe Departamentos; 
insert into Departamentos values(1011,"Recursos Humanos"),
(5503,"Ventas"),(2032,"IT"); 

describe Cargo_Empleados;
insert into Cargo_Empleados values(5656,"Secretario"),
(4141,"Lider"),(0202,"Administrador"),(1111,"Gerente"); 

/*INCERSIONES*/
describe Empleados;
select * from Empleados; 
insert into Empleados values(" ","Julio Cesar",62,1.800,"02-05-2025",5656,5503),
(" ","Cameron Beltran",26,2.999,"11-11-2012",4141,5503),(" ","Bernardo",32,4.400,"24-02-2022",0202,2032),
(" ","Tomas Santodomingo",20,5.000,"03-08-2020",1111,1011),(" ","Mattheo Rojas",28,5.234,"20-03-2018",1111,1011); 


/*TALLER*/
/* 1.   Lista de empleados: Obtén los nombres, edades y salarios de todos los empleados de TechCorp.*/
select nombreEmpleado,edadEmpleado,salarioEmpleado from Empleados;

/*2. Altos ingresos: ¿Quiénes son los empleados que ganan más de $4,000?*/
select nombreEmpleado,idEmpleado,salarioEmpleado from Empleados where salarioEmpleado > "4.000";

/*3. Fuerza de ventas: Extrae la lista de empleados que trabajan en el departamento de Ventas.*/
select nombreEmpleado,idEmpleado,idDepartamentoFK from Empleados where idDepartamentoFK = "5503";
select * from Empleados;

/* 4. Rango de edad: Encuentra a los empleados que tienen entre 30 y 40 años. */
select nombreEmpleado,idEmpleado,edadEmpleado from Empleados where edadEmpleado >= "30" and edadEmpleado <= "40";

/* 5. Nuevas contrataciones: ¿Quiénes han sido contratados después del año 2020? */
select nombreEmpleado,idEmpleado,fecha_ingresoEmpleado from Empleados where fecha_ingresoEmpleado >= "2020-01-01";

/* 6. Distribución de empleados: ¿Cuántos empleados hay en cada departamento? */
select count(idDepartamentoFK) from  Empleados where idDepartamentoFK = 2032;
select count(idDepartamentoFK) from  Empleados where idDepartamentoFK = 5503;
select count(idDepartamentoFK) from  Empleados where idDepartamentoFK = 1011;

/* 7. Análisis salarial: ¿Cuál es el salario promedio en la empresa? */
select AVG(salarioEmpleado) as "Salario promedio" from Empleados;

/* 8. Nombres selectivos: Muestra los empleados cuyos nombres comienzan con "A" o "C"*/
select nombreEmpleado from Empleados where nombreEmpleado like "c%";
/* LIKEEE
-> El LIKE operador se utiliza en una WHERE cláusula para BUSCAR UN PATRON ESPECIFICO  en una columna (caracteres).
/*a% EMPIEZA POR ESTA LETRA*/  
/*%a TERMINA POR ESTA LETRA*/
/* %a% TIENE ESTA LETRA*/

/* 9. Departamentos específicos: Encuentra a los empleados que no pertenecen al departamento de IT. */
select nombreEmpleado,idEmpleado,idDepartamentoFK from Empleados where idDepartamentoFK <> "2032";

/* 10. El mejor pagado: ¿Quién es el empleado con el salario más alto?*/
select nombreEmpleado,min(salarioEmpleado) from Empleados where salarioEmpleado = (select min(salarioEmpleado) from Empleados);
select * from Empleados;



/*
Sintaxis:  
select  campoTabla1 from   Tabla1 
inner join  Tabla2  on tabla1.campoTabla1 = tabla2.campoTabla2;

*/

/*EJERCICIOS 
1. Averiguar el cargo de cada empleado*/
select nombreEmpleado, nombreCargo from Empleados e
join Cargo_Empleados c on e.idCargoFK = c.idCargo; 

/*2. Averiguar el departamento de cada empleado*/
select nombreEmpleado,nombreDepartamento from Empleados 
join Departamentos on Empleados.idDepartamentoFK = Departamentos.idDepartamento;

/*
alter table  Tabla1 set (tablanueva) (tipovalor) (-- nulo o no nulo)
*/
select * from Empleados;

alter table Empleados ADD COLUMN correoEmpleados varchar(255) not null;


UPDATE Empleados SET correoEmpleados = "perrito2@gmail.com" where idEmpleado = 1;



/*
Sintaxis ALTER TABLE
alter table  Tabla1 set (tablanueva) (tipovalor) (-- nulo o no nulo)
*/



/*
Sintaxis UPDATE
UPDATE tabla1  set campoParaHacerUPDATE  =  valor  where   condicion
*/








