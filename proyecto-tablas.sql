============================================================================
--PRIMER SCRIPT: CREACION DE BASE DE DATOS, TABLAS Y RESTRICCIONES
============================================================================
create database Proyecto;
============================================================================
--CREACION DE TABLAS
============================================================================
create table hotel(
id_hotel serial primary key,
nombre varchar(50) not null,
direccion varchar(200) not null,
telefono varchar(20),
categoria varchar(20)
);

create table tipo_habitacion(
id_tipo serial primary key,
nombre varchar(50) not null,
descripcion varchar(200),
capacidad smallint not null,
tarifa_noche numeric(10,2) not null
);

create table huesped(
id_huesped serial primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
email varchar(50),
telefono varchar(20) not null,
documento varchar(15) not null
);

create table habitacion (
id_hotel int not null,
numero_habitacion varchar(10) not null,
piso smallint not null,
estado varchar(20) not null default 'disponible',
id_tipo int not null
);


create table empleado (
    id_empleado serial,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    cargo varchar(50) not null,
    telefono varchar(20),
    email varchar(50),
    id_hotel int not null
);

create table servicio (
    id_servicio serial,
    nombre varchar(50) not null,
    descripcion varchar(200),
    categoria varchar(50) not null,
    precio numeric(10,2) not null,
    id_hotel int not null
);

create table reservacion (
    id_reservacion serial,
    fecha_reservacion date not null default current_date,
    fecha_checkin date not null,
    fecha_checkout date not null,
    num_huespedes int not null,
    estado varchar(20) not null default 'pendiente',
    id_huesped int not null,
    id_hotel int not null,
    id_tipo int not null
);

drop table factura cascade
create table factura (
    id_factura serial,
    fecha date not null default current_date,
    subtotal_habitacion numeric(10,2) not null,
    subtotal_servicios numeric(10,2) not null,
    impuestos numeric(10,2) not null,
    total numeric(10,2) not null,
    metodo_pago varchar(20) not null,
    estado_pago varchar(20) not null,
    id_reservacion int not null
);

create table consumo_servicio (
    id_reservacion int not null,
    num_consumo int not null,
    fecha date not null default current_date,
    cantidad int not null,
    precio_unitario numeric(10,2) not null,
    subtotal numeric(10,2) not null,
    id_servicio int not null
);

create table detalle_factura (
    id_factura int not null,
    num_detalle int not null,
    descripcion varchar(200) not null,
    cantidad int not null,
    precio_unitario numeric(10,2) not null,
    descuento numeric(10,2) default 0.00,
    subtotal numeric(10,2) not null
);
create table check_in_out (
    id_reservacion int not null,
    monto_estadia numeric(10,2) not null,
    consumo_total numeric(10,2) not null default 0.00,
    fecha_checkin_real timestamp not null,
    fecha_checkout_real timestamp,
    id_empleado_checkin int not null,
    id_empleado_checkout int,
    numero_habitacion varchar(10) not null,
    id_hotel int not null
);

-- ============================================================================
-- RESTRICCIONES
-- ============================================================================

-- 1. Restricciones para la tabla: hotel
alter table hotel
add constraint ck_hotel_telefono
        check (telefono is null or telefono <> ''),
add constraint ck_hotel_categoria check (categoria in ('estandar', 'boutique', 'resort', 'lujo'));

-- 2. Restricciones para la tabla: tipo_habitacion
alter table tipo_habitacion
add constraint ck_tipo_nombre check (nombre <> ''),
add constraint ck_tipo_descripcion check (descripcion is null or descripcion <> ''),
add constraint ck_tipo_capacidad check (capacidad > 0),
add constraint ck_tipo_tarifa check (tarifa_noche > 0.00);

-- 3. Restricciones para la tabla: huesped
alter table huesped
add constraint unq_huesped_email unique (email),
add constraint unq_huesped_documento unique (documento),
add constraint ck_huesped_nombre check (nombre <> ''),
add constraint ck_huesped_apellido check (apellido <> ''),
add constraint ck_huesped_email_formato check (email is null or email like '%@%'),
add constraint ck_huesped_telefono check (telefono <> ''),
add constraint ck_huesped_documento check (documento <> '');
-- 4. Restricciones para la tabla: habitacion
alter table habitacion
add constraint pk_habitacion primary key (id_hotel, numero_habitacion),
add constraint fk_habitacion_hotel foreign key (id_hotel) references hotel(id_hotel) on delete restrict on update cascade,
add constraint fk_habitacion_tipo foreign key (id_tipo) references tipo_habitacion(id_tipo)on delete restrict on update cascade,
add constraint ck_habitacion_numero check (numero_habitacion <> ''),
add constraint ck_habitacion_piso check (piso >= 1),
add constraint ck_habitacion_estado check (estado in ('disponible', 'ocupada', 'mantenimiento', 'limpieza'));

