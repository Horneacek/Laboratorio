-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2025 a las 22:08:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laboratorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Solido'),
(2, 'Gas'),
(3, 'Liquido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles_peligro`
--

CREATE TABLE `niveles_peligro` (
  `id_peligro` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `niveles_peligro`
--

INSERT INTO `niveles_peligro` (`id_peligro`, `nombre`) VALUES
(1, 'Inflamable'),
(2, 'Toxicidad aguda'),
(3, 'Corrosivo'),
(4, 'Comburente'),
(5, 'Irritante'),
(6, 'Peligro para el medio ambiente acuático'),
(7, 'Peligro por aspiración'),
(8, 'Explosivos'),
(9, 'Gases a presión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pictogramas`
--

CREATE TABLE `pictogramas` (
  `id_pictograma` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `GHS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pictogramas`
--

INSERT INTO `pictogramas` (`id_pictograma`, `nombre`, `GHS`) VALUES
(1, 'sustancias explosivas', 'GHS01'),
(2, 'sustancias inflamables', 'GHS02'),
(3, 'sustancias oxidantes', 'GHS03'),
(4, 'gases a presion', 'GHS04'),
(5, 'sustancias corrosivas de metales, sustancias causticas', 'GHS05'),
(6, 'sustancias toxicas', 'GHS06'),
(7, 'sustancias irritantes', 'GHS07'),
(8, 'sustancias cancerigenas/mutagenicas', 'GHS08'),
(9, 'sustancias nocivas para el medio ambiente', 'GHS09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustancias`
--

CREATE TABLE `sustancias` (
  `id_sustacia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fds` varchar(255) NOT NULL,
  `codigo_qr` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sustancias`
--

INSERT INTO `sustancias` (`id_sustacia`, `nombre`, `fds`, `codigo_qr`, `estado`, `formula`, `id_usuario`) VALUES
(12, 'Dicromato de potasio', '', '../qr/qr12.png', 1, 'K₂Cr₂O₇', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustancia_peligro`
--

CREATE TABLE `sustancia_peligro` (
  `id_sustacia` int(11) DEFAULT NULL,
  `id_peligro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sustancia_peligro`
--

INSERT INTO `sustancia_peligro` (`id_sustacia`, `id_peligro`) VALUES
(12, 2),
(12, 3),
(12, 4),
(12, 6),
(12, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `admins` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contrasena`, `admins`) VALUES
(5, 'profesor', 'profe@gmail.com', '1', 1),
(10, 'admin', 'admin@gmail.com', '$2y$10$wUgGKKX396QpsjFvcb.8xOtuyqc9DB2GDFgpUpJvY8dQ420uXhloe', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `niveles_peligro`
--
ALTER TABLE `niveles_peligro`
  ADD PRIMARY KEY (`id_peligro`);

--
-- Indices de la tabla `pictogramas`
--
ALTER TABLE `pictogramas`
  ADD PRIMARY KEY (`id_pictograma`);

--
-- Indices de la tabla `sustancias`
--
ALTER TABLE `sustancias`
  ADD PRIMARY KEY (`id_sustacia`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `sustancia_peligro`
--
ALTER TABLE `sustancia_peligro`
  ADD KEY `id_peligro` (`id_peligro`),
  ADD KEY `sustancia_peligro_ibfk_1` (`id_sustacia`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles_peligro`
--
ALTER TABLE `niveles_peligro`
  MODIFY `id_peligro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pictogramas`
--
ALTER TABLE `pictogramas`
  MODIFY `id_pictograma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sustancias`
--
ALTER TABLE `sustancias`
  MODIFY `id_sustacia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sustancias`
--
ALTER TABLE `sustancias`
  ADD CONSTRAINT `sustancias_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `sustancias_ibfk_4` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `sustancia_peligro`
--
ALTER TABLE `sustancia_peligro`
  ADD CONSTRAINT `sustancia_peligro_ibfk_1` FOREIGN KEY (`id_sustacia`) REFERENCES `sustancias` (`id_sustacia`) ON DELETE CASCADE,
  ADD CONSTRAINT `sustancia_peligro_ibfk_2` FOREIGN KEY (`id_peligro`) REFERENCES `niveles_peligro` (`id_peligro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
