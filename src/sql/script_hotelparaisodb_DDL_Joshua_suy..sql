-- Joshua Suy - 2026083 - IN4CM
create database if not exists hotelparaisodb_in4cm;
use hotelparaisodb_in4cm;
-- tabla empleado 
create table empleado (
    id_empleado int primary key,
    nombre varchar(50),
    cargo varchar(30)
);
 
-- tabla hotel 
create table hotel (
    ocupaciones varchar(50) primary key,
    tipo_de_habitacion varchar(20),
    servicios varchar(100)
);
 
-- tabla cliente 
create table cliente (
    cui bigint primary key,
    nacionalidad varchar(30) not null,
    telefono varchar(15)
);
 
-- tabla habitaciones 
create table habitaciones (
    numero_de_habitacion int primary key,
    piso varchar(10),
    precio_por_noche decimal(10,2),
    tipo_habitacion varchar(20),
    -- llaves foraneas
    ocupaciones varchar(50),
    id_empleado int,
    constraint fk_ocupaciones foreign key (ocupaciones) references hotel (ocupaciones) on delete cascade, 
    constraint fk_hab_empleado foreign key (id_empleado) references empleado (id_empleado) on delete cascade
);
 
-- tabla reserva
create table reserva (
    fecha_inicio      timestamp primary key,
    estado_habitacion varchar(20),
    -- llaves foraneas
    cui_cliente          bigint,
    id_empleado          int,
    numero_de_habitacion int,                        -- nombre consistente
    constraint fk_cui_cliente foreign key (cui_cliente)
        references cliente (cui),
    constraint fk_res_empleado foreign key (id_empleado)
        references empleado (id_empleado),
    constraint fk_numero_de_habitacion foreign key (numero_de_habitacion)
        references habitaciones (numero_de_habitacion) -- nombre de columna
);

-- 1. Vista para Clientes
create view vw_clientes as 
select cui, nacionalidad, telefono 
from cliente;

-- 2. Vista para Habitaciones
create view vw_habitaciones as 
select numero_de_habitacion, piso, precio_por_noche, tipo_habitacion 
from habitaciones;

-- 3. Vista para Empleados
create view vw_empleados as 
select id_empleado, nombre, cargo 
from empleado;

-- 4. Vista para Reservas
create view vw_reservas as 
select fecha_inicio, estado_habitacion, cui_cliente, id_empleado, numero_de_habitacion 
from reserva;

-- 5. Vista Global / Detalle (Igual a la de tu amigo)
create view vw_detalle_reservas as
select 
    r.fecha_inicio as 'Fecha Inicio',
    c.cui as 'CUI Cliente',
    c.nacionalidad as 'Nacionalidad Cliente',
    e.nombre as 'Empleado que Atendió',
    e.cargo as 'Cargo Empleado',
    h.numero_de_habitacion as 'Habitación',
    h.precio_por_noche as 'Precio Noche'
from reserva r
inner join cliente c on r.cui_cliente = c.cui
inner join empleado e on r.id_empleado = e.id_empleado
inner join habitaciones h on r.numero_de_habitacion = h.numero_de_habitacion;

delimiter //
create procedure sp_agregar_empleado(
    in _id_empleado int,
    in _nombre varchar(100),
    in _cargo varchar(100)
)
begin
    if not exists (select * from empleado where id_empleado = _id_empleado) then
        insert into empleado (id_empleado, nombre, cargo) values (_id_empleado, _nombre, _cargo);
    end if;
end //
delimiter ;

delimiter //
create procedure sp_listar_empleado()
begin
    select * from empleado;
end //
delimiter ;

delimiter //
create procedure sp_buscar_empleado(in _id int)
begin
    select * from empleado where id_empleado = _id;
end // 
delimiter ;

delimiter //
create procedure sp_actualizar_empleado(
    in _id_empleado int,
    in _nombre varchar(100),
    in _cargo varchar(100)
)
begin 
    if exists (select * from empleado where id_empleado = _id_empleado) then
        update empleado
        set nombre = _nombre,
            cargo = _cargo
        where id_empleado = _id_empleado;
    end if;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_empleado (in _id int)
begin
    if exists (select * from empleado where id_empleado = _id) then
        delete from empleado where id_empleado = _id;
    end if;
end //
delimiter ;



delimiter //
create procedure sp_agregar_hotel(
    in _ocupaciones varchar(50),
    in _tipo_de_habitacion varchar(20),
    in _servicios varchar(100)
)
begin
    if not exists (select * from hotel where ocupaciones = _ocupaciones) then
        insert into hotel (ocupaciones, tipo_de_habitacion, servicios) values (_ocupaciones, _tipo_de_habitacion, _servicios);
    end if;
end //
delimiter ;

delimiter //
create procedure sp_listar_hotel()
begin
    select h.ocupaciones, h.tipo_de_habitacion, h.servicios from hotel h;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_hotel(
    in _ocupaciones varchar(50),
    in _tipo_de_habitacion varchar(20),
    in _servicios varchar(100)
)
begin
    if exists (select * from hotel where ocupaciones = _ocupaciones) then
        update hotel
        set tipo_de_habitacion = _tipo_de_habitacion,
            servicios = _servicios
        where ocupaciones = _ocupaciones;
    end if;