-- 5. Restricciones para la tabla: empleado
alter table empleado
add constraint pk_empleado primary key (id_empleado),
add constraint fk_empleado_hotel foreign key (id_hotel) references hotel(id_hotel) on delete restrict on update cascade,
add constraint unq_empleado_email unique (email),
add constraint ck_empleado_nombre check (nombre <> ''),
add constraint ck_empleado_apellido check (apellido <> ''),
add constraint ck_empleado_cargo check (cargo <> ''),
add constraint ck_empleado_telefono check (telefono is null or telefono <> ''),
add constraint ck_empleado_email_formato check (email is null or email like '%@%');
-- 6. Restricciones para la tabla: servicio
alter table servicio
add constraint pk_servicio primary key (id_servicio),
add constraint fk_servicio_hotel foreign key (id_hotel) references hotel(id_hotel) on delete restrict on update cascade,
add constraint ck_servicio_nombre check (nombre <> ''),
add constraint ck_servicio_descripcion check (descripcion is null or descripcion <> ''),
add constraint ck_servicio_categoria check (categoria <> ''),
add constraint ck_servicio_precio check (precio >= 0.00);

-- 7. Restricciones para la tabla: reservacion
alter table reservacion
add constraint pk_reservacion primary key (id_reservacion),
add constraint fk_reservacion_huesped foreign key (id_huesped) references huesped(id_huesped) on delete restrict on update cascade,
add constraint fk_reservacion_hotel foreign key (id_hotel) references hotel(id_hotel) on delete restrict on update cascade,
add constraint fk_reservacion_tipo foreign key (id_tipo) references tipo_habitacion(id_tipo) on delete restrict on update cascade,
add constraint ck_reservacion_fechas check (fecha_checkout > fecha_checkin),
add constraint ck_reservacion_huespedes check (num_huespedes > 0),
add constraint ck_reservacion_estado check (estado in ('pendiente', 'confirmada', 'cancelada', 'completada'));

-- 8. Restricciones para la tabla: factura
alter table factura
add constraint pk_factura primary key (id_factura),
add constraint fk_factura_reservacion foreign key (id_reservacion) references reservacion(id_reservacion) on delete restrict on update cascade,
add constraint unq_factura_reservacion unique (id_reservacion),
add constraint ck_factura_subtotal_habitacion check (subtotal_habitacion >= 0.00),
add constraint ck_factura_subtotal_servicios check (subtotal_servicios >= 0.00),
add constraint ck_factura_impuestos check (impuestos >= 0.00),
add constraint ck_factura_total check (total = subtotal_habitacion + subtotal_servicios + impuestos),
add constraint ck_factura_metodo_pago check (metodo_pago in ('efectivo', 'tarjeta', 'transferencia')),
add constraint ck_factura_estado_pago check (estado_pago in ('pendiente', 'pagada', 'anulada'));
-- 9. Restricciones para la tabla: consumo_servicio
alter table consumo_servicio
add constraint pk_consumo_servicio primary key (id_reservacion, num_consumo),
add constraint fk_consumo_check foreign key (id_reservacion) references check_in_out(id_reservacion) on delete cascade on update cascade,
add constraint fk_consumo_servicio foreign key (id_servicio) references servicio(id_servicio) on delete restrict on update cascade,
add constraint ck_consumo_cantidad check (cantidad > 0),
add constraint ck_consumo_precio_unitario check (precio_unitario >= 0.00),
add constraint ck_consumo_subtotal check (subtotal = cantidad * precio_unitario);

-- 10. Restricciones para la tabla: detalle_factura
alter table detalle_factura
add constraint pk_detalle_factura primary key (id_factura, num_detalle),
add constraint fk_detalle_factura foreign key (id_factura) references factura(id_factura) on delete cascade on update cascade,
add constraint ck_detalle_descripcion check (descripcion <> ''),
add constraint ck_detalle_cantidad check (cantidad > 0),
add constraint ck_detalle_precio_unitario check (precio_unitario >= 0.00),
add constraint ck_detalle_descuento check (descuento is null or descuento >= 0.00),
add constraint ck_detalle_subtotal check (subtotal = (cantidad * precio_unitario) - coalesce(descuento, 0.00));
-- 11. Restricciones para la tabla: check_in_out
alter table check_in_out
add constraint pk_check_in_out primary key (id_reservacion),
add constraint fk_check_reservacion foreign key (id_reservacion) references reservacion(id_reservacion) on delete restrict on update cascade,
add constraint fk_check_empleado_checkin foreign key (id_empleado_checkin) references empleado(id_empleado) on delete restrict on update cascade,
add constraint fk_check_empleado_checkout foreign key (id_empleado_checkout) references empleado(id_empleado) on delete restrict on update cascade,
add constraint fk_check_habitacion foreign key (id_hotel, numero_habitacion) references habitacion(id_hotel, numero_habitacion) on delete restrict on update cascade,
add constraint ck_check_monto_estadia check (monto_estadia >= 0.00),
add constraint ck_check_consumo_total check (consumo_total >= 0.00),
add constraint ck_check_fechas check (fecha_checkout_real is null or fecha_checkout_real > fecha_checkin_real);













