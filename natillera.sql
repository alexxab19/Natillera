-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2023 a las 18:14:28
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `natillera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `Id_Actividad` int(15) NOT NULL,
  `Nomb_Actividad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciclo` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`Id_Actividad`, `Nomb_Actividad`, `Ciclo`) VALUES
(1, 'Rifa', 'Trimestral'),
(2, 'Bingo', 'Trimestral'),
(3, 'Venta de comida', 'Trimestral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuota`
--

CREATE TABLE `cuota` (
  `Id_Cuota` int(15) NOT NULL,
  `Id_Socio` int(15) NOT NULL,
  `Id_Met_Pago` int(15) NOT NULL,
  `Id_Intereses` int(15) NOT NULL,
  `Fecha_Cuota` date NOT NULL,
  `Cuota_Dar` int(10) NOT NULL,
  `Cuota_TotalSum` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cuota`
--

INSERT INTO `cuota` (`Id_Cuota`, `Id_Socio`, `Id_Met_Pago`, `Id_Intereses`, `Fecha_Cuota`, `Cuota_Dar`, `Cuota_TotalSum`) VALUES
(1, 1, 2, 2, '2023-01-15', 50000, 53000),
(2, 2, 2, 1, '2023-01-15', 80000, 80000),
(3, 3, 1, 1, '2023-01-15', 100000, 100000),
(5, 4, 1, 3, '2023-01-15', 70000, 77000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intereses`
--

CREATE TABLE `intereses` (
  `Id_Interes` int(15) NOT NULL,
  `Tipo_Interes` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Tasa_Interes` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `intereses`
--

INSERT INTO `intereses` (`Id_Interes`, `Tipo_Interes`, `Tasa_Interes`) VALUES
(1, 'Normal', '0%'),
(2, 'Préstamo', '7%'),
(3, 'Retraso', '10%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `métodos_de_pago`
--

CREATE TABLE `métodos_de_pago` (
  `Id_Met_Pago` int(15) NOT NULL,
  `Nombre_Met_Pago` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `métodos_de_pago`
--

INSERT INTO `métodos_de_pago` (`Id_Met_Pago`, `Nombre_Met_Pago`) VALUES
(1, 'Transferencia'),
(2, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `Id_Socio` int(15) NOT NULL,
  `Nombres` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Barrio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`Id_Socio`, `Nombres`, `Apellidos`, `Telefono`, `Barrio`, `Direccion`, `Correo`, `Estado`) VALUES
(1, 'Christian Andrés', 'Acosta Cárdenas', '3244569874', 'La Avenida', 'Calle 69B #14', 'andres@gmail.com', 'Activo'),
(2, 'Alex', 'Ceballos Rios', '3232569874', 'Los Colores', 'Carrera 70 #10', 'alex@gmail.com', 'Activo'),
(3, 'Paola', 'Restrepo', '3072654542', 'Robledo', 'Calle #14', 'jpaola@gmail.com', 'Activo'),
(4, 'Alexa', 'Bedoya', '3059856475', 'Guayabal', 'Calle #50', 'alexa123@gmail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio_actividades`
--

CREATE TABLE `socio_actividades` (
  `Id_Socio` int(15) NOT NULL,
  `Id_Actividad` int(15) NOT NULL,
  `Fecha_Ini_Activ` date NOT NULL,
  `Fecha_Fin_Activ` date NOT NULL,
  `Ingreso_Activ` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `socio_actividades`
--

INSERT INTO `socio_actividades` (`Id_Socio`, `Id_Actividad`, `Fecha_Ini_Activ`, `Fecha_Fin_Activ`, `Ingreso_Activ`) VALUES
(1, 1, '2022-12-12', '2023-03-06', 20000),
(2, 1, '2022-12-12', '2023-03-06', 20000),
(3, 1, '2022-12-12', '2023-03-06', 20000),
(4, 1, '2022-12-12', '2023-03-06', 20000),
(1, 2, '2023-03-06', '2023-09-09', 15000),
(2, 2, '2023-03-06', '2023-09-09', 15000),
(3, 2, '2023-03-06', '2023-09-09', 15000),
(4, 2, '2023-03-06', '2023-09-09', 15000),
(1, 3, '2023-09-09', '2023-12-12', 40000),
(2, 3, '2023-09-09', '2023-12-12', 40000),
(3, 3, '2023-09-09', '2023-12-12', 40000),
(4, 3, '2023-09-09', '2023-12-12', 40000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`Id_Actividad`);

--
-- Indices de la tabla `cuota`
--
ALTER TABLE `cuota`
  ADD PRIMARY KEY (`Id_Cuota`),
  ADD KEY `Id_Socio` (`Id_Socio`),
  ADD KEY `Id_Met_Pago` (`Id_Met_Pago`),
  ADD KEY `Id_Intereses` (`Id_Intereses`);

--
-- Indices de la tabla `intereses`
--
ALTER TABLE `intereses`
  ADD PRIMARY KEY (`Id_Interes`);

--
-- Indices de la tabla `métodos_de_pago`
--
ALTER TABLE `métodos_de_pago`
  ADD PRIMARY KEY (`Id_Met_Pago`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`Id_Socio`);

--
-- Indices de la tabla `socio_actividades`
--
ALTER TABLE `socio_actividades`
  ADD KEY `Id_Socio` (`Id_Socio`),
  ADD KEY `Id_Actividad` (`Id_Actividad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `Id_Actividad` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuota`
--
ALTER TABLE `cuota`
  MODIFY `Id_Cuota` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `intereses`
--
ALTER TABLE `intereses`
  MODIFY `Id_Interes` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `métodos_de_pago`
--
ALTER TABLE `métodos_de_pago`
  MODIFY `Id_Met_Pago` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `Id_Socio` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuota`
--
ALTER TABLE `cuota`
  ADD CONSTRAINT `cuota_ibfk_1` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuota_ibfk_2` FOREIGN KEY (`Id_Met_Pago`) REFERENCES `métodos_de_pago` (`Id_Met_Pago`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuota_ibfk_3` FOREIGN KEY (`Id_Intereses`) REFERENCES `intereses` (`Id_Interes`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `socio_actividades`
--
ALTER TABLE `socio_actividades`
  ADD CONSTRAINT `socio_actividades_ibfk_2` FOREIGN KEY (`Id_Actividad`) REFERENCES `actividades` (`Id_Actividad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `socio_actividades_ibfk_3` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
