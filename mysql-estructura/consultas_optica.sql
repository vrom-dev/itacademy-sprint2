USE optica;

SELECT 
    g.gafa_fecha_venta, g.gafa_precio, g.gafa_marca
FROM
    gafa AS g
WHERE
    g.cliente_id = 1
AND 
	g.gafa_fecha_venta > '2020-01-01';

SELECT
    g.gafa_fecha_venta, g.gafa_id, g.gafa_montura, g.gafa_cristal_color, g.gafa_marca, g.gafa_precio
FROM
    gafa AS g
WHERE
	g.empleado_id = 2
AND 
	g.gafa_fecha_venta > '2021-01-01';
        
SELECT 
    *
FROM
    proveedor as p
WHERE
    p.proveedor_id IN (SELECT 
            proveedor_id
        FROM
            gafa)