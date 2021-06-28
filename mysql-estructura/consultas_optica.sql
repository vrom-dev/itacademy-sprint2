USE optica;

SELECT 
    f.factura_fecha,
    g.gafa_precio,
    g.gafa_marca
FROM
    factura AS f
        INNER JOIN
    gafa AS g
WHERE
    f.gafa_id = g.gafa_id
        AND f.cliente_id = 3
        AND f.factura_fecha > '2020-01-01';

SELECT
    f.factura_fecha, g.gafa_id, g.gafa_montura, g.gafa_cristal_color, g.gafa_marca, g.gafa_precio
FROM
    factura AS f
        INNER JOIN
    gafa AS g
WHERE
    f.gafa_id = g.gafa_id
        AND f.empleado_id = 3
        AND f.factura_fecha > '2021-01-01';
        
SELECT 
    p.proveedor_nombre,
    p.proveedor_telefono,
    p.proveedor_ciudad,
    p.proveedor_pais,
    p.proveedor_nif
FROM
    proveedor as p
WHERE
    p.proveedor_id IN (SELECT 
            g.proveedor_id
        FROM
            factura AS f
                INNER JOIN
            gafa AS g
        WHERE
            g.gafa_id = f.gafa_id);