-- ============================================================
-- INSERCIÓN DE DATOS
-- ============================================================

-- CATEGORÍAS
INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Gaseosas Cola', 'Bebidas carbonatadas sabor cola'),
('Gaseosas Saborizadas', 'Bebidas carbonatadas con frutas y sabores varios'),
('Especialidades', 'Tónicas, Ginger Ale y mezcladores'),
('Aguas', 'Agua purificada y mineralizada'),
('Aguas Saborizadas', 'Aguas ligeras con extracto de fruta'),
('Tés y Bebidas Frías', 'Tés helados e infusiones frías'),
('Isotónicas', 'Bebidas rehidratantes para deportistas'),
('Energizantes', 'Bebidas de alto contenido estimulante'),
('Malta', 'Bebidas a base de cebada malteada'),
('Jugos y Néctares', 'Jugos procesados de frutas diversas');

-- PROVEEDORES
INSERT INTO proveedores (nombre_empresa, nit_proveedor, contacto_principal, telefono, correo_electronico) VALUES
('Embotelladora Central S.A.', '900123456-1', 'Carlos Mendoza', '5551-1001', 'ventas@embotelladoracentral.com'),
('Industrias de Bebidas del Caribe', '900234567-2', 'Sofía Guerrero', '5551-1002', 'contacto@caribebebidas.com'),
('Manantiales San Andrés', '900345678-3', 'Roberto Morales', '5551-1003', 'pedidos@sanandresagua.com'),
('Grupo Sabor Global', '900456789-4', 'Elena Rostran', '5551-1004', 'comercial@saborglobal.com');

-- SEDES (4 SEDES)
INSERT INTO sedes (nombre_sede, ubicacion, capacidad_almacenamiento, encargado) VALUES
('Sede Central - Zona 1', 'Av. Bolivar 12-45, Zona 1', 15000, 'Fernando Castillo'),
('Sede Norte - Industrial', 'Km 8.5 Carretera al Norte, Bodega 4', 22000, 'Claudia Sandoval'),
('Sede Sur - Pacifico', 'Calzada Aguilar Batres 34-10, Zona 11', 18000, 'Gustavo Rivas'),
('Sede Oriente - Metro', 'Anillo Periferico 05-88, Zona 17', 12000, 'Mariana Peralta');

-- PRODUCTOS (50 PRODUCTOS CON ID_CATEGORIA Y ID_PROVEEDOR)
INSERT INTO productos (id_proveedor, id_categoria, nombre, precio, volumen_ml, stock_actual, stock_minimo) VALUES
(1, 1, 'Cola Real Clásica 350ml', 0.65, 350, 1200, 200),
(1, 1, 'Cola Real Clásica 600ml', 1.10, 600, 850, 150),
(1, 1, 'Cola Real Clásica 1.5L', 2.30, 1500, 500, 100),
(1, 1, 'Cola Real Clásica 2.5L', 3.20, 2500, 420, 80),
(1, 1, 'Cola Real Zero 600ml', 1.20, 600, 300, 50),
(1, 1, 'Cola Real Zero 1.5L', 2.45, 1500, 180, 40),
(1, 2, 'Citrus Fizz Limón 350ml', 0.60, 350, 950, 150),
(1, 2, 'Citrus Fizz Limón 1.5L', 2.10, 1500, 310, 60),
(1, 2, 'Citrus Fizz Naranja 350ml', 0.60, 350, 1100, 150),
(1, 2, 'Citrus Fizz Naranja 2.0L', 2.80, 2000, 240, 50),

(2, 2, 'TropiUva Burbujeante 350ml', 0.70, 350, 600, 100),
(2, 2, 'TropiUva Burbujeante 1.5L', 2.25, 1500, 290, 50),
(2, 2, 'Klass Fresa Spark 350ml', 0.65, 350, 800, 120),
(2, 2, 'Klass Fresa Spark 2.5L', 3.10, 2500, 150, 40),
(2, 2, 'Golden Toronja 500ml', 0.95, 500, 400, 80),
(2, 2, 'Golden Toronja 1.5L', 2.15, 1500, 80, 100),
(2, 3, 'Ginger Ale Botánica 300ml', 1.35, 300, 250, 50),
(2, 3, 'Ginger Ale Botánica 1.0L', 2.90, 1000, 120, 30),
(2, 3, 'Agua Tónica Premium 300ml', 1.40, 300, 310, 60),
(2, 3, 'Agua Tónica Premium 1.0L', 3.00, 1000, 90, 25),

