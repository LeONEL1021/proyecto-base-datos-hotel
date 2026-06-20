-- =============================================================================
-- SCRIPT 4: PROGRAMACION EN LA BASE DE DATOS (FUNCIONES, PROCEDIMIENTOS Y TRIGGERS)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. función: calcular el costo base de estadía por habitación
-- -----------------------------------------------------------------------------
create or replace function fn_calcular_costo_habitacion(p_id_reservacion int)
returns numeric(10,2) as $$
declare
v_noches int; -- número de noches que se quedó el cliente
v_tarifa numeric(10,2); -- precio por noche que cuesta esa habitación
v_subtotal numeric(10,2); -- resultado de multiplicar las noches por la tarifa
begin
select (r.fecha_checkout - r.fecha_checkin), th.tarifa_noche 
into v_noches, v_tarifa
from reservacion r
inner join tipo_habitacion th on r.id_tipo = th.id_tipo
where r.id_reservacion = p_id_reservacion;
    
v_subtotal := coalesce(v_noches, 0) * coalesce(v_tarifa, 0); -- guarda el resultado en mcoalesce, si hay un null devuelve 0
return v_subtotal;
end;
$$ language plpgsql;

-- -----------------------------------------------------------------------------
-- 2. procedimiento sugerido: realizar el proceso de check-out y facturación
-- -----------------------------------------------------------------------------
create or replace procedure pr_realizar_checkout(
p_id_reservacion int,
p_metodo_pago varchar
) as $$
declare
v_subtotal_hab numeric(10,2);
v_subtotal_serv numeric(10,2);
v_impuestos numeric(10,2);
v_total_final numeric(10,2);
begin
-- calcular el costo total de la estadía (usando la función)
v_subtotal_hab := fn_calcular_costo_habitacion(p_id_reservacion);
    
-- calcular la suma de los servicios consumidos en la reservación
select coalesce(sum(subtotal), 0.00) into v_subtotal_serv
from consumo_servicio
where id_reservacion = p_id_reservacion;
    
-- calcular impuestos (ejemplo del 13% sobre la suma de servicios y cuarto)
v_impuestos := (v_subtotal_hab + v_subtotal_serv) * 0.13;
    
-- calcular el monto total a cobrar
v_total_final := v_subtotal_hab + v_subtotal_serv + v_impuestos;
    
-- insertar la factura consolidada con los campos exactos de las tablas
insert into factura (fecha, subtotal_habitacion, subtotal_servicios, impuestos, total, metodo_pago, estado_pago, id_reservacion)
values (current_date, v_subtotal_hab, v_subtotal_serv, v_impuestos, v_total_final, p_metodo_pago, 'pagado', p_id_reservacion);
    
-- registrar los montos finales en la tabla check_in_out para cerrar la estadía
update check_in_out
set monto_estadia = v_subtotal_hab,
consumo_total = v_subtotal_serv,
fecha_checkout_real = current_date
where id_reservacion = p_id_reservacion;
end;
$$ language plpgsql;

-- -----------------------------------------------------------------------------
-- 3. trigger sugerido: verificar disponibilidad de habitación en un período
-- -----------------------------------------------------------------------------

-- función que validará el cruce de fechas
create or replace function fn_trg_verificar_disponibilidad()
returns trigger as $$
declare
v_conflictos int;
begin
-- cuenta si existen reservaciones activas para la misma habitación que se traslapen en fechas
select count(*) into v_conflictos
from reservacion r
inner join habitacion h on r.id_tipo = h.id_tipo  -- asocia mediante el tipo mapeado en tu modelo
where r.id_tipo = new.id_tipo
and r.estado = 'activa'
and (
(new.fecha_checkin between r.fecha_checkin and r.fecha_checkout) or
(new.fecha_checkout between r.fecha_checkin and r.fecha_checkout) or
(r.fecha_checkin between new.fecha_checkin and new.fecha_checkout)
);

-- si hay al menos un conflicto, frena la inserción mandando una excepción
if v_conflictos > 0 then
raise exception 'error: la habitación de este tipo ya se encuentra reservada en el rango de fechas seleccionado.';
end if;
    
return new;
end;
$$ language plpgsql;

-- asociar el trigger a la tabla reservacion antes de insertar
create or replace trigger trg_verificar_fechas_reserva
before insert on reservacion
for each row
execute function fn_trg_verificar_disponibilidad();

