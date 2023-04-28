drop database if exists control_academico_in5bm;
create database control_academico_in5bm;
use control_academico_in5bm;

create table if not exists alumnos (
	carne varchar(16) not null,
    apellidos varchar(45),
	nombres varchar (45),
    email varchar (32),
	constraint pk_alumnos primary key (carne)
);

insert into alumnos (carne, apellidos, nombres, email)
values ("2021040","Saldaña","José","jsaldana-2021040@kinal.edu.gt");
insert into alumnos (carne, apellidos, nombres, email)
values ("2021346","Ramirez","Roberto","Roberto@kinal.edu.gt");
insert into alumnos (carne, apellidos, nombres, email)
values ("2020165","Martinez","Rosana","Rosana@kinal.edu.gt");
insert into alumnos (carne, apellidos, nombres, email)
values ("2021894","Castillo","Abraham","Abraham@kinal.edu.gt");
insert into alumnos (carne, apellidos, nombres, email)
values ("2019356","Perez","Emiliano","Emiliano@kinal.edu.gt");

update alumnos set nombres=("José Luis"), apellidos="Saldaña Arrazola" where carne="2021040";

create table if not exists horarios (
	id INT not null auto_increment,
    horario_final TIME not null,
    horario_inicio TIME not null,
	constraint pk_horarios primary key (id)
);

insert into horarios (horario_final, horario_inicio)
values ("12:05:00", "07:05:00");
insert into horarios (horario_final, horario_inicio)
values ("13:00:00", "010:35:00");
insert into horarios (horario_final, horario_inicio)
values ("11:25:00", "05:25:00");
insert into horarios (horario_final, horario_inicio)
values ("13:15:00", "07:42:00");
insert into horarios (horario_final, horario_inicio)
values ("16:30:00", "13:00:00");

update horarios set horario_final="12:00:00", horario_inicio="07:10:00" where id="1";	

create table if not exists salones (
	id int not null auto_increment,
    capacidad int ,
	descripcion varchar(255),
	nombre_salon varchar(45),
    constraint pk_salones primary key (id)
);

insert into salones ( capacidad, descripcion, nombre_salon)
values (35,"Laboratorio de computación de 5to informática seccion B","C-29");
insert into salones ( capacidad, descripcion, nombre_salon)
values (15,"Laboratorio de computación de 5to informática seccion A","F-15");
insert into salones ( capacidad, descripcion, nombre_salon)
values (40,"Laboratorio de computación de 5to informática seccion E","A-54");
insert into salones ( capacidad, descripcion, nombre_salon)
values (25,"Laboratorio de computación de 5to informática seccion C","M-31");
insert into salones ( capacidad, descripcion, nombre_salon)
values (30,"Laboratorio de computación de 5to informática seccion D","S-22");

update salones set capacidad=100 where id="5";

create table if not exists carreras_tecnicas (
	id VARCHAR(128) not null,
    nombre VARCHAR(45),
    constraint pk_carreras_tecnicas primary key (id)
);

insert into carreras_tecnicas (id, nombre)
values ("IN5BM","Quinto perito en iformática sección B");
insert into carreras_tecnicas (id, nombre)
values ("IN5CV","Quinto perito en iformática sección C");
insert into carreras_tecnicas (id, nombre)
values ("IN5CM","Quinto perito en iformática sección C");
insert into carreras_tecnicas (id, nombre)
values ("IN5BV","Quinto perito en iformática sección B");
insert into carreras_tecnicas (id, nombre)
values ("IN5AM","Quinto perito en iformática sección A");

update carreras_tecnicas set nombre="Quinto perito en informatica seccion R" where id="IN5AM";

create table if not exists instructores (
	id int not null auto_increment,
    apellidos VARCHAR(45),
    nombres VARCHAR(45),
    direccion VARCHAR(45),
    telefono VARCHAR(8),
    constraint pk_instructores primary key (id)
);

insert into instructores (apellidos, nombres, direccion, telefono)
values ("Hernandez","Andres","5ta avenida","64581245");
insert into instructores (apellidos, nombres, direccion, telefono)
values ("Vasquez","Juan","6ta avenida","34685946");
insert into instructores (apellidos, nombres, direccion, telefono)
values ("Rodriguez","Luis","4ta avenida","49567812");
insert into instructores (apellidos, nombres, direccion, telefono)
values ("Martinez","Vicente","8ta avenida","34695168");
insert into instructores (apellidos, nombres, direccion, telefono)
values ("Mazariegos","David","5ta avenida","64951234");

