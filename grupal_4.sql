#1.-Inicializar
create database grupal_5_4_a;
use grupal_5_4_a;


#2.-Crear 2 tablas
CREATE TABLE usuarios_aplicacion (
id_usuario int primary key auto_increment not null,
nombre varchar(50),
apellido varchar(50),
contrasena varchar(50),
fecha_hora timestamp,
genero varchar(1),
telefono_contacto varchar(10)
);

CREATE TABLE ingreso_usuario (
id_ingreso int primary key auto_increment not null,
fecha_ingreso timestamp ,
id_usuario int references usuarios_aplicacion(id_usuario)
);
show tables;

#DELETE FROM usuarios_aplicacion;
#drop table usuarios_aplicacion ;
#drop table ingreso_usuario ;
#drop table contactos;
#3.- Modificación tabla desde UTC-3 a UTC-2
UPDATE usuarios_aplicacion SET fecha_hora = DATE_ADD(NOW(), INTERVAL -2 HOUR);
select * from usuarios_aplicacion;
show tables;
#4.- Creación 8 registros

INSERT INTO usuarios_aplicacion(nombre,apellido,contrasena,fecha_hora,genero,telefono_contacto)
VALUES
('Hans', 'Müller', '7dP1Gp9W', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'M', '4912345678'),
('Anna', 'Schmidt', '2F45Kj8R', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'F', '4912345678'),
('Markus', 'Wagner', '9cE6Lm7X', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'M', '4912345678'),
('Julia', 'Becker', '4dH7Jk5G', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'F', '4912345678'),
('Klaus', 'Hoffmann', '8aE9Lp2C', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'M', '4912345678'),
('Lena', 'Meyer', '1dA5Kl9P', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'F', '4912345678'),
('Stefan', 'Schmitz', '5bP3Hj6R', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'M', '4912345678'),
('Lisa', 'Müller', '3aB8Dm4H', DATE_ADD(NOW(), INTERVAL -3 HOUR), 'F', '4912345678');


CREATE USER 'usuario_1'@'localhost' IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON grupal_5_4.* TO 'usuario_1'@‘localhost’;

INSERT INTO ingreso_usuario(id_usuario, fecha_ingreso)
VALUES
(1,'2022-05-19'),
(2,'2022-05-20'),
(3,'2022-05-21'),
(4,'2022-05-22'),
(5,'2022-05-23'),
(6,'2022-05-24'),
(7,'2022-05-25'),
(8,'2022-05-27');

#5.- Justificación

#6.- Crear nueva tabla
CREATE TABLE contactos (
id_contactos int primary key auto_increment,
numero_telefono int,
correo varchar(255),
id_usuario int 
);

#7.- Modificación columna telefono_contacto, vinculando tabla usuarios_aplicacion con tabla contactos


ALTER TABLE usuarios_aplicacion 
DROP COLUMN telefono_contacto;

ALTER TABLE contactos  add constraint fk_restricion  
foreign key (id_usuario) references usuarios_aplicacion(id_usuario);

select * from contactos ;
