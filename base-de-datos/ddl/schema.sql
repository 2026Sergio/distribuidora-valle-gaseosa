DROP DATABASE IF EXISTS distribuidora_bebidas_norte;
CREATE DATABASE distribuidora_bebidas_norte
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE distribuidora_bebidas_norte;

-- 1. TABLA: proveedores
CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    nit_proveedor VARCHAR(20) NOT NULL UNIQUE,
    contacto_principal VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- 2. TABLA: categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
) ENGINE=InnoDB;

-- 3. TABLA: sedes (4 SEDES)
CREATE TABLE sedes (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sede VARCHAR(80) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL,
    capacidad_almacenamiento INT NOT NULL,
    encargado VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- 4. TABLA: productos (50 PRODUCTOS)
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_categoria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    volumen_ml INT NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 10,
    CONSTRAINT fk_prod_prov FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_prod_cat FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 5. TABLA INTERMEDIA: inventario_sedes (Relación N:M entre Productos y Sedes)
CREATE TABLE inventario_sedes (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    id_producto INT NOT NULL,
    stock_sede INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_inv_sede FOREIGN KEY (id_sede) REFERENCES sedes(id_sede) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_inv_prod FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6. TABLA: clientes (20 CLIENTES)
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(120) NOT NULL,
    identificacion VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 7. TABLA: pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT NOT NULL,
    id_sede INT NOT NULL,
    total_sin_iva DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    total_con_iva DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_ped_cli FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ped_sede FOREIGN KEY (id_sede) REFERENCES sedes(id_sede) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8. TABLA INTERMEDIA: detalle_pedido (Relación N:M entre Pedidos y Productos)
CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_det_ped FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_det_prod FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 9. TABLA DE AUDITORÍA: auditoria_precios
CREATE TABLE auditoria_precios (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    fecha_modificacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_aud_prod FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;