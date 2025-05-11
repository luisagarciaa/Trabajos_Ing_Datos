create database TiendaMascotas;
DROP database tiendaMascotas; 
/*CREACION BASE DE DATOS Y UTILIZACION*/
create database Tienda_Mascotas; 
use Tienda_Mascotas; 
/*TABLAS*/
create table Mascotas(
idMascota int PRIMARY KEY,
nombreMascota varchar(255),
generoMascota varchar(255),
razaMascota varchar(255),
cantidad int 
);

create table Cliente(
cedulaCliente int PRIMARY KEY,
nombreCliente varchar(255),
apellidoCliente varchar(255),
direccionCliente varchar(255),
telefono float,
idMascotaFK int /*UN CLIENTE TIENE UNA MASCOTA, POR ENDE MASCOTA SERA UNA LLAVE FORANEA DE LA CLASE CLIENTE*/
);

create table Producto(
codigoProducto int PRIMARY KEY,
nombreProducto varchar(255),
marcaProducto varchar(255),
precioProducto int,
cedulaClienteFK int
);

create table Vacuna(
codigoVacuna int PRIMARY KEY,
nombreVacuna varchar(255),
dosisVacuna int,
enfermedad varchar(255)
);

create table Mascota_Vacuna(
codigoVacunaFK int,
idMascotaFK int,
enfermedad varchar(255)
);

/*RELACIONES ENTRE TABLAS*/
alter table Cliente add constraint FKClienteMasota foreign key (idMascotaFK) references Mascotas (idMascota);
alter table Producto add constraint FKProductoCliente foreign key (cedulaClienteFK) references Cliente (cedulaCliente);
alter table Mascota_Vacuna add constraint FKVM foreign key (codigoVacunaFK) references Vacuna (codigoVacuna);
alter table Mascota_Vacuna add constraint FKM_V foreign key (idMascotaFK) references Mascotas(idMascota);

/*INSERCIONES -> CONSULTAS - REGISTROS EN UNA TABLA*/
describe Mascotas; 
insert into Mascotas (idMascota,nombreMascota,generoMascota,razaMascota,cantidad) 
values (1,"Polly","Hembra","Yorkie",1);

insert into Mascotas values (2,"Tikki","Hembra","Yorkie",1);
/*CONSULTA GENERAL: Recuperacion de datos*/
select * from Mascotas; 

insert into Mascotas values (5,"Murcielago","F","Pomeranea",3),
(3,"Samantha","F","Pastor Aleman",1);

insert into Mascotas values (6,"Juls","F","Pomeranea",11),
(4,"Lucas","M","Yorkie",2),(7,"Osabi","M","Doberman",4),
(10,"Junior","M","Yorkie",12),(8,"Luna","F","French Poddle",6),
(9,"Spot","M","Chihuahua",1);

describe Vacuna;
select * from Vacuna; 

insert into Vacuna values (1,"anti_rabia",2,"rabia");
insert into Vacuna values(2,"anti_gripa",14,"Gripa"),
(3,"parvovirus",90,"parvovirus"),(4,"lala",7,"lulu"),(5,"lala",3,"lulu"),
(6,"uu",1,"oo"),(7,"Desparacitante",500,"Diarrea"),(8,"anti_pulgas",200,"Pulgas"),
(9,"idk",1,"yidk"),(10,"aaa",1,"ppp");

describe Cliente;
insert into Cliente values (1000993609,"Juliana","Garcia","carrera 2 #2-22",2,11);
select * from Cliente; 
select * from Mascotas;
/*UPDATE SIEMPRE INCLUIR CLAUSULA WHEREEEEE*/
update Mascotas
set razaMascota = "Chihuahua" where idMascota = 5;