(3, 4, 'Agua Pura Cristalina 500ml', 0.40, 500, 3500, 500),
(3, 4, 'Agua Pura Cristalina 1.0L', 0.75, 1000, 2100, 300),
(3, 4, 'Agua Pura Cristalina 5.0L', 2.00, 5000, 800, 150),
(3, 4, 'Agua Pura Cristalina Garrafón 19L', 4.50, 19000, 450, 100),
(3, 4, 'Agua Mineral Con Gas 400ml', 0.80, 400, 1200, 200),
(3, 4, 'Agua Mineral Con Gas 1.5L', 1.95, 1500, 530, 90),
(3, 5, 'Seltz Manzana Verde 500ml', 0.90, 500, 640, 100),
(3, 5, 'Seltz Frutos Rojos 500ml', 0.90, 500, 45, 100),
(3, 5, 'Seltz Lima Limón 500ml', 0.90, 500, 520, 100),
(3, 5, 'Seltz Maracuyá 500ml', 0.90, 500, 330, 80),

(4, 6, 'Té Helado Durazno 450ml', 1.15, 450, 900, 150),
(4, 6, 'Té Helado Durazno 1.5L', 2.60, 1500, 210, 50),
(4, 6, 'Té Helado Limón 450ml', 1.15, 450, 1100, 150),
(4, 6, 'Té Helado Limón 1.5L', 2.60, 1500, 340, 50),
(4, 6, 'Té Verde con Miel 450ml', 1.30, 450, 480, 80),
(4, 7, 'PowerX Electrolitos Azul 500ml', 1.40, 500, 1500, 200),
(4, 7, 'PowerX Electrolitos Rojo 500ml', 1.40, 500, 1300, 200),
(4, 7, 'PowerX Electrolitos Naranja 500ml', 1.40, 500, 25, 200),
(4, 7, 'PowerX Electrolitos Uva 500ml', 1.40, 500, 870, 150),
(4, 8, 'Nitro Energy Shot 250ml', 1.85, 250, 2000, 300),

(1, 8, 'Nitro Energy XL 473ml', 2.50, 473, 1100, 200),
(1, 8, 'Nitro Energy Zero 473ml', 2.60, 473, 620, 100),
(2, 9, 'Malta Vital Nutritiva 330ml', 0.85, 330, 1400, 250),
(2, 9, 'Malta Vital Nutritiva 1.0L', 2.00, 1000, 380, 80),
(3, 10, 'Jugos del Valle Manzana 300ml', 0.95, 300, 800, 120),
(3, 10, 'Jugos del Valle Naranja 300ml', 0.95, 300, 920, 120),
(3, 10, 'Jugos del Valle Pera 300ml', 0.95, 300, 15, 120),
(4, 10, 'Néctar de Melocotón 1.0L', 2.20, 1000, 410, 60),
(4, 10, 'Néctar de Mango 1.0L', 2.20, 1000, 390, 60),
(4, 10, 'Néctar de Piña 1.0L', 2.20, 1000, 500, 60);