end //
delimiter ;

delimiter // 
create procedure sp_eliminar_hotel(in _ocupaciones varchar(50))
begin
    if exists (select * from hotel where ocupaciones = _ocupaciones) then
        delete from hotel where ocupaciones = _ocupaciones;
    end if;
end //
delimiter ;
    
delimiter //
create procedure sp_agregar_cliente(
    in _cui bigint,
    in _nacionalidad varchar(30),
    in _telefono varchar(15)
)
begin 
    if not exists (select * from cliente where cui = _cui) then
        insert into cliente (cui, nacionalidad, telefono) values (_cui, _nacionalidad, _telefono);
    end if;
end //
delimiter ;

delimiter //
create procedure sp_listar_cliente()
begin 
    select c.cui, c.nacionalidad, c.telefono from cliente c;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_cliente(
    in _cui bigint,
    in _nacionalidad varchar(30),
    in _telefono varchar(15)
)
begin
    if exists (select * from cliente where cui = _cui) then
        update cliente
        set nacionalidad = _nacionalidad,
            telefono = _telefono 
        where cui = _cui;
    end if;
end //
delimiter ;
    
delimiter //
create procedure sp_buscar_cliente(in _cui bigint)
begin 
    select c.cui, c.nacionalidad, c.telefono
    from cliente c
    where c.cui = _cui;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_cliente(in _cui bigint)
begin
    if exists (select * from cliente where cui = _cui) then
        delete from cliente where cui = _cui;
    end if;
end //
delimiter ;

delimiter //
 create procedure sp_agregar_habitaciones(
    in _numero_de_habitacion int,
    in _piso varchar(10),
    in _precio_por_noche decimal(10,2),
    in _tipo_habitacion varchar(20),
    in _ocupaciones varchar(50),
    in _id_empleado int
)
begin
    if exists (select * from hotel where ocupaciones = _ocupaciones) 
    and exists (select * from empleado where id_empleado = _id_empleado)
    and not exists (select * from habitaciones where numero_de_habitacion = _numero_de_habitacion) then
        insert into habitaciones (numero_de_habitacion, piso, precio_por_noche, tipo_habitacion, ocupaciones, id_empleado) values
        (_numero_de_habitacion, _piso, _precio_por_noche, _tipo_habitacion, _ocupaciones, _id_empleado);
    end if;
end //
delimiter ;

delimiter //
create procedure sp_listar_habitaciones()
begin
    select h.numero_de_habitacion, h.piso, h.precio_por_noche, h.tipo_habitacion, h.ocupaciones, h.id_empleado
    from habitaciones h;
end //
delimiter ;

-- drop procedure if exists sp_actualizar_habitaciones;
-- drop procedure if exists sp_agregar_habitaciones;

-- drop procedure if exists sp_actualizar_habitaciones;
delimiter //
create procedure sp_actualizar_habitaciones(
    in _numero_de_habitacion int,
    in _piso varchar(10),
    in _precio_por_noche decimal(10,2),
    in _tipo_habitacion varchar(20),
    in _ocupaciones varchar(50),
    in _id_empleado int
)
begin 
    update habitaciones
    set 
        piso = _piso,
        precio_por_noche = _precio_por_noche,
        tipo_habitacion = _tipo_habitacion,
        ocupaciones = _ocupaciones,
        id_empleado = _id_empleado
    where numero_de_habitacion = _numero_de_habitacion;
end //
delimiter ;

delimiter //
create procedure sp_buscar_habitaciones(in _numero_de_habitacion int)
begin
    select h.numero_de_habitacion, h.precio_por_noche, h.tipo_habitacion, h.ocupaciones, h.id_empleado
    from habitaciones h
    where h.numero_de_habitacion = _numero_de_habitacion;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_habitacion(in _numero_de_habitacion int)
begin
    if exists (select * from habitaciones where numero_de_habitacion = _numero_de_habitacion) then
        delete from habitaciones where numero_de_habitacion = _numero_de_habitacion;
    end if;
end // 
delimiter ;

delimiter //
create procedure sp_agregar_reserva(
    in _fecha_inicio timestamp,
    in _estado_habitacion varchar(20),
    in _cui_cliente bigint,
    in _id_empleado int,
    in _numero_de_habitacion int
)
begin 
    if exists (select * from cliente where cui = _cui_cliente)
    and exists (select * from empleado where id_empleado = _id_empleado)
    and exists (select * from habitaciones where numero_de_habitacion = _numero_de_habitacion)
    and not exists (select * from reserva where fecha_inicio = _fecha_inicio) then
        insert into reserva (fecha_inicio, estado_habitacion, cui_cliente, id_empleado, numero_de_habitacion) values
        (_fecha_inicio, _estado_habitacion, _cui_cliente, _id_empleado, _numero_de_habitacion); 
    end if;
end //
delimiter ;

