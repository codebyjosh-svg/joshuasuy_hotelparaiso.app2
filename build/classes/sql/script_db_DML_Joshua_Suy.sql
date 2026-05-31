-- Joshua Suy - 2026083 - IN4CM
-- drop procedure if exists sp_buscar_categoria;
DROP PROCEDURE IF EXISTS sp_agregar_empleado;
drop procedure if exists sp_listar_empleado;
drop procedure if exists sp_buscar_empleado;
drop procedure if exists sp_actualizar_empleado;
use hotelparaisodb_in4cm;

INSERT INTO empleado (id_empleado, nombre, cargo) VALUES
 (1, 'Carlos Pérez', 'Gerente'),
 (2, 'Ana López', 'Contadora'),
 (3, 'Luis Martínez', 'Desarrollador'),
 (4, 'María González', 'Diseñadora'),
 (5, 'José Ramírez', 'Analista'),
 (6, 'Sofía Hernández', 'Recursos Humanos'),
 (7, 'Diego Torres', 'Soporte Técnico'),
 (8, 'Lucía Morales', 'Marketing'),
 (9, 'Pedro Castillo', 'Vendedor'),
 (10, 'Elena Ruiz', 'Secretaria'),
 (11, 'Jorge Méndez', 'Supervisor'),
 (12, 'Valeria Castro', 'Asistente'),
 (13, 'Miguel Ortiz', 'Programador'),
 (14, 'Fernanda Silva', 'Arquitecta'),
 (15, 'Ricardo Vega', 'Ingeniero'),
 (16, 'Paola Navarro', 'Consultora'),
 (17, 'Andrés Flores', 'Auditor'),
 (18, 'Camila Ríos', 'Diseñadora UX'),
 (19, 'Roberto Sánchez', 'Logística'),
 (20, 'Daniela Cruz', 'Administradora');

INSERT INTO hotel (ocupaciones, tipo_de_habitacion, servicios) VALUES
 ('OCC001', 'Individual', 'WiFi, TV, Aire acondicionado'),
 ('OCC002', 'Doble', 'WiFi, TV, Desayuno incluido'),
 ('OCC003', 'Triple', 'WiFi, TV, Aire acondicionado, Balcón'),
 ('OCC004', 'Suite', 'WiFi, TV, Jacuzzi, Minibar'),
 ('OCC005', 'Individual', 'WiFi, Ventilador, TV'),
 ('OCC006', 'Doble', 'WiFi, TV, Aire acondicionado, Piscina'),
 ('OCC007', 'Familiar', 'WiFi, Cocina, Sala de estar'),
 ('OCC008', 'Individual', 'WiFi, TV'),
 ('OCC009', 'Triple', 'WiFi, Aire acondicionado, Desayuno'),
 ('OCC010', 'Doble', 'WiFi, TV, Minibar'),
 ('OCC011', 'Suite', 'WiFi, Jacuzzi, Servicio a la habitación'),
 ('OCC012', 'Individual', 'WiFi, Ventilador'),
 ('OCC013', 'Familiar', 'WiFi, Cocina, TV, Piscina'),
 ('OCC014', 'Triple', 'WiFi, TV, Balcón'),
 ('OCC015', 'Doble', 'WiFi, Aire acondicionado'),
 ('OCC016', 'Individual', 'WiFi, TV, Desayuno'),
 ('OCC017', 'Suite', 'WiFi, TV, Jacuzzi, Vista al mar'),
 ('OCC018', 'Familiar', 'WiFi, Cocina, Aire acondicionado'),
 ('OCC019', 'Triple', 'WiFi, TV, Minibar'),
 ('OCC020', 'Doble', 'WiFi, TV, Piscina');
 
