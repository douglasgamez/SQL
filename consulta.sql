
--CONSULTA SQL --

select mov.nombre_modelo ,mav.nombre_marca ,g.nombre_grupo ,
kv.fecha_compra ,kv.matricula ,c.nombre_color ,kv.total_kilometros ,
a.nombre_aseguradora ,kv.num_poliza_seguro ,rv.importe ,m.nombre_moneda 
from grupovehiculos g 
inner join marcavehiculos mav on g.id_grupo =mav.id_grupo
inner join modelovehiculos mov on mav.id_marca =mov.id_marca
FULL join kc_vehiculos kv on mov.id_modelo =kv.id_modelo
inner join colorvehiculos c on kv.id_color =c.id_color 
inner join aseguradoras a on kv.id_aseguradora =a.id_aseguradora 
inner join revisiones_vehiculos rv on kv.id_vehiculo =rv.id_vehiculo
inner join moneda m on rv.id_moneda = m.id_moneda;