delimiter //
create procedure sp_listar_reserva()
begin
    select r.fecha_inicio, r.estado_habitacion, r.cui_cliente, r.id_empleado, r.numero_de_habitacion
    from reserva r;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_reserva(
    in _fecha_inicio timestamp,
    in _estado_habitacion varchar(20),
    in _cui_cliente bigint,
    in _id_empleado int,
    in _numero_de_habitacion int
)
begin 
    if exists (select * from reserva where fecha_inicio = _fecha_inicio)
    and exists (select * from cliente where cui = _cui_cliente)
    and exists (select * from empleado where id_empleado = _id_empleado)
    and exists (select * from habitaciones where numero_de_habitacion = _numero_de_habitacion) then
        update reserva
        set estado_habitacion = _estado_habitacion,
            cui_cliente = _cui_cliente,
            id_empleado = _id_empleado,
            numero_de_habitacion = _numero_de_habitacion
        where fecha_inicio = _fecha_inicio;
    end if;
end //
delimiter ;

delimiter //
create procedure sp_buscar_reserva(in _fecha_inicio timestamp)
begin 
    select r.fecha_inicio, r.estado_habitacion, r.cui_cliente, r.id_empleado, r.numero_de_habitacion
    from reserva r 
    where r.fecha_inicio = _fecha_inicio; 
end //
delimiter ;

delimiter //
create procedure sp_eliminar_reserva(in _fecha_inicio timestamp)
begin
    if exists (select * from reserva where fecha_inicio = _fecha_inicio) then
        delete from reserva where fecha_inicio = _fecha_inicio;
    end if;
end //
delimiter ;

-- vistas
drop view if exists vw_clientes;
create view vw_clientes as 
select cui, nacionalidad, telefono from cliente;

drop view if exists vw_habitaciones;
create view vw_habitaciones as 
select numero_de_habitacion, piso, precio_por_noche, tipo_habitacion from habitaciones;

drop view if exists vw_empleados;
create view vw_empleados as 
select id_empleado, nombre, cargo from empleado;

drop view if exists vw_reservas;
create view vw_reservas as 
select fecha_inicio, estado_habitacion, cui_cliente, id_empleado, numero_de_habitacion from reserva;

-- vista detallada general
drop view if exists vw_reporte_general;
create view vw_reporte_general as
select 
    r.fecha_inicio as fecha_reserva,
    c.cui as documento_cliente,
    c.nacionalidad,
    e.nombre as empleado_atiende,
    h.numero_de_habitacion,
    h.precio_por_noche
from reserva r
inner join cliente c on r.cui_cliente = c.cui
inner join empleado e on r.id_empleado = e.id_empleado
inner join habitaciones h on r.numero_de_habitacion = h.numero_de_habitacion;

call sp_agregar_empleado(1, 'carlos perez', 'gerente');
call sp_agregar_empleado(2, 'ana lopez', 'recepcionista');
call sp_agregar_empleado(3, 'luis martinez', 'recepcionista');
call sp_agregar_empleado(4, 'maria gonzalez', 'limpieza');
call sp_agregar_empleado(5, 'jose ramirez', 'mantenimiento');

call sp_agregar_hotel('hab001', 'individual', 'wifi, baño privado, tv');
call sp_agregar_hotel('hab002', 'doble', 'wifi, baño privado, tv, balcón');
call sp_agregar_hotel('hab003', 'suite', 'wifi, jacuzzi, sala, vista al mar');
call sp_agregar_hotel('hab005', 'triple', 'wifi, baño privado, 3 camas');

call sp_agregar_cliente(1234567890101, 'guatemalteca', '55510001');
call sp_agregar_cliente(1234567890102, 'salvadoreña', '55510002');
call sp_agregar_cliente(1234567890103, 'hondureña', '55510003');
call sp_agregar_cliente(1234567890104, 'mexicana', '55510004');
call sp_agregar_cliente(1234567890105, 'colombiana', '55510005');

call sp_actualizar_habitaciones(202, '2', 360.00, 'doble', 'hab002', 2);
call sp_actualizar_habitaciones(203, '2', 520.00, 'suite', 'hab003', 1);
call sp_actualizar_habitaciones(301, '2', 270.00, 'triple', 'hab005', 3);
call sp_actualizar_habitaciones(302, '3', 320.00, 'individual', 'hab001', 4);
call sp_actualizar_habitaciones(303, '2', 300.00, 'doble', 'hab002', 2);

call sp_agregar_reserva('2026-05-18 08:00:00', 'ocupada', 1234567890101, 2, 101);
call sp_agregar_reserva('2026-05-18 09:30:00', 'ocupada', 1234567890102, 3, 102);
call sp_agregar_reserva('2026-05-18 11:15:00', 'disponible', 1234567890103, 1, 201);
call sp_agregar_reserva('2026-05-18 14:00:00', 'ocupada', 1234567890104, 3, 202);
call sp_agregar_reserva('2026-05-18 16:45:00', 'mantenimiento', 1234567890105, 2, 301);

call sp_listar_empleado();
call sp_listar_hotel();
call sp_listar_cliente();