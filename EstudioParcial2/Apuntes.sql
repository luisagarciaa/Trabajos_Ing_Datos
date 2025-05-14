/*APUNTES*/
/* BASICOS FILAS: HORIZONTAL, COLUMNAS: VERTICAL
-> DDL data definition language, define bases de datos, indices. 
   COMANDOS: create table, create index, create view
-> DML data manipulation language. manipulacion: seleccionar, eliminar, insertar, actualizar datos. 
   COMANDOS: select, insert, update, delete from
   
-> TIPOS DE DATOS
   -> NUMERICOS: int, numeric(n,m)
      DECIMAL(n,m): igual a numeric 
      FLOAT: numero de coma flotante, ponerlo con un punto ej: 980.77
   -> ALFANUMERICOS 
      char: 255 caracteres TAMAÑO FIJO
      varchar: datos en cadena SU TAMAÑO ES VARIABLE 
   -> FECHA 
      date: fecha
      datetime: fecha plus hora
   -> LOGICOS
      bit, boolean 
*/
--------------------------------------------------------------------------------------------
/* DDL 
-> TABLAS 
   -> CREACION 
   create table nombre_tabla(
   columna1 tipo_dato
   columna2 tipo_dato
   );
   
   -> CONSTRAINTS: restricciones, limitan el tipo de dato en columna de tabla 

RESTRICCIONES: NOT NULL: indica que un valor no puede estar vacio dentro de una columna perteneciente a una tabla*/
   create table Personas(
   nombre varchar(255) NOT NULL, /*SIEMPRE PONER COMAS Y PUNTOS CON COMAS*/
   apellido varchar(255) NOT NULL
   ); 
/*RESTRICCIONES: UNIQUE: identifica de manera unica CADA FILA de una tabla
-> se puede añadir con ALTER_TABLE: 
                  ALTER_TABLE Personas 
                  ADD UNIQUE(ID)
-> se pueden crear restricciones para varias columnas al tiempo */
   create table Personas(
   ID int NOT NULL, 
   nombre varchar(255) NOT NULL, 
   apellido varchar(255) NOT NULL,
   UNIQUE (ID) /*la columna ID tiene un valor diferente para cada fila*/
   );
   
/*
-> PRIMARY KEY: identifica de manera UNICA cada fila de una tabla
      cualquier columna definida como clave must be: UNIQUE, NOT NULL 

-> FOREIGN KEY: 1 o varias columnas señala cual es la clave primaria de otra tabla
      son valores que ya existen en la CLAVE PRIMARIA de la otra tabla 
*/
	create table Pedidos(
    ordenID int NOT NULL,
    numeroOrden int NOT NULL,
    IDPersona int NOT NULL,
    PRIMARY KEY (ordenID),
    FOREIGN KEY(IDpersona) REFERENCES Persona (IDPersona)
    );
    
