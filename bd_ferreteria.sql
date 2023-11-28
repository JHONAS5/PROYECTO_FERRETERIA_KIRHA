/*
 Navicat Premium Data Transfer

 Source Server         : CONECCIONES
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : bd_ferreteria

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 26/11/2023 22:32:10
*/

CREATE DATABASE bd_ferreteria;
USE bd_ferreteria;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (2, 'Acero');
INSERT INTO `categorias` VALUES (3, 'Fontaneria y sistemas de agua');
INSERT INTO `categorias` VALUES (4, 'Herramientas manuales');
INSERT INTO `categorias` VALUES (5, 'Herramientas electricas');
INSERT INTO `categorias` VALUES (6, 'Equipos de proteccion personal');
INSERT INTO `categorias` VALUES (7, 'Cerrajeria y seguridad');
INSERT INTO `categorias` VALUES (8, 'Pinturas y acabados');
INSERT INTO `categorias` VALUES (9, 'Adhesivos y selladores');
INSERT INTO `categorias` VALUES (10, 'Articulos de limpieza y mantenimiento');
INSERT INTO `categorias` VALUES (11, 'Ferreteria de carpinteria');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `apellido_cli` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Garcia');
INSERT INTO `clientes` VALUES (2, 'Rodriguez');
INSERT INTO `clientes` VALUES (3, 'Lopez');
INSERT INTO `clientes` VALUES (4, 'Martinez');
INSERT INTO `clientes` VALUES (5, 'Gonzalez');
INSERT INTO `clientes` VALUES (6, 'Perez');
INSERT INTO `clientes` VALUES (7, 'Sanchez');
INSERT INTO `clientes` VALUES (8, 'Romero');
INSERT INTO `clientes` VALUES (9, 'Torres');
INSERT INTO `clientes` VALUES (10, 'Flores');
INSERT INTO `clientes` VALUES (11, 'Ramirez');
INSERT INTO `clientes` VALUES (12, 'Vargas');
INSERT INTO `clientes` VALUES (13, 'Herrera');

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_emp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ci` int NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (1, 'Jhonatan', 9541812, 'Av. Juan pablo', 'Vendedor');
INSERT INTO `empleados` VALUES (2, 'Karen', 9834575, 'Av. Libertades', 'Vendedor');
INSERT INTO `empleados` VALUES (3, 'Jhuli', 978732, 'Calle: Alto Lima', 'Administrador');

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `monto_total` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT current_timestamp,
  `cliente_id` int NULL DEFAULT NULL,
  `empleado_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`) USING BTREE,
  INDEX `cliente_id`(`cliente_id` ASC) USING BTREE,
  INDEX `empleado_id`(`empleado_id` ASC) USING BTREE,
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO `pedidos` VALUES (1, 150, '2023-11-26 20:48:25', 4, 1);
INSERT INTO `pedidos` VALUES (2, 500, '2023-11-26 20:56:37', 7, 2);
INSERT INTO `pedidos` VALUES (3, 200, '2023-11-26 21:21:55', 12, 1);

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precio` int NULL DEFAULT NULL,
  `disponible` int NULL DEFAULT NULL,
  `categoria_id` int NULL DEFAULT NULL,
  `proveedor_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  INDEX `categoria_id`(`categoria_id` ASC) USING BTREE,
  INDEX `proveedor_id`(`proveedor_id` ASC) USING BTREE,
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Currugado 1/2', 20, 1, 2, 1);
INSERT INTO `productos` VALUES (2, 'Currugado 3/4', 25, 1, 2, 1);
INSERT INTO `productos` VALUES (3, 'Currugado 1/4', 15, 1, 2, 1);
INSERT INTO `productos` VALUES (4, 'Currugado Ele 3/4', 100, 1, 5, 4);
INSERT INTO `productos` VALUES (5, 'Bomba de agua', 200, 0, 3, 3);
INSERT INTO `productos` VALUES (6, 'Cisterna para WC', 100, 1, 3, 3);
INSERT INTO `productos` VALUES (7, 'Tubo de PVC', 20, 1, 3, 3);
INSERT INTO `productos` VALUES (8, 'Filtro de agua', 40, 1, 3, 3);
INSERT INTO `productos` VALUES (9, 'Destornilladores', 10, 1, 4, 5);
INSERT INTO `productos` VALUES (10, 'Martillo', 50, 1, 4, 5);
INSERT INTO `productos` VALUES (11, 'Alicates', 25, 1, 4, 5);
INSERT INTO `productos` VALUES (12, 'Llave inglesa', 100, 1, 4, 5);
INSERT INTO `productos` VALUES (13, 'Sierra circular', 1200, 1, 5, 4);
INSERT INTO `productos` VALUES (14, 'Lijadora elÃ©ctrica', 560, 0, 5, 4);

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_prov` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telefono` int NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'Ruben Alanoca', 67551231, 'Av. Libertades');
INSERT INTO `proveedores` VALUES (2, 'Marco Vila', 67551278, 'Av. Liberta');
INSERT INTO `proveedores` VALUES (3, 'Alejandro Vargas', 68435424, 'Av. 20 de Noviembre');
INSERT INTO `proveedores` VALUES (4, 'Sofia Torres', 72357235, 'AV. 5 de Mayo');
INSERT INTO `proveedores` VALUES (5, 'Juan Herrera', 76452421, 'AV. Arce');
INSERT INTO `proveedores` VALUES (6, 'Valentina Morales', 74525434, 'AV. Mariscal Santa Cruz');
INSERT INTO `proveedores` VALUES (7, 'Gabriel Romero', 68435182, 'AV. 6 de Agosto');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `id_ventas` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NULL DEFAULT NULL,
  `producto_id` int NULL DEFAULT NULL,
  `pedido_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_ventas`) USING BTREE,
  INDEX `producto_id`(`producto_id` ASC) USING BTREE,
  INDEX `pedido_id`(`pedido_id` ASC) USING BTREE,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES (1, 2, 7, 1);
INSERT INTO `ventas` VALUES (2, 4, 5, 1);
INSERT INTO `ventas` VALUES (3, 20, 1, 2);
INSERT INTO `ventas` VALUES (4, 15, 2, 2);
INSERT INTO `ventas` VALUES (5, 1, 4, 3);
INSERT INTO `ventas` VALUES (6, 3, 11, 3);
INSERT INTO `ventas` VALUES (7, 1, 13, 3);
INSERT INTO `ventas` VALUES (8, 1, 14, 3);

SET FOREIGN_KEY_CHECKS = 1;
