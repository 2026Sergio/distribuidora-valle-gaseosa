# Distribuidora de Bebidas valle S.A.
**Sistema de Gestión Relacional y Automatización de Inventarios en MySQL**

**Autor:** Sergio Ricardo Ajú Miranda  
**Fecha:** Agosto de 2026  
**Tecnologías:** MySQL

---

## Descripción del Proyecto

Este proyecto consiste en el diseño, implementación y optimización de la base de datos relacional para **Distribuidora de Bebidas de valle S.A.**, una empresa enfocada en la comercialización y distribución de bebidas, gaseosas, jugos y aguas a nivel nacional.

El sistema administra la trazabilidad completa de las operaciones comerciales: desde la recepción de mercancía por parte de proveedores, el control de catálogo estructurado por categorías, la distribución del stock en sedes, hasta la gestión integral de clientes, pedidos y auditoría de precios en tiempo real.

---

## Arquitectura y Modelo de Datos (9 Tablas)

El modelo fue normalizado hasta la **Tercera Forma Normal (3FN)** para garantizar la integridad referencial y evitar redundancias.

### **Estructura de las Tablas**

1. **`proveedores`**: Registro de las empresas fabricantes y distribuidoras mayoristas.
2. **`categorias`**: Clasificación del catálogo (Gaseosas Cola, Energizantes, Isotónicas, Aguas, etc.).
3. **`sedes`**: Puntos de distribución física y bodegas de la empresa.
4. **`productos`**: Ficha técnica de cada bebida (nombre, precios, volumen en ml, proveedor y categoría).
5. **`inventario_sedes`** *(Tabla Intermedia)*: Control N:M para la distribución de existencias por cada sede.
6. **`clientes`**: Directorio de comercios, abarroterías y clientes corporativos.
7. **`pedidos`**: Encabezado de transacciones comerciales con cálculo de montos sin/con IVA.
8. **`detalle_pedido`** *(Tabla Intermedia)*: Relación N:M que desglose los productos y cantidades por pedido.
9. **`auditoria_precios`** *(Tabla de Control)*: Registro automatizado para el historial de modificaciones en los precios de los productos.

---

![alt text](nuevodiagrama.png)

## Automatización: Funciones y Triggers

### **Funciones Personalizadas (`functions.sql`)**
* **`fn_calcular_total_con_iva(p_id_pedido)`**: Calcula el valor total de una venta sumando sus subtotales y aplicando la tasa impositiva del IVA (19%).
* **`fn_validar_stock(p_id_producto, p_cantidad)`**: Evalúa la disponibilidad de inventario antes de procesar un pedido y devuelve una respuesta indicativa del estado del stock.

### **Triggers Automatizados (`triggers.sql`)**
* **`tr_actualizar_stock`**: Disparador de tipo `AFTER INSERT` sobre `detalle_pedido`. Descuenta automáticamente las unidades vendidas directamente del stock global de la tabla `productos` y actualiza la cantidad en la sede correspondiente.
* **`tr_auditar_cambio_precio`**: Disparador de tipo `AFTER UPDATE` sobre `productos`. Detecta cualquier cambio en la columna `precio` y almacena automáticamente el precio anterior, el nuevo y la marca de tiempo en `auditoria_precios`.

---

## Consultas y Vistas del Sistema (`views_and_queries.sql`)

### **Vistas Creadas**
* **`vista_resumen_pedidos_por_sede`**: Consolida el volumen de ventas y los totales financieros acumulados por cada sede.
* **`vista_productos_bajo_stock`**: Muestra los productos cuyo inventario está por debajo o igual al stock mínimo de reabastecimiento.
* **`vista_clientes_activos`**: Resumen analítico de los clientes, su conteo de pedidos y la fecha de su última compra.

### **Consultas Clave Implementadas**
* Filtrado de productos bajo el límite de stock mínimo.
* Reporte de pedidos en rangos de fechas específicos (`BETWEEN`).
* Ranking de productos más vendidos mediante agregación (`JOIN` + `GROUP BY`).
* Conteo de transacciones por cliente (`COUNT` y `LEFT JOIN`).
* Búsqueda parcial de clientes mediante la cláusula `LIKE`.
* Filtrado de productos por múltiples categorías usando `IN`.
* Identificación del cliente top mediante subconsultas anidadas.
* Agrupación de ventas totales por sede.

---

## Guía de Ejecución

Para desplegar la base de datos localmente, ejecuta los scripts en el siguiente orden dentro de tu cliente SQL (MySQL Workbench, phpMyAdmin o CLI):

1. **`database.sql`**: Crea la base de datos `distribuidora_bebidas_norte`, genera la estructura de 9 tablas e inserta los datos de prueba (4 sedes, 20 clientes, 50 productos, proveedores y pedidos).
2. **`functions.sql`**: Compila las funciones almacenadas del sistema.
3. **`triggers.sql`**: Activa la automatización de stock y auditoría de precios.
4. **`views_and_queries.sql`**: Registra las vistas analíticas y ejecuta las consultas del sistema.

---