INSERT INTO cliente (cui, nacionalidad, telefono) VALUES
('3015123450101', 'Guatemalteca', '55512345'),
('3026234560202', 'Salvadoreña', '55623456'),
('3037345670303', 'Hondureña', '55734567'),
('3048456780404', 'Nicaragüense', '55845678'),
('3059567890505', 'Costarricense', '55956789'),
('3061678900606', 'Panameña', '55167890'),
('3072789010707', 'Mexicana', '55278901'),
('3083890120808', 'Colombiana', '55389012'),
('3094901230909', 'Peruana', '55490123'),
('3105012341010', 'Argentina', '55501234'),
('3116123451111', 'Chilena', '55612345'),
('3127234561212', 'Ecuatoriana', '55723456'),
('3138345671313', 'Boliviana', '55834567'),
('3149456781414', 'Paraguaya', '55945678'),
('3150567891515', 'Uruguaya', '55156789'),
('3161678901616', 'Brasileña', '55267890'),
('3172789011717', 'Venezolana', '55378901'),
('3183890121818', 'Española', '55489012'),
('3194901231919', 'Estadounidense', '55590123'),
('3205012342020', 'Canadiense', '55601234');

INSERT INTO habitaciones (numero_de_habitacion, piso, precio_por_noche, tipo_habitacion) VALUES
(101, 1, 250.00, 'Individual'),
(102, 1, 300.00, 'Doble'),
(103, 1, 350.00, 'Triple'),
(104, 1, 500.00, 'Suite'),
(201, 2, 260.00, 'Individual'),
(202, 2, 310.00, 'Doble'),
(203, 2, 360.00, 'Triple'),
(204, 2, 520.00, 'Suite'),
(301, 3, 270.00, 'Individual'),
(302, 3, 320.00, 'Doble'),
(303, 3, 370.00, 'Triple'),
(304, 3, 540.00, 'Suite'),
(401, 4, 280.00, 'Individual'),
(402, 4, 330.00, 'Doble'),
(403, 4, 380.00, 'Triple'),
(404, 4, 560.00, 'Suite'),
(501, 5, 300.00, 'Individual'),
(502, 5, 350.00, 'Doble'),
(503, 5, 400.00, 'Triple'),
(504, 5, 600.00, 'Suite');

INSERT INTO reserva (fecha_inicio, estado_habitacion, cui_cliente, id_empleado, numero_de_habitacion) VALUES
 ('2026-06-01 08:00:00', 'Ocupada', 3015123450101, 1, 101),
 ('2026-06-02 09:00:00', 'Reservada', 3026234560202, 2, 102),
 ('2026-06-03 10:00:00', 'Disponible', 3037345670303, 3, 103),
 ('2026-06-04 11:00:00', 'Ocupada', 3048456780404, 4, 104),
 ('2026-06-05 12:00:00', 'Reservada', 3059567890505, 5, 201),
 ('2026-06-06 13:00:00', 'Disponible', 3061678900606, 6, 202),
 ('2026-06-07 14:00:00', 'Ocupada', 3072789010707, 7, 203),
 ('2026-06-08 15:00:00', 'Reservada', 3083890120808, 8, 204),
 ('2026-06-09 16:00:00', 'Disponible', 3094901230909, 9, 301),
 ('2026-06-10 17:00:00', 'Ocupada', 3105012341010, 10, 302),
 ('2026-06-11 18:00:00', 'Reservada', 3116123451111, 11, 303),
 ('2026-06-12 19:00:00', 'Disponible', 3127234561212, 12, 304),
 ('2026-06-13 20:00:00', 'Ocupada', 3138345671313, 13, 401),
 ('2026-06-14 21:00:00', 'Reservada', 3149456781414, 14, 402),
 ('2026-06-15 22:00:00', 'Disponible', 3150567891515, 15, 403),
 ('2026-06-16 07:00:00', 'Ocupada', 3161678901616, 16, 404),
 ('2026-06-17 08:30:00', 'Reservada', 3172789011717, 17, 501),
 ('2026-06-18 09:30:00', 'Disponible', 3183890121818, 18, 502),
 ('2026-06-19 10:30:00', 'Ocupada', 3194901231919, 19, 503),
 ('2026-06-20 11:30:00', 'Reservada', 3205012342020, 20, 504);
 
 CALL sp_agregar_empleado(21, 'Gabriel Leiva', 'Recepcionista');