-- CLIENTES (20 CLIENTES)
INSERT INTO clientes (nombre_completo, identificacion, direccion, telefono, correo_electronico) VALUES
('Abarrotería El Carmelo', 'CIT-10001', 'Calle Principal 4-12, Zona 3', '4123-0001', 'elcarmelo@gmail.com'),
('Supermercado San José', 'CIT-10002', 'Diagonal 6 11-20, Zona 10', '4123-0002', 'compras@sanjosesuper.com'),
('Depósito de Bebidas La Bendición', 'CIT-10003', 'Av. Petapa 28-00, Zona 12', '4123-0003', 'labendicion@hotmail.com'),
('Comercial Don Pepe', 'CIT-10004', 'Calle Los Almendros 5-88', '4123-0004', 'donpepe_ventas@outlook.com'),
('Tienda La Gran Esquina', 'CIT-10005', '1ra Calle 3-15, Zona 1', '4123-0005', 'lagranesquina@yahoo.com'),
('Restaurante El Patio', 'CIT-10006', 'Calzada Roosevelth 14-22', '4123-0006', 'contacto@elpatiorest.com'),
('Minimarket Express Norte', 'CIT-10007', 'Boulevard Los Próceres 18-90', '4123-0007', 'expressnorte@gmail.com'),
('Distribuidora Los Hermanos', 'CIT-10008', '5ta Avenida 12-01, Zona 9', '4123-0008', 'loshermanos_dist@gmail.com'),
('Hotel y Restaurante El Mirador', 'CIT-10009', 'Carretera Interamericana Km 25', '4123-0009', 'recepcion@elmirador.com'),
('Abarrotes Santa Lucía', 'CIT-10010', 'Calle Real 8-40, San Lucía', '4123-0010', 'santalucia_ab@gmail.com'),
('Cafetería Central', 'CIT-10011', '6ta Avenida 9-11, Zona 1', '4123-0011', 'cafeteriacentral@outlook.com'),
('Super Tienda La Victoria', 'CIT-10012', 'Av. San Juan 15-30, Zona 7', '4123-0012', 'lavictoriasuper@gmail.com'),
('Estación de Servicio La Florida', 'CIT-10013', 'Anillo Periférico 2-45', '4123-0013', 'servicios_laflorida@gmail.com'),
('Despensa Don Beto', 'CIT-10014', '3ra Calle 7-80, Zona 5', '4123-0014', 'despensadonbeto@gmail.com'),
('Heladería Nieve Natural', 'CIT-10015', 'Plaza Comercial El Sol Loc. 4', '4123-0015', 'nievenatural@yahoo.com'),
('Servicios Turísticos El Dorado', 'CIT-10016', 'Calle del Arco No. 12', '4123-0016', 'eldorado_turismo@gmail.com'),
('Variedades Yazmín', 'CIT-10017', 'Boulevard San Cristóbal 8-10', '4123-0017', 'yazmin_variedades@hotmail.com'),
('Comercializadora El Triunfo', 'CIT-10018', 'Calzada Atanasio Tzul 40-00', '4123-0018', 'ventas@eltriunfo.com'),
('Tienda El Rosarito', 'CIT-10019', '2da Avenida 4-50, Zona 2', '4123-0019', 'elrosarito_tienda@gmail.com'),
('Supermercado La Económica', 'CIT-10020', 'Diagonal 15 22-00, Zona 13', '4123-0020', 'compras@laeconomica.com');

-- INVENTARIO POR SEDE (Muestra del stock distribuido)
INSERT INTO inventario_sedes (id_sede, id_producto, stock_sede) VALUES
(1, 1, 300), (2, 1, 400), (3, 1, 300), (4, 1, 200),
(1, 21, 1000), (2, 21, 1500), (3, 21, 500), (4, 21, 500);

-- PEDIDOS
INSERT INTO pedidos (fecha_pedido, id_cliente, id_sede, total_sin_iva, total_con_iva) VALUES
('2026-02-01 09:30:00', 1, 1, 130.00, 154.70),
('2026-02-03 11:15:00', 2, 2, 450.00, 535.50),
('2026-02-05 14:00:00', 3, 1, 85.00, 101.15),
('2026-02-10 10:45:00', 1, 3, 210.00, 249.90),
('2026-02-12 16:20:00', 5, 4, 340.00, 404.60);

-- DETALLE DE PEDIDO
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 100, 0.65, 65.00),
(1, 2, 50, 1.10, 55.00),
(2, 21, 500, 0.40, 200.00),
(2, 36, 150, 1.40, 210.00),
(3, 7, 100, 0.60, 60.00);