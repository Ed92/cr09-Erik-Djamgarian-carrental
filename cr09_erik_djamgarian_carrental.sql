-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Feb 2018 um 14:15
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_erik_djamgarian_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `damages` int(11) DEFAULT NULL,
  `fuel_level` int(11) DEFAULT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `damages`, `fuel_level`, `fk_return_location_id`) VALUES
(1, 3, 4, 1),
(2, 3, 1, 2),
(3, 1, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `model` varchar(85) DEFAULT NULL,
  `fuel_type` varchar(85) DEFAULT NULL,
  `license_plate` varchar(85) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `fk_starting_location_id` int(11) DEFAULT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_invoices_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `name`, `address`, `email`, `birthdate`, `fk_reservation_id`, `fk_car_id`, `fk_invoices_id`) VALUES
(1, 'John Doe', 'Pilgramgasse 4', 'JohnDoe@gmail.com', '1990-02-01', 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(85) DEFAULT NULL,
  `employee_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `employee_number`) VALUES
(1, 'Max Mustermann', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` int(11) DEFAULT NULL,
  `total_bill` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_additional_charges_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental_company`
--

CREATE TABLE `rental_company` (
  `rental_company_id` int(11) NOT NULL,
  `company_branch` varchar(85) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `select_cars` varchar(85) DEFAULT NULL,
  `under_23_insurance` varchar(85) DEFAULT NULL,
  `date_reserved` date DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_location`
--

CREATE TABLE `return_location` (
  `return_location_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `car_inspection` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `starting_location`
--

CREATE TABLE `starting_location` (
  `starting_location_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_returning_location` (`fk_return_location_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_starting_location_id` (`fk_starting_location_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_invoices_id` (`fk_invoices_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_additional_charges_id` (`fk_additional_charges_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `rental_company`
--
ALTER TABLE `rental_company`
  ADD PRIMARY KEY (`rental_company_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indizes für die Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_location_id`);

--
-- Indizes für die Tabelle `starting_location`
--
ALTER TABLE `starting_location`
  ADD PRIMARY KEY (`starting_location_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_return_location_id`) REFERENCES `additional_charges` (`additional_charges_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_starting_location_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_return_location_id`) REFERENCES `car` (`car_id`);

--
-- Constraints der Tabelle `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`fk_invoices_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints der Tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `invoices` (`invoice_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`fk_additional_charges_id`) REFERENCES `invoices` (`invoice_id`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Constraints der Tabelle `rental_company`
--
ALTER TABLE `rental_company`
  ADD CONSTRAINT `rental_company_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `rental_company_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `rental_company` (`rental_company_id`),
  ADD CONSTRAINT `rental_company_ibfk_3` FOREIGN KEY (`fk_reservation_id`) REFERENCES `rental_company` (`rental_company_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `starting_location`
--
ALTER TABLE `starting_location`
  ADD CONSTRAINT `starting_location_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `starting_location` (`starting_location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