CALL sp_agregar_empleado(22, 'Andrea Soto', 'Cocinera');
CALL sp_agregar_empleado(23, 'Mario Rios', 'Botones');
CALL sp_agregar_empleado(24, 'Lucia Mendez', 'Lavandería');
CALL sp_agregar_empleado(25, 'Carlos Ruiz', 'Seguridad');
CALL sp_agregar_empleado(26, 'Sofia Castro', 'Limpieza');
CALL sp_agregar_empleado(27, 'Jorge Ramirez', 'Mantenimiento');
CALL sp_agregar_empleado(28, 'Ana Beltran', 'Cajera');
CALL sp_agregar_empleado(29, 'Luis Morales', 'Mensajero');
CALL sp_agregar_empleado(30, 'Mariana Lopez', 'Administrativa');
CALL sp_agregar_empleado(31, 'Pedro Arana', 'Ayudante de cocina');
CALL sp_agregar_empleado(32, 'Clara Vega', 'Recepcionista');
CALL sp_agregar_empleado(33, 'Roberto Paz', 'Jardinero');
CALL sp_agregar_empleado(34, 'Daniela Cruz', 'Supervisora');
CALL sp_agregar_empleado(35, 'Esteban Juarez', 'Chofer');
CALL sp_agregar_empleado(36, 'Valeria Orellana', 'Contadora');
CALL sp_agregar_empleado(37, 'Fernando Solis', 'Bodeguero');
CALL sp_agregar_empleado(38, 'Camila Ponce', 'Recursos Humanos');
CALL sp_agregar_empleado(39, 'Ricardo Monroy', 'Gerente de operaciones');
CALL sp_agregar_empleado(40, 'Silvia Escobar', 'Asistente');

CALL sp_agregar_hotel('OCC021', 'Individual', 'WiFi, Baño privado, Escritorio');
CALL sp_agregar_hotel('OCC022', 'Doble', 'WiFi, Parqueo, TV por cable');
CALL sp_agregar_hotel('OCC023', 'Triple', 'WiFi, Vista al jardín, Calefacción');
CALL sp_agregar_hotel('OCC024', 'Suite', 'WiFi, Caja fuerte, Sala de estar');
CALL sp_agregar_hotel('OCC025', 'Individual', 'WiFi, Económica, Ventilador');
CALL sp_agregar_hotel('OCC026', 'Doble', 'WiFi, Cama King, Balcón');
CALL sp_agregar_hotel('OCC027', 'Familiar', 'WiFi, Capacidad 6 personas, Comedor');
CALL sp_agregar_hotel('OCC028', 'Individual', 'WiFi, Aire acondicionado, Vista ciudad');
CALL sp_agregar_hotel('OCC029', 'Triple', 'WiFi, Baño compartido, Económica');
CALL sp_agregar_hotel('OCC030', 'Doble', 'WiFi, Cama Queen, Escritorio');
CALL sp_agregar_hotel('OCC031', 'Suite', 'WiFi, Acceso piscina, Lujo');
CALL sp_agregar_hotel('OCC032', 'Individual', 'WiFi, Desayuno incluido');
CALL sp_agregar_hotel('OCC033', 'Familiar', 'WiFi, Lavandería, Patio');
CALL sp_agregar_hotel('OCC034', 'Triple', 'WiFi, Desayuno y cena incluidos');
CALL sp_agregar_hotel('OCC035', 'Doble', 'WiFi, Servicio a la habitación');
CALL sp_agregar_hotel('OCC036', 'Individual', 'WiFi, Solo alojamiento');
CALL sp_agregar_hotel('OCC037', 'Suite', 'WiFi, Comedor privado, Minibar');
CALL sp_agregar_hotel('OCC038', 'Familiar', 'WiFi, Amplia, Cómoda');
CALL sp_agregar_hotel('OCC039', 'Triple', 'WiFi, Escritorio, Iluminación LED');
CALL sp_agregar_hotel('OCC040', 'Doble', 'WiFi, Terraza, Vista panorámica');

