-- ------------------------------------------------------------
-- CONSULTAS REQUERIDAS
-- ------------------------------------------------------------

-- 1. Productos por debajo o igual del stock mínimo
SELECT id_producto, nombre, stock_actual, stock_minimo 
FROM productos 
WHERE stock_actual <= stock_minimo;

-- 2. Pedidos realizados entre un rango de fechas (ej. febrero 2026)
SELECT id_pedido, fecha_pedido, id_cliente, total_con_iva 
FROM pedidos 
WHERE fecha_pedido BETWEEN '2026-02-01 00:00:00' AND '2026-02-28 23:59:59';

-- 3. Productos más vendidos (Top ranking)
SELECT p.id_producto, p.nombre, SUM(dp.cantidad) AS total_unidades_vendidas
FROM detalle_pedido dp
JOIN productos p ON dp.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY total_unidades_vendidas DESC;

-- 4. Conteo de pedidos por cliente
SELECT c.id_cliente, c.nombre_completo, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre_completo;

-- 5. Búsqueda parcial de clientes por nombre
SELECT * FROM clientes 
WHERE nombre_completo LIKE '%Super%';

-- 6. Productos pertenecientes a categorías específicas
SELECT p.id_producto, p.nombre, c.nombre_categoria, p.precio 
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE c.nombre_categoria IN ('Gaseosas Cola', 'Energizantes', 'Isotónicas');

-- 7. Cliente con el mayor número de pedidos (Subconsulta)
SELECT id_cliente, nombre_completo 
FROM clientes 
WHERE id_cliente = (
    SELECT id_cliente 
    FROM pedidos 
    GROUP BY id_cliente 
    ORDER BY COUNT(id_pedido) DESC 
    LIMIT 1
);

-- 8. Monto acumulado de ventas por sede
SELECT s.id_sede, s.nombre_sede, IFNULL(SUM(p.total_con_iva), 0.00) AS total_ventas
FROM sedes s
LEFT JOIN pedidos p ON s.id_sede = p.id_sede
GROUP BY s.id_sede, s.nombre_sede;