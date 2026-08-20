
-- --------------------------------------------------------------
-- funcion examen: calcular promedio pedidos cliente
-- -----------------------------------------------------------
DELIMITER //

DROP FUNCTION IF EXISTS calcular_promedio_pedidos_cliente //
CREATE FUNCTION calcular_promedio_pedidos_cliente(c_id_cliente INT) 
RETURNS DECIMAL(12.2)
BEGIN
    DECLARE v_total DECIMAL(12,2);
    SELECT IFNULL(SUM(subtotal), 0.00) 
    INTO v_total 
    FROM id_pedido 
    WHERE id_pedido = p_id_pedido;
    
    IF v_total IS NULL THEN
        RETURN v_total = 0
    ELSE IF v_total >= p_cantidad THEN
        RETURN v_total = CONCAT('pedidos totales (Actual: ', v_total, ')');
    END IF;
END //

DELIMITER ;


-- ===============================================
-- VISTAS EXAMEN: Vista resumen sedes
-- ===============================================

CREATE OR REPLACE VIEW vista_resumen_sedes AS
SELECT 
    s.nombre_sede,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    IFNULL(SUM(p.total_sin_iva), 0) AS total_acumulado
FROM sedes s
LEFT JOIN pedidos p ON s.id_sede = p.id_sede
GROUP BY s.id_sede, s.nombre_sede;

-- ============================================
-- EXAMEN: REALIZAR CONSULTA productos con precio mayor al promedio
-- ===========================================

SELECT id_producto, nombre, precio IFNULL(SUM(id_productos), 2.00) AS total_ventas
FROM productos 
WHERE id_productos;


-- ==============================================
-- TRIGGER QUE SE EJECUTE DESPUES DEL UPDATE: auditac cambioprecio

DELIMITER //

DROP TRIGGER IF EXISTS tr_auditar_cambio_precio //
CREATE TRIGGER auditar_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_modificacion)
        VALUES (NEW.precio, NOW());
    END IF;
END //

DELIMITER ;