-- 🔹 LLAMADAS PARA CLIENTE
CALL sp_agregar_cliente(1015123450101, 'Guatemalteca', '55510001');
CALL sp_agregar_cliente(1026234560202, 'Salvadoreña', '55510002');
CALL sp_agregar_cliente(1037345670303, 'Hondureña', '55510003');
CALL sp_agregar_cliente(1048456780404, 'Nicaragüense', '55510004');
CALL sp_agregar_cliente(1059567890505, 'Costarricense', '55510005');
CALL sp_agregar_cliente(1060678900606, 'Panameña', '55510006');
CALL sp_agregar_cliente(1071789010707, 'Mexicana', '55510007');
CALL sp_agregar_cliente(1082890120808, 'Colombiana', '55510008');
CALL sp_agregar_cliente(1093901230909, 'Venezolana', '55510009');
CALL sp_agregar_cliente(1104012341010, 'Argentina', '55510010');
CALL sp_agregar_cliente(1115123451111, 'Chilena', '55510011');
CALL sp_agregar_cliente(1126234561212, 'Peruana', '55510012');
CALL sp_agregar_cliente(1137345671313, 'Ecuatoriana', '55510013');
CALL sp_agregar_cliente(1148456781414, 'Brasileña', '55510014');
CALL sp_agregar_cliente(1159567891515, 'Uruguaya', '55510015');
CALL sp_agregar_cliente(1160678901616, 'Paraguaya', '55510016');
CALL sp_agregar_cliente(1171789011717, 'Boliviana', '55510017');
CALL sp_agregar_cliente(1182890121818, 'Española', '55510018');
CALL sp_agregar_cliente(1193901231919, 'Francesa', '55510019');
CALL sp_agregar_cliente(1204012342020, 'Alemana', '55510020');

-- 🔹 LLAMADAS PARA HABITACIONES
CALL sp_agregar_habitaciones(101, 'Piso 1', 150.50, 'Individual', 'OCC001', 21);
CALL sp_agregar_habitaciones(102, 'Piso 1', 200.00, 'Doble', 'OCC002', 22);
CALL sp_agregar_habitaciones(201, 'Piso 2', 450.75, 'Suite', 'OCC003', 23);
CALL sp_agregar_habitaciones(202, 'Piso 2', 300.00, 'Familiar', 'OCC004', 24);
CALL sp_agregar_habitaciones(301, 'Piso 3', 180.25, 'Triple', 'OCC005', 25);
CALL sp_agregar_habitaciones(302, 'Piso 3', 120.00, 'Individual', 'OCC006', 26);
CALL sp_agregar_habitaciones(401, 'Piso 4', 220.99, 'Doble', 'OCC007', 27);
CALL sp_agregar_habitaciones(402, 'Piso 4', 500.00, 'Suite', 'OCC008', 28);
CALL sp_agregar_habitaciones(501, 'Piso 5', 350.50, 'Familiar', 'OCC009', 29);
CALL sp_agregar_habitaciones(502, 'Piso 5', 190.00, 'Triple', 'OCC010', 30);
CALL sp_agregar_habitaciones(601, 'Piso 6', 100.00, 'Individual', 'OCC011', 31);
CALL sp_agregar_habitaciones(602, 'Piso 6', 250.00, 'Doble', 'OCC012', 32);
CALL sp_agregar_habitaciones(701, 'Piso 7', 600.00, 'Suite', 'OCC013', 33);
CALL sp_agregar_habitaciones(702, 'Piso 7', 400.00, 'Familiar', 'OCC014', 34);
CALL sp_agregar_habitaciones(801, 'Piso 8', 175.00, 'Triple', 'OCC015', 35);
CALL sp_agregar_habitaciones(802, 'Piso 8', 140.00, 'Individual', 'OCC016', 36);
CALL sp_agregar_habitaciones(901, 'Piso 9', 230.00, 'Doble', 'OCC017', 37);
CALL sp_agregar_habitaciones(902, 'Piso 9', 550.00, 'Suite', 'OCC018', 38);
CALL sp_agregar_habitaciones(1001, 'Piso 10', 380.00, 'Familiar', 'OCC019', 39);
CALL sp_agregar_habitaciones(1002, 'Piso 10', 210.00, 'Triple', 'OCC020', 40);

