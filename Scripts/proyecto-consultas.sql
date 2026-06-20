-- =============================================================================
-- TERCER SCRIPT: ARCHIVO DE CONSULTAS SQL DESARROLLADAS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Consulta 1: Habitaciones disponibles en un rango de fechas dado.
-- Rango de ejemplo: Del 2026-07-01 al 2026-07-05
-- Técnica: Subconsulta Correlacionada con not exists
-- -----------------------------------------------------------------------------
select
h.numero_habitacion,
th.nombre as tipo_habitacion,
th.tarifa_noche,
ho.nombre as hotel
from habitacion h
inner join tipo_habitacion th on h.id_tipo = th.id_tipo
inner join hotel ho on h.id_hotel = ho.id_hotel
where not exists (
select 1 
from reservacion r
where r.id_tipo = h.id_tipo -- Se asocia por el tipo asignado a la habitación
and r.fecha_checkin < '2026-07-05'  -- Fecha Fin que busca el cliente
and r.fecha_checkout > '2026-07-01' -- Fecha Inicio que busca el cliente
)
order by h.numero_habitacion asc;

-- -----------------------------------------------------------------------------
-- Consulta: Huéspedes con mayor gasto histórico (Clientes VIP)
-- Técnica: Inner Join + Group By + Función de Agregación SUM 
-- -----------------------------------------------------------------------------
select 
h.id_huesped,                                   
h.nombre as nombre_huesped,                     
h.apellido as apellido_huesped,                
SUM(f.total) as gasto_historico_total   
from huesped h                                      
inner join reservacion r on h.id_huesped = r.id_huesped -- conecta el huésped con sus reservaciones
inner join factura f on r.id_reservacion = f.id_reservacion -- conecta la reservación con su factura
group by h.id_huesped, h.nombre, h.apellido  -- agrupa por cliente para poder hacer la suma 
order by gasto_historico_total desc;

-- -----------------------------------------------------------------------------
-- Consulta: Servicios más consumidos por tipo de habitación.
-- Técnica: Multi-Table join + GROUP BY + Función count
-- -----------------------------------------------------------------------------
select 
th.nombre as tipo_habitacion,                    
s.nombre as servicio,                            
count(*) as cantidad_consumos                    
from tipo_habitacion th 
inner join reservacion r on th.id_tipo = r.id_tipo   -- conecta la categoría con las reservaciones
inner join consumo_servicio cs on r.id_reservacion = cs.id_reservacion -- conecta la reservación con sus consumos 
inner join servicio s on cs.id_servicio = s.id_servicio -- conecta el consumo con el nombre del servicio
group by th.id_tipo, th.nombre, s.id_servicio, s.nombre -- agrupa por categoría y por servicio 
order by th.nombre asc, cantidad_consumos desc;     

-- tasa= (dias reservados/dias totales del mes) * (100)
-- -----------------------------------------------------------------------------
-- consulta: tasa de ocupación mensual (%) por tipo de habitación.
-- rango de ejemplo: julio de 2026 
-- técnica: operaciones aritméticas + funciones de fecha + group by 
-- -----------------------------------------------------------------------------
select 
th.nombre as tipo_habitacion,                    
sum(r.fecha_checkout - r.fecha_checkin) as noches_ocupadas, 
round((sum(r.fecha_checkout - r.fecha_checkin) / (31.0)) * 100, 2) as tasa_ocupacion_porcentaje --(días reservados / 31 días de julio) * 100
from tipo_habitacion th
inner join reservacion r on th.id_tipo = r.id_tipo    -- conecta la categoría con sus reservaciones
where r.fecha_checkin between '2026-07-01' and '2026-07-31' -- filtra solo el mes de julio
group by th.id_tipo, th.nombre                        -- agrupa por categoría para consolidar los cálculos
order by tasa_ocupacion_porcentaje desc;

-- -----------------------------------------------------------------------------
-- consulta: ingresos totales por mes en el año en curso (2026).
-- técnica: funciones de fecha + group by + sum (clase 11, 13 y 15)
-- -----------------------------------------------------------------------------
select 
to_char(f.fecha, 'tmmonth') as mes,               
extract(month from f.fecha) as numero_mes,        -- agarra el número del mes para poder ordenar correctamente
sum(f.total) as ingresos_totales                 
from factura f                                        
where extract(year from f.fecha) = 2026               -- filtra solo las facturas del año en curso 
group by extract(month from f.fecha), to_char(f.fecha, 'tmmonth') -- agrupa por mes para consolidar los montos
order by numero_mes asc;




