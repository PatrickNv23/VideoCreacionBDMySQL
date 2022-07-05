-- creamos la base de datos
create database empresabd;

-- usamos la base de datos
use empresabd;

-- creamos las tablas
-- TABLA DISTRITOS
create table distritos(
idDistrito int4 not null primary key,
codPostal varchar(45) not null,
nombre varchar(80) not null);

-- TABLA CATEGORÍAS
create table categorias(
idCategoria int4 not null primary key,
descripcion varchar(45) not null);

-- TABLA CLIENTES
create table clientes(
idCliente int4 not null primary key,
razonSocial varchar(45) not null,
direccion varchar(45) not null,
idCategoria int4 not null,
idDistrito int4 not null);

-- creamos la relación entre categorias y clientes
alter table clientes add constraint fk_categorias_clientes
foreign key(idCategoria)
references categorias(idCategoria) on delete no action on update no action;

-- creamos la relación entre distritos y clientes
alter table clientes add constraint fk_distritos_clientes
foreign key(idDistrito)
references distritos(idDistrito) on delete no action on update no action;

-- creamos la tabla facturas
create table facturas(
idFactura varchar(8) not null primary key,
monto double(11,2) not null,
fecha DATE not null,
pendientePago tinyint(1) not null,
idCliente int4 not null);

-- creamos la relación entre clientes y facturas
alter table facturas add constraint fk_clientes_facturas
foreign key(idCliente)
references clientes(idCliente) on delete no action on update no action;

-- LLENADO DE TABLAS

-- llenado de la tabla distritos
insert into distritos values
("1001","C01","Distrito1"),
("1002","C02","Distrito2"),
("1003","C03","Distrito3"),
("1004","C04","Distrito4");

-- llenado de la tabla categorias
insert into categorias values
("1001","Cliente Final"),
("1002","Distribuidor"),
("1003","Mayorista"),
("1004","Minorista");

-- llenado de la tabla clientes
insert into clientes values
("1001","Ejemplo1 S. A.","Av Destino 348. Of. 312","1002","1004"),
("1002","Ejemplo2 S. A.","Jr. Direccion 114","1002","1004"),
("1003","Ejemplo3 RS","Direccion3 22184","1003","1002"),
("1004","Ejemplo4 RS","Av Direccion4 2845. 7D","1004","1001");

-- llenado de la tabla facturas
insert into facturas values
("000-0001","99999999.00","2018-11-20","0","1001"),
("000-0002","88888.00","2018-11-20","1","1002"),
("000-0003","7777.00","2018-11-20","1","1003"),
("000-0004","3000.00","2018-11-20","0","1004");

select * from facturas;
select * from clientes;
select * from distritos;
select * from categorias;














