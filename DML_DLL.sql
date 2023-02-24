

-- NOTA: cambiar 'ngitauwh' por vuestro usuario

CREATE SCHEMA practica AUTHORIZATION ngitauwh; 



/* --------------Grupo de vehiculos-------------- */
 

create table practica.grupovehiculos(
    id_grupo SERIAL not null, /* tipo autonumerico*/
    nombre_grupo varchar(100) not null,
    descripcion varchar(200) null
);

alter table practica.grupovehiculos
add constraint grupovehiculos_PK primary key (id_grupo);


insert into practica.grupovehiculos (nombre_grupo,descripcion) values('Volkswagen','Audi,Porsche,SEAT,Skoda');
insert into practica.grupovehiculos (nombre_grupo,descripcion) values('Daimler','MercedesBenz,Smart,Maybach');


/* ---------------Marcas de vehiculos ------------ */

create table practica.marcavehiculos(
    id_marca SERIAL not null, /* tipo autonumerico*/
    nombre_marca varchar(100) not null,
    id_grupo int not null, /*is FK*/
    descripcion varchar(200) null
);

alter table practica.marcavehiculos
add constraint marcavehiculos_PK primary key (id_marca);

alter table  practica.marcavehiculos
add constraint marcavehiculos_FK foreign key (id_grupo) references practica.grupovehiculos(id_grupo);



insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Audi',1);
insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Porsche',1);
insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('SEAT',1);
insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Skoda',1);

insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Mercedes-Benz',2);
insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Smart',2);
insert into practica.marcavehiculos(nombre_marca, id_grupo) values ('Maybach',2);




/* -------------Modelos de vehiculos------ */


create table practica.modelovehiculos(
    id_modelo SERIAL not null, /* tipo autonumerico*/
    nombre_modelo varchar(100) not null,
    id_marca int not null, /*is FK*/
    descripcion varchar(200) null
);

alter table practica.modelovehiculos
add constraint modelovehiculos_PK primary key (id_modelo);

alter table  practica.modelovehiculos
add constraint modelovehiculos_FK foreign key (id_marca) references practica.marcavehiculos(id_marca);


insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Q7',1);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('TTS',1);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Panamera',2);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('911',2);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Ibiza',3);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Yeti',4);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Rapid',4);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('CLS',5);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('EQC',5);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Fortwo',6);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('Forfour',6);
insert into practica.modelovehiculos  (nombre_modelo, id_marca) values ('S',7);


/* -----------Colores de vehiculos------------ */

create table practica.colorvehiculos(
    id_color SERIAL not null, /* tipo autonumerico*/
    nombre_color varchar(100) not null
);

alter table practica.colorvehiculos
add constraint colorvehiculos_PK primary key (id_color);

insert into practica.colorvehiculos (nombre_color) values ('Gris');
insert into practica.colorvehiculos (nombre_color) values ('Blanco');
insert into practica.colorvehiculos (nombre_color) values ('Negro');
insert into practica.colorvehiculos (nombre_color) values ('Rojo');

/* ---------------Aseguradora------------ */

create table practica.aseguradoras(
    id_aseguradora SERIAL not null, /* tipo autonumerico*/
    nombre_aseguradora varchar(100) not null
);

alter table practica.aseguradoras
add constraint aseguradoras_PK primary key (id_aseguradora);

insert into practica.aseguradoras (nombre_aseguradora) values ('Allianz');
insert into practica.aseguradoras (nombre_aseguradora) values ('Mapfre');
insert into practica.aseguradoras (nombre_aseguradora) values ('Generali');

/* ---------------Monedas------------- */

create table practica.moneda(
    id_moneda varchar(10) not null, 
    nombre_moneda varchar(100) not null
);

alter table practica.moneda
add constraint moneda_PK primary key (id_moneda);

insert into practica.moneda (id_moneda, nombre_moneda) values ('USD', 'Dolar');
insert into practica.moneda (id_moneda, nombre_moneda) values ('EUR', 'Euro');

/* -----vehiculos de la Empresa keepcoding -- */

create table practica.kc_vehiculos(
    id_vehiculo SERIAL not null, /* PK, autonumeric*/
	matricula varchar(20) not null,
	fecha_compra date not null,
	total_kilometros int null default 0,
    id_modelo int not null, --FK . modelo coche
    id_color int not null, --FK - colores
    id_aseguradora int not null, -- FK- aseguradoras
    num_poliza_seguro varchar(100) not null
);

--PK
alter table practica.kc_vehiculos
add constraint kc_vehiculos_PK primary key (id_vehiculo);

--FK modelo
alter table  practica.kc_vehiculos
add constraint kc_vehiculos_model_FK foreign key (id_modelo) references practica.modelovehiculos(id_modelo);

--FK colores
alter table  practica.kc_vehiculos
add constraint kc_vehiculos_color_FK foreign key (id_color) references practica.colorvehiculos(id_color);

--FK aseguradora
alter table  practica.kc_vehiculos
add constraint kc_vehiculos_aseguradora_FK foreign key (id_aseguradora) references practica.aseguradoras(id_aseguradora);


insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('1234 BCD','2022-01-01',3086,2,1,2,'006200000002731');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('0243 LMZ','2022-04-01',55550,5,2,1,'008200000004897');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('0744 FKZ','2022-03-01',45550,3,3,3,'008205555504898');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('1111 BCD','2022-11-01',8522,6,4,2,'007777770002731');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('0202 LMZ','2022-06-01',6633,7,2,1,'00326547804897');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('4444 FKZ','2022-07-01',2259,8,4,3,'00111111104898');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('1234 BCD','2022-12-01',9999,9,1,2,'0068745555531');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('0243 LMZ','2022-10-01',45987,10,2,1,'008365222004897');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('0744 FKZ','2022-06-01',12358,11,3,3,'008744455898');
insert into practica.kc_vehiculos (matricula,fecha_compra,total_kilometros,id_modelo,id_color,id_aseguradora,num_poliza_seguro) values ('4588 ZZZ','2022-07-01',14478,12,4,3,'009999999998');
/* ----------Revisiones de un vehiculo---- */


create table practica.revisiones_vehiculos(
    id_vehiculo int not null, --PK multiple
    fecha_revision date not null, -- PK multiple
    importe decimal not null,
    id_moneda varchar(20) not null,
    total_kilometros int not null
);

--PK
alter table practica.revisiones_vehiculos
add constraint revisiones_vehiculos_PK primary key (id_vehiculo, fecha_revision); --PK multiple

--FK vehiculo de Keepcoding
alter table  practica.revisiones_vehiculos
add constraint revisiones_vehiculos_FK foreign key (id_vehiculo) references practica.kc_vehiculos(id_vehiculo);


insert into practica.revisiones_vehiculos values (1, '2022-01-02', 333.5, 'EUR', 1000);
insert into practica.revisiones_vehiculos values (2, '2022-04-02', 236.5, 'EUR', 2000);
insert into practica.revisiones_vehiculos values (3, '2022-03-02', 410.5, 'EUR', 2500);
insert into practica.revisiones_vehiculos values (4, '2022-11-02', 745.5, 'EUR', 1000);
insert into practica.revisiones_vehiculos values (5, '2022-06-02', 785.5, 'EUR', 2000);
insert into practica.revisiones_vehiculos values (6, '2022-07-02', 455.5, 'EUR', 2500);
insert into practica.revisiones_vehiculos values (7, '2022-12-02', 369.5, 'USD', 1000);
insert into practica.revisiones_vehiculos values (8, '2022-10-02', 458.5, 'USD', 2000);
insert into practica.revisiones_vehiculos values (9, '2022-06-02', 122.5, 'USD', 2500);
insert into practica.revisiones_vehiculos values (10, '2022-07-02', 444.5, 'USD', 1000);

