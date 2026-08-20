-- ============================================================
-- PROYECTO: Distribuidora de Bebidas del Norte S.A.
-- ARCHIVO: functions.sql
-- ============================================================

USE distribuidora_bebidas_norte;

DELIMITER //

-- Función 1: Calcular el total del pedido con IVA (19%)
DROP FUNCTION IF EXISTS fn_calcular_total_con_iva //
CREATE FUNCTION fn_calcular_total_con_iva(p_id_pedido INT) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_subtotal DECIMAL(12,2);
    DECLARE v_total_iva DECIMAL(12,2);
    
    SELECT IFNULL(SUM(subtotal), 0.00) 
    INTO v_subtotal 
    FROM detalle_pedido 
    WHERE id_pedido = p_id_pedido;
    
    SET v_total_iva = v_subtotal * 1.19;
    
    RETURN v_total_iva;
END //

-- Función 2: Validar la disponibilidad de stock
DROP FUNCTION IF EXISTS fn_validar_stock //
CREATE FUNCTION fn_validar_stock(p_id_producto INT, p_cantidad INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_resultado VARCHAR(100);
    
    SELECT stock_actual INTO v_stock_actual 
    FROM productos 
    WHERE id_producto = p_id_producto;
    
    IF v_stock_actual IS NULL THEN
        SET v_resultado = 'Error: Producto no encontrado';
    ELSEIF v_stock_actual >= p_cantidad THEN
        SET v_resultado = CONCAT('Stock disponible (Actual: ', v_stock_actual, ')');
    ELSE
        SET v_resultado = CONCAT('Stock insuficiente (Disponible: ', v_stock_actual, ')');
    END IF;
    
    RETURN v_resultado;
END //

DELIMITER ;

-- ------------------------------------------------------------
-- 1. PRUEBA DE FUNCIONES
-- ------------------------------------------------------------

-- Validar 'fn_validar_stock' (Prueba disponibilidad vs no disponible)
SELECT fn_validar_stock(1, 50) AS resultado_disponible;  -- Producto con suficiente stock
SELECT fn_validar_stock(28, 500) AS resultado_insuficiente; -- Producto con stock de 45 unidades

-- Validar 'fn_calcular_total_con_iva' para el pedido ID 1 (Suma subtotales + 19% IVA)
SELECT fn_calcular_total_con_iva(1) AS total_calculado_con_iva;