/*
-> CHECK: limita el rango de valores que puede tener una columna
   se pueden definir varias restricciones CHECK en una tabla. 

-> DEFAULT: proporciona un valor predeterminado a una columna 
no valor especificado al insertar una tabla = DEFAULT en cada COLUMNA 

       -> MODIFICACION DE TABLAS 

-> AÑADIR COLUMNA  
	    ALTER_TABLE nombre_tabla 
        ADD nombre_columna tipo_dato;
   
-> BORRAR COLUMNA
        ALTER_TABLE nombre_tabla
        DROP COLUM nombre_columna;

-> MODIFICAR EL TIPO DE DATO DE UNA COLUMNA 
		ALTER_TABLE nombre_tabla
        ALTER_COLUM nombre_columna tipoDato;

-> BORRAR TABLA 
		DROP TALUM nombre_Tabla;
        
-> INSERT INTO: agrega datos a una tabla existente 
        insert into mi_Tabla 
        values(valor1,valor2...);
        
-> UPDATE: actualizar datos en una tabla existente 
        UPDATE mi_tabla 
        SET columna1 = valor1, columna2 = valor2,...
        WHERE condicion; 
        
siempre usar WHERE, si no se usa, se actualizan todos los datos en la tabla 

        UPDATE Peliculas 
        SET director = "john lasster"
        WHERE id = 2;
        
-> DELETE 
        DELETE FROM Peliculas 
        WHERE año_pelicula < 2000;
        
-> min()
        SELECT MIN(columna)
        FROM mi_tabla 
        WHERE condicion;
        
-> max()
        SELECT MAX(columna)
        FROM mi_tabla 
        WHERE condicion;
        
-> COUNT: devuelve el numero de filas de la consulta (los NULL se ignoran)
        SELECT COUNT (columna)
        FROM mi_tabla;
        
        SELECT COUNT (*) FROM mi_tabla; contara el numero de filas en la tabla
        
-> AVG(): devuelve el valor PROMEDIO de una columna especifica numericaa


-> SUM(): devuelve la suma total de una columna numerica 

/ALIAS/
dan un nombre temporal a una tabla o columna 
     -> TABLA 
               SELECT columna(s)
               FROM mi_tabla AS nombre_alias; 
     -> COLUMNA 
			   SELECT columna AS nombre_alias (s)
               FROM mi_tabla; 
	Se utilizan cuando: hay mas de 1 tabla en la CONSULTA, funciones utilizadas en una consulta,
    2 o mas columnas se combinan juntas.
               
/JOIN/ - INNER JOIN 
se utiliza para combinar filas de 2 o mas tablas segun una columna relacionada entre ellas. 
coincide filas de la primera tabla con las de la segunda tabla que TIENEN LA MISMA CLAVE para crear un
RESULTADO CON LAS COLUMNAS COMBINADAS de ambas tablas. (interseccion entre tablas)
  -> Ejemplo: tenemos una tabla *PELICULAS* y una tabla -CALIFICACION- y queremos ordenar las pelis
  por su respectiva calificacion.
                            
				 SELECT *titulo_pelicula*, -raiting-
                 FROM *PELICULAS* 
                    JOIN -CALIFICACION- 
                    ON *PELICULAS.id* = -CALIFICACION.PELICULAS_id-
                 ORDER BY -raiting- DESC;
                 
/OUTER JOINs/
-> *LEFT JOIN*
devuelve todos los registros de la tabla izquierda y los registros 
coincidentes de la tabla derecha. (INTERSECCION ENTRE TABLAS + DATOS TABLA IZQUIERDA)

                 SELECT columna, otra_columna
                 FROM tabla1 
                 LEFT JOIN tabla2   (aqui puede ser LEFT/RIGHT/FULL JOIN)
                    ON tabla1.id = otra_columna.blabla_id
				 WHERE condicion 
                 ORDER BY columna, ... ASC/DESC
                 .
                 .
                 .
                 
-> *RIGHT JOIN*
devuelve todos los registros de la tabla derecha y los registros 
coincidentes de la tabla izquierda. (INTERSECCION ENTRE TABLAS + DATOS TABLA DERECHA)

-> *FULL JOIN*
devuelve todos los registros, tanto de la tabla izquierda como los de 
la tabla derecha aunque no cumplan condiciones (LIT TODOOO)

                 SELECT columna, otra_columna
                 FROM tabla1 
                 FULL JOIN tabla2 
                    ON tabla1.id = otra_columna.blabla_id
				 WHERE condicion (S)
                 ORDER BY columna, ... ASC/DESC
                 LIMIT...
VISTAS
¿Cómo crear una vista para simplificar la consulta de empleados con sus departamentos?
CREATE VIEW Vista_Empleados AS
SELECT e.nombreEmpleado, d.nombreDep AS departamento, e.salarioEmpleado
FROM empleado e
JOIN departamento d ON e.idDepFK = d.idDep;

SELECT * FROM Vista_Empleados;

TRIGGERS Y PROCEDIMIENTOS 
#Obtener la información de un usuario dado su idUsuario PROCEDIMIENTOS SON COMO CONSULTAS AUTOMATICAS 
DELIMITER //

CREATE PROCEDURE ObtenerUsuarioPorID(IN id_usuario INT)
BEGIN
    SELECT idUsuario, nombreUsuario, apellidoUsuario, emailUsuario
    FROM Usuario
    WHERE idUsuario = id_usuario;
END //

DELIMITER ;

call ObtenerUsuarioPorID (1)

/5. Realice una consulta que muestre la cantidad de votos obtenidos por cada candidato en las votaciones registradas/
select pc.idpostCandidato as id_candidato, u.nombreUsuario as nombre, count(v.idVotacion) as Votos_Total , u.idUsuario as id_usuario from postulacioncandidato pc
inner join votacion v on pc.idpostCandidato = v.idpostCandidatoFK
inner join usuario u on pc.idUsuarioFK = u.idUsuario
group by pc.idpostCandidato,u.nombreUsuario;
