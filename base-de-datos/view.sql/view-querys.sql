-- ------------------------------------------------------------
-- VISTAS DEL SISTEMA (CREATE VIEW)
-- ------------------------------------------------------------

-- Vista 1: Resumen de pedidos por sede
CREATE OR REPLACE VIEW vista_resumen_pedidos_por_sede AS
SELECT 
    s.nombre_sede,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    IFNULL(SUM(p.total_sin_iva), 0) AS subtotal_acumulado,
    IFNULL(SUM(p.total_con_iva), 0) AS total_acumulado
FROM sedes s
LEFT JOIN pedidos p ON s.id_sede = p.id_sede
GROUP BY s.id_sede, s.nombre_sede;

-- Vista 2: Control de productos con bajo stock
CREATE OR REPLACE VIEW vista_productos_bajo_stock AS
SELECT 
    p.id_producto,
    p.nombre AS producto,
    cat.nombre_categoria AS categoria,
    prov.nombre_empresa AS proveedor,
    p.stock_actual,
    p.stock_minimo
FROM productos p
JOIN categorias cat ON p.id_categoria = cat.id_categoria
JOIN proveedores prov ON p.id_proveedor = prov.id_proveedor
WHERE p.stock_actual <= p.stock_minimo;

-- Vista 3: Clientes activos con historial de compras
CREATE OR REPLACE VIEW vista_clientes_activos AS
SELECT 
    c.id_cliente,
    c.nombre_completo,
    c.identificacion,
    c.telefono,
    COUNT(p.id_pedido) AS total_compras,
    MAX(p.fecha_pedido) AS ultima_compra
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre_completo, c.identificacion, c.telefono;

-- ------------------------------------------------------------
-- 3. PRUEBA DE VISTAS
-- ------------------------------------------------------------

-- Consultar Vista 1: Resumen de pedidos por sede
SELECT * FROM vista_resumen_pedidos_por_sede;

-- Consultar Vista 2: Control de productos con bajo stock
SELECT * FROM vista_productos_bajo_stock;

-- Consultar Vista 3: Listado de clientes activos con historial de compras
SELECT * FROM vista_clientes_activos;