update instructores set apellidos="Mendoza" where id="3";

create table if not exists cursos (
	id int not null auto_increment,
    ciclo YEAR,
    cupo_maximo INT,
    cupo_minimo INT,
    descripcion VARCHAR(255),
    carrera_tecnica_id VARCHAR(128) not null,
    horario_id INT not null,
    instructor_id INT not null,
    salon_id INT not null,
	constraint pk_cursos primary key (id),
    constraint fk_cursos_carreras_tecnicas
		foreign key (carrera_tecnica_id) 
		references carreras_tecnicas(id)
		on delete cascade on update cascade,
    constraint fk_cursos_horarios 
		foreign key (horario_id) 
		references horarios(id)
        on delete cascade on update cascade,
    constraint fk_cursos_instructores
		foreign key (instructor_id) 
		references instructores(id)
        on delete cascade on update cascade,
    constraint fk_cursos_salones
		foreign key (salon_id) 
		references salones(id)
        on delete cascade on update cascade
);

insert into cursos (ciclo, cupo_maximo, cupo_minimo, descripcion,carrera_tecnica_id,horario_id,instructor_id,salon_id)
values ("2005",32,15,"Curso de taller","IN5BV","3","2","5");
insert into cursos (ciclo, cupo_maximo, cupo_minimo, descripcion,carrera_tecnica_id,horario_id,instructor_id,salon_id)
values ("2007",55,30,"Curso de ingles","IN5CM","5","1","4");
insert into cursos (ciclo, cupo_maximo, cupo_minimo, descripcion,carrera_tecnica_id,horario_id,instructor_id,salon_id)
values ("2015",64,32,"Curso de literatura","IN5CV","4","3","2");
insert into cursos (ciclo, cupo_maximo, cupo_minimo, descripcion,carrera_tecnica_id,horario_id,instructor_id,salon_id)
values ("2013",23,11,"Curso de calculo","IN5AM","2","4","3");
insert into cursos (ciclo, cupo_maximo, cupo_minimo, descripcion,carrera_tecnica_id,horario_id,instructor_id,salon_id)
values ("2020",44,22,"Curso de dibujo tecnico","IN5BM","1","5","1");

update cursos set descripcion="Curso de estadistica" where id="1";

create table if not exists asignaciones_alumnos (
	id VARCHAR(45),
    fecha_asignacion DATETIME,
    alumno_carne VARCHAR(16) not null,
    curso_id INT not null,
    constraint pk_asignaciones_alumnos primary key (id),
    constraint fk_asignaciones_alumnos_alumnos
		foreign key (alumno_carne) 
		references alumnos(carne)
        on delete cascade on update cascade,
    constraint fk_asignaciones_alumnos_cursos
		foreign key (curso_id) 
		references cursos(id)
        on delete cascade on update cascade
);

insert into asignaciones_alumnos (id, fecha_asignacion, alumno_carne, curso_id)
values ("1","1998-05-25","2020165",5);
insert into asignaciones_alumnos (id, fecha_asignacion, alumno_carne, curso_id)
values ("2","2005-11-15","2021894",2);
insert into asignaciones_alumnos (id, fecha_asignacion, alumno_carne, curso_id)
values ("3","2020-12-10","2021040",4);
insert into asignaciones_alumnos (id, fecha_asignacion, alumno_carne, curso_id)
values ("4","1995-04-04","2019356",3);
insert into asignaciones_alumnos (id, fecha_asignacion, alumno_carne, curso_id)
values ("5","2014-01-30","2021346",1);

update asignaciones_alumnos set fecha_asignacion="2022-08-21" where id="4";


delete from alumnos where carne="2021346";
delete from horarios where id="4";
delete from salones where id="3";
delete from carreras_tecnicas where id="IN5CV";
delete from instructores where id="4";
delete from cursos where id="2";
delete from asignaciones_alumnos where id="1";

select * from alumnos;
select horarios.horario_inicio, horarios.horario_final from horarios;
select salones.capacidad, salones.descripcion, salones.nombre_salon from salones;
select carreras_tecnicas.id, carreras_tecnicas.nombre from carreras_tecnicas;
select * from instructores;
select * from cursos;
select * from asignaciones_alumnos;

drop table if exists asignaciones_alumnos;
drop table if exists cursos;
drop table if exists instructores;
drop table if exists carreras_tecnicas;
drop table if exists salones;
drop table if exists horarios;
drop table if exists alumnos;