-- 🔹 LLAMADAS PARA RESERVA
CALL sp_agregar_reserva('2026-06-21 12:00:00', 'Confirmada', 2015123450101, 21, 601);
CALL sp_agregar_reserva('2026-06-22 13:00:00', 'Ocupada', 2026234560202, 22, 602);
CALL sp_agregar_reserva('2026-06-23 14:00:00', 'Confirmada', 2037345670303, 23, 603);
CALL sp_agregar_reserva('2026-06-24 15:00:00', 'Reservada', 2048456780404, 24, 604);
CALL sp_agregar_reserva('2026-06-25 16:00:00', 'Confirmada', 2059567890505, 25, 701);
CALL sp_agregar_reserva('2026-06-26 17:00:00', 'Disponible', 2061678900606, 26, 702);
CALL sp_agregar_reserva('2026-06-27 18:00:00', 'Confirmada', 2072789010707, 27, 703);
CALL sp_agregar_reserva('2026-06-28 19:00:00', 'Ocupada', 2083890120808, 28, 704);
CALL sp_agregar_reserva('2026-06-29 20:00:00', 'Confirmada', 2094901230909, 29, 801);
CALL sp_agregar_reserva('2026-06-30 21:00:00', 'Reservada', 2105012341010, 30, 802);
CALL sp_agregar_reserva('2026-07-01 07:00:00', 'Confirmada', 2116123451111, 31, 803);
CALL sp_agregar_reserva('2026-07-02 08:00:00', 'Disponible', 2127234561212, 32, 804);
CALL sp_agregar_reserva('2026-07-03 09:00:00', 'Confirmada', 2138345671313, 33, 901);
CALL sp_agregar_reserva('2026-07-04 10:00:00', 'Ocupada', 2149456781414, 34, 902);
CALL sp_agregar_reserva('2026-07-05 11:00:00', 'Confirmada', 2150567891515, 35, 903);
CALL sp_agregar_reserva('2026-07-06 12:00:00', 'Reservada', 2161678901616, 36, 904);
CALL sp_agregar_reserva('2026-07-07 13:00:00', 'Confirmada', 2172789011717, 37, 1001);
CALL sp_agregar_reserva('2026-07-08 14:00:00', 'Disponible', 2183890121818, 38, 1002);
CALL sp_agregar_reserva('2026-07-09 15:00:00', 'Confirmada', 2194901231919, 39, 1003);
CALL sp_agregar_reserva('2026-07-10 16:00:00', 'Ocupada', 2205012342020, 40, 1004);

CALL sp_listar_hotel();
CALL sp_listar_cliente();
CALL sp_listar_habitaciones();
CALL sp_listar_reserva();

-- Consultar Vista de Clientes
select * from vw_clientes;

-- Consultar Vista de Habitaciones
select * from vw_habitaciones;

-- Consultar Vista de Empleados
select * from vw_empleados;

-- Consultar Vista de Reservas
select * from vw_reservas;

-- Consultar Vista Global / Detalle de Reservas
select * from vw_detalle_reservas;

