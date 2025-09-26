CREATE TABLE `Sucursal` (
  `id_sucursal` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50),
  `direccion` VARCHAR(100),
  `telefono` CHAR(9)
);

CREATE TABLE `Empleado` (
  `id_empleado` INT PRIMARY KEY AUTO_INCREMENT,
  `nombres` VARCHAR(50),
  `apellidos` VARCHAR(50),
  `dni` CHAR(8) UNIQUE,
  `cargo` VARCHAR(30),
  `sueldo` DECIMAL(8,2),
  `id_sucursal` INT
);

CREATE TABLE `Cliente` (
  `id_cliente` INT PRIMARY KEY AUTO_INCREMENT,
  `nombres` VARCHAR(50),
  `apellidos` VARCHAR(50),
  `dni` CHAR(8) UNIQUE,
  `telefono` CHAR(9),
  `email` VARCHAR(50)
);

CREATE TABLE `Categoria` (
  `id_categoria` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50)
);

CREATE TABLE `Producto` (
  `id_producto` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100),
  `precio_unitario` DECIMAL(10,2),
  `stock` INT,
  `id_categoria` INT
);

CREATE TABLE `Venta` (
  `id_venta` INT PRIMARY KEY AUTO_INCREMENT,
  `fecha` DATE,
  `total` DECIMAL(10,2),
  `id_cliente` INT,
  `id_empleado` INT,
  `id_sucursal` INT
);

CREATE TABLE `Detalle_Venta` (
  `id_venta` INT,
  `id_producto` INT,
  `cantidad` INT,
  `subtotal` DECIMAL(10,2),
  PRIMARY KEY (`id_venta`, `id_producto`)
);

ALTER TABLE `Empleado` ADD FOREIGN KEY (`id_sucursal`) REFERENCES `Sucursal` (`id_sucursal`);

ALTER TABLE `Producto` ADD FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`);

ALTER TABLE `Venta` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`);

ALTER TABLE `Venta` ADD FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id_empleado`);

ALTER TABLE `Venta` ADD FOREIGN KEY (`id_sucursal`) REFERENCES `Sucursal` (`id_sucursal`);

ALTER TABLE `Detalle_Venta` ADD FOREIGN KEY (`id_venta`) REFERENCES `Venta` (`id_venta`);

ALTER TABLE `Detalle_Venta` ADD FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`);

ALTER TABLE `Cliente` ADD FOREIGN KEY (`apellidos`) REFERENCES `Empleado` (`apellidos`);
