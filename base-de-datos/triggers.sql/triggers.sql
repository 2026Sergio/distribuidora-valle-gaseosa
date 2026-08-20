-- ============================================================
-- PROYECTO: Distribuidora de Bebidas del Norte S.A.
-- ARCHIVO: triggers.sql
-- ============================================================

USE distribuidora_bebidas_norte;

DELIMITER //

-- Trigger 1: Descontar stock automáticamente tras registrar una venta
DROP TRIGGER IF EXISTS tr_actualizar_stock //
CREATE TRIGGER tr_actualizar_stock
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
    UPDATE productos 
    SET stock_actual = stock_actual - NEW.cantidad 
    WHERE id_producto = NEW.id_producto;
END //

-- Trigger 2: Registrar cambios de precios en auditoría
DROP TRIGGER IF EXISTS tr_auditar_cambio_precio //
CREATE TRIGGER tr_auditar_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, fecha_modificacion)
        VALUES (OLD.id_producto, OLD.precio, NEW.precio, NOW());
    END IF;
END //

DELIMITER ;

-- ------------------------------------------------------------
-- 2. PRUEBA DE TRIGGERS
-- ------------------------------------------------------------

-- A. Verificar Trigger 'tr_actualizar_stock'
-- Consultar el stock actual del producto 1 antes de vender (Stock actual: 1200)
SELECT id_producto, nombre, stock_actual FROM productos WHERE id_producto = 1;

-- Insertar un detalle de pedido de 20 unidades del producto 1
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal) 
VALUES (1, 1, 20, 0.65, 13.00);

-- Verificar que el stock se descontó automáticamente (Debe mostrar: 1180)
SELECT id_producto, nombre, stock_actual FROM productos WHERE id_producto = 1;


-- B. Verificar Trigger 'tr_auditar_cambio_precio'
-- Modificar el precio del producto 2 (Precio actual: 1.10)
UPDATE productos SET precio = 1.35 WHERE id_producto = 2;

-- Consultar la tabla de auditoría para comprobar que se registró la modificación
SELECT * FROM auditoria_precios WHERE id_producto = 2;