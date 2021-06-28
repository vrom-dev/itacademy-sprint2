SELECT
    e.empleado_nombre,
    e.empleado_apellidos,
    e.empleado_puesto,
    e.tienda_id,
    pr.pedido_reparto_hora,
    pr.pedido_reparto_id
FROM
    pedido_reparto AS pr
        INNER JOIN
    empleado AS e
WHERE
    e.empleado_id = pr.empleado_id
    AND e.empleado_id = 1;
    
SELECT 
    *
FROM
    pedido_detalle AS pd
WHERE
    pd.pedido_id IN (SELECT 
            p.pedido_id
        FROM
            pedido AS p
                INNER JOIN
            tienda AS t
        WHERE
            p.tienda_id = t.tienda_id
                AND t.localidad_id = 5);