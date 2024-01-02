-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 02 Sty 2024, 13:18
-- Wersja serwera: 10.7.3-MariaDB
-- Wersja PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `domek`
--
CREATE DATABASE IF NOT EXISTS `domek` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `domek`;

DELIMITER $$
--
-- Procedury
--
DROP PROCEDURE IF EXISTS `add_state`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_state` (`inputs_00` BIT(8), `inputs_01` BIT(8), `inputs_02` BIT(8), `inputs_03` BIT(8), `inputs_04` BIT(8), `inputs_05` BIT(8), `inputs_06` BIT(8), `inputs_07` BIT(8), `inputs_08` BIT(8), `inputs_09` BIT(8), `inputs_10` BIT(8), `inputs_11` BIT(8), `inputs_12` BIT(8), `inputs_13` BIT(8), `inputs_14` BIT(8), `inputs_15` BIT(8), `inputs_16` BIT(8), `inputs_17` BIT(8), `inputs_18` BIT(8), `inputs_19` BIT(8), `inputs_20` BIT(8), `inputs_21` BIT(8), `outputs_00` BIT(8), `outputs_01` BIT(8), `outputs_02` BIT(8), `outputs_03` BIT(8), `outputs_04` BIT(8), `outputs_05` BIT(8), `outputs_06` BIT(8), `outputs_07` BIT(8), `outputs_08` BIT(8), `outputs_09` BIT(8), `outputs_10` BIT(8), `outputs_11` BIT(8), `outputs_12` BIT(8), `outputs_13` BIT(8), `outputs_14` BIT(8), `outputs_15` BIT(8), `outputs_16` BIT(8), `outputs_17` BIT(8), `outputs_18` BIT(8), `outputs_19` BIT(8), `outputs_20` BIT(8), `outputs_21` BIT(8), `pressure_00` DECIMAL(5,1), `rain_00` DECIMAL(4,1), `light_level_00` DECIMAL(4,1), `light_level_01` DECIMAL(4,1), `temperature_00` DECIMAL(4,1), `temperature_01` DECIMAL(4,1), `temperature_02` DECIMAL(4,1), `temperature_03` DECIMAL(4,1), `temperature_04` DECIMAL(4,1), `temperature_05` DECIMAL(4,1), `temperature_06` DECIMAL(4,1), `temperature_07` DECIMAL(4,1), `temperature_08` DECIMAL(4,1), `temperature_09` DECIMAL(4,1), `temperature_10` DECIMAL(4,1), `temperature_11` DECIMAL(4,1), `temperature_12` DECIMAL(4,1), `temperature_13` DECIMAL(4,1), `temperature_14` DECIMAL(4,1), `temperature_15` DECIMAL(4,1), `temperature_16` DECIMAL(4,1), `temperature_17` DECIMAL(4,1), `temperature_18` DECIMAL(4,1), `temperature_19` DECIMAL(4,1), `temperature_20` DECIMAL(4,1), `temperature_21` DECIMAL(4,1), `temperature_22` DECIMAL(4,1), `temperature_23` DECIMAL(4,1), `temperature_24` DECIMAL(4,1), `temperature_25` DECIMAL(4,1), `temperature_26` DECIMAL(4,1), `temperature_27` DECIMAL(4,1), `temperature_28` DECIMAL(4,1), `temperature_29` DECIMAL(4,1), `temperature_30` DECIMAL(4,1), `temperature_31` DECIMAL(4,1), `temperature_32` DECIMAL(4,1), `temperature_33` DECIMAL(4,1), `temperature_34` DECIMAL(4,1), `temperature_35` DECIMAL(4,1), `temperature_36` DECIMAL(4,1), `temperature_37` DECIMAL(4,1), `temperature_38` DECIMAL(4,1), `temperature_39` DECIMAL(4,1), `temperature_40` DECIMAL(4,1), `temperature_41` DECIMAL(4,1), `temperature_42` DECIMAL(4,1), `temperature_43` DECIMAL(4,1), `temperature_44` DECIMAL(4,1), `temperature_45` DECIMAL(4,1), `temperature_46` DECIMAL(4,1), `temperature_47` DECIMAL(4,1), `temperature_48` DECIMAL(4,1), `temperature_49` DECIMAL(4,1), `temperature_50` DECIMAL(4,1), `temperature_51` DECIMAL(4,1), `temperature_52` DECIMAL(4,1), `temperature_53` DECIMAL(4,1), `temperature_54` DECIMAL(4,1), `temperature_55` DECIMAL(4,1), `temperature_56` DECIMAL(4,1), `temperature_57` DECIMAL(4,1), `temperature_58` DECIMAL(4,1), `temperature_59` DECIMAL(4,1), `temperature_60` DECIMAL(4,1), `temperature_61` DECIMAL(4,1), `temperature_62` DECIMAL(4,1), `temperature_63` DECIMAL(4,1), `humidity_00` DECIMAL(4,1), `humidity_01` DECIMAL(4,1), `humidity_02` DECIMAL(4,1), `humidity_03` DECIMAL(4,1), `humidity_04` DECIMAL(4,1), `humidity_05` DECIMAL(4,1), `humidity_06` DECIMAL(4,1), `humidity_07` DECIMAL(4,1), `energy_meter_00` FLOAT, `energy_meter_01` FLOAT, `energy_meter_02` FLOAT, `energy_meter_03` FLOAT, `energy_meter_04` FLOAT, `energy_meter_05` FLOAT, `energy_meter_06` FLOAT, `energy_meter_07` FLOAT, `water_meter_00` FLOAT, `fuel_level_00` FLOAT, `heater_state` TINYINT UNSIGNED, `smoke_level_00` DECIMAL(4,1), `smoke_level_01` DECIMAL(4,1), `smoke_level_02` DECIMAL(4,1), `smoke_level_03` DECIMAL(4,1), `pressure_level_00` DECIMAL(4,2), `pressure_level_01` DECIMAL(4,2), `pressure_level_02` DECIMAL(4,2), `pressure_level_03` DECIMAL(4,2), `external_inputs_00` BIT(8), `external_inputs_01` BIT(8), `external_inputs_02` BIT(8), `external_inputs_03` BIT(8), `sensors_active_00` BIT(8), `last_movement_00` SMALLINT UNSIGNED, `last_movement_01` SMALLINT UNSIGNED, `last_movement_02` SMALLINT UNSIGNED, `last_movement_03` SMALLINT UNSIGNED, `last_movement_04` SMALLINT UNSIGNED, `last_movement_05` SMALLINT UNSIGNED, `last_movement_06` SMALLINT UNSIGNED, `last_movement_07` SMALLINT UNSIGNED, `last_movement_08` SMALLINT UNSIGNED, `last_movement_09` SMALLINT UNSIGNED, `last_movement_10` SMALLINT UNSIGNED, `last_movement_11` SMALLINT UNSIGNED, `last_movement_12` SMALLINT UNSIGNED, `last_movement_13` SMALLINT UNSIGNED, `last_movement_14` SMALLINT UNSIGNED, `last_movement_15` SMALLINT UNSIGNED, `last_movement_16` SMALLINT UNSIGNED, `last_movement_17` SMALLINT UNSIGNED, `last_movement_18` SMALLINT UNSIGNED, `last_movement_19` SMALLINT UNSIGNED, `last_movement_20` SMALLINT UNSIGNED, `last_movement_21` SMALLINT UNSIGNED, `last_movement_22` SMALLINT UNSIGNED, `last_movement_23` SMALLINT UNSIGNED, `last_movement_24` SMALLINT UNSIGNED, `last_movement_25` SMALLINT UNSIGNED, `overcurrent_protection_00` BIT(8), `overcurrent_protection_01` BIT(8), `overcurrent_protection_02` BIT(8), `leds_00` TINYINT UNSIGNED, `leds_01` TINYINT UNSIGNED, `leds_02` TINYINT UNSIGNED, `leds_03` TINYINT UNSIGNED, `leds_04` TINYINT UNSIGNED, `leds_05` TINYINT UNSIGNED, `leds_06` TINYINT UNSIGNED, `leds_07` TINYINT UNSIGNED, `leds_08` TINYINT UNSIGNED, `leds_09` TINYINT UNSIGNED, `leds_10` TINYINT UNSIGNED, `leds_11` TINYINT UNSIGNED, `leds_12` TINYINT UNSIGNED, `leds_13` TINYINT UNSIGNED, `leds_14` TINYINT UNSIGNED, `leds_15` TINYINT UNSIGNED)   BEGIN
	DECLARE is_first_in_min bool;
    DECLARE is_first_in_hour bool;
    
    SET @is_first_in_min = false;
    SET @is_first_in_hour = false;
    
    (
		SELECT 
			@is_first_in_min := NOT (DATE_FORMAT((`date`), '%Y/%m/%d %H:%i') = DATE_FORMAT(NOW(), '%Y/%m/%d %H:%i')),
			@is_first_in_hour := NOT (DATE_FORMAT((`date`), '%Y/%m/%d %H') = DATE_FORMAT(NOW(), '%Y/%m/%d %H'))
		FROM 
			state
		ORDER BY 
			`date` DESC
		LIMIT 1);
        INSERT INTO state (`date`, `date_stamp`, `minute_tick`, `hour_tick`, `inputs_00`, 
`inputs_01`, 
`inputs_02`, 
`inputs_03`, 
`inputs_04`, 
`inputs_05`, 
`inputs_06`, 
`inputs_07`, 
`inputs_08`, 
`inputs_09`, 
`inputs_10`, 
`inputs_11`, 
`inputs_12`, 
`inputs_13`, 
`inputs_14`, 
`inputs_15`, 
`inputs_16`, 
`inputs_17`, 
`inputs_18`, 
`inputs_19`, 
`inputs_20`, 
`inputs_21`, 
`outputs_00`, 
`outputs_01`, 
`outputs_02`, 
`outputs_03`, 
`outputs_04`, 
`outputs_05`, 
`outputs_06`, 
`outputs_07`, 
`outputs_08`, 
`outputs_09`, 
`outputs_10`, 
`outputs_11`, 
`outputs_12`, 
`outputs_13`, 
`outputs_14`, 
`outputs_15`, 
`outputs_16`, 
`outputs_17`, 
`outputs_18`, 
`outputs_19`, 
`outputs_20`, 
`outputs_21`, 
`pressure_00`, 
`rain_00`, 
`light_level_00`, 
`light_level_01`, 
`temperature_00`, 
`temperature_01`, 
`temperature_02`, 
`temperature_03`, 
`temperature_04`, 
`temperature_05`, 
`temperature_06`, 
`temperature_07`, 
`temperature_08`, 
`temperature_09`, 
`temperature_10`, 
`temperature_11`, 
`temperature_12`, 
`temperature_13`, 
`temperature_14`, 
`temperature_15`, 
`temperature_16`, 
`temperature_17`, 
`temperature_18`, 
`temperature_19`, 
`temperature_20`, 
`temperature_21`, 
`temperature_22`, 
`temperature_23`, 
`temperature_24`, 
`temperature_25`, 
`temperature_26`, 
`temperature_27`, 
`temperature_28`, 
`temperature_29`, 
`temperature_30`, 
`temperature_31`, 
`temperature_32`, 
`temperature_33`, 
`temperature_34`, 
`temperature_35`, 
`temperature_36`, 
`temperature_37`, 
`temperature_38`, 
`temperature_39`, 
`temperature_40`, 
`temperature_41`, 
`temperature_42`, 
`temperature_43`, 
`temperature_44`, 
`temperature_45`, 
`temperature_46`, 
`temperature_47`, 
`temperature_48`, 
`temperature_49`, 
`temperature_50`,  
`temperature_51`,  
`temperature_52`,  
`temperature_53`,  
`temperature_54`,  
`temperature_55`,  
`temperature_56`,  
`temperature_57`,  
`temperature_58`,  
`temperature_59`,  
`temperature_60`,  
`temperature_61`,  
`temperature_62`,  
`temperature_63`, 
`humidity_00`, 
`humidity_01`, 
`humidity_02`, 
`humidity_03`, 
`humidity_04`, 
`humidity_05`, 
`humidity_06`, 
`humidity_07`, 
`energy_meter_00`, 
`energy_meter_01`, 
`energy_meter_02`, 
`energy_meter_03`, 
`energy_meter_04`, 
`energy_meter_05`, 
`energy_meter_06`, 
`energy_meter_07`, 
`water_meter_00`, 
`fuel_level_00`, 
`heater_state`, 
`smoke_level_00`, 
`smoke_level_01`, 
`smoke_level_02`, 
`smoke_level_03`, 
`pressure_level_00`, 
`pressure_level_01`, 
`pressure_level_02`, 
`pressure_level_03`, 
`external_inputs_00`, 
`external_inputs_01`, 
`external_inputs_02`, 
`external_inputs_03`, 
`sensors_active_00`, 
`last_movement_00`, 
`last_movement_01`, 
`last_movement_02`, 
`last_movement_03`, 
`last_movement_04`, 
`last_movement_05`, 
`last_movement_06`, 
`last_movement_07`, 
`last_movement_08`, 
`last_movement_09`, 
`last_movement_10`, 
`last_movement_11`, 
`last_movement_12`, 
`last_movement_13`, 
`last_movement_14`, 
`last_movement_15`, 
`last_movement_16`, 
`last_movement_17`, 
`last_movement_18`, 
`last_movement_19`, 
`last_movement_20`, 
`last_movement_21`, 
`last_movement_22`, 
`last_movement_23`, 
`last_movement_24`, 
`last_movement_25`, 
`overcurrent_protection_00`, 
`overcurrent_protection_01`, 
`overcurrent_protection_02`, 
`leds_00`, 
`leds_01`, 
`leds_02`, 
`leds_03`, 
`leds_04`, 
`leds_05`, 
`leds_06`, 
`leds_07`, 
`leds_08`, 
`leds_09`, 
`leds_10`, 
`leds_11`, 
`leds_12`, 
`leds_13`, 
`leds_14`, 
`leds_15`) VALUES (NOW(), CURDATE(), @is_first_in_min, @is_first_in_hour, inputs_00, 
inputs_01, 
inputs_02, 
inputs_03, 
inputs_04, 
inputs_05, 
inputs_06, 
inputs_07, 
inputs_08, 
inputs_09, 
inputs_10, 
inputs_11, 
inputs_12, 
inputs_13, 
inputs_14, 
inputs_15, 
inputs_16, 
inputs_17, 
inputs_18, 
inputs_19, 
inputs_20, 
inputs_21, 
outputs_00, 
outputs_01, 
outputs_02, 
outputs_03, 
outputs_04, 
outputs_05, 
outputs_06, 
outputs_07, 
outputs_08, 
outputs_09, 
outputs_10, 
outputs_11, 
outputs_12, 
outputs_13, 
outputs_14, 
outputs_15, 
outputs_16, 
outputs_17, 
outputs_18, 
outputs_19, 
outputs_20, 
outputs_21, 
pressure_00, 
rain_00, 
light_level_00, 
light_level_01, 
temperature_00, 
temperature_01, 
temperature_02, 
temperature_03, 
temperature_04, 
temperature_05, 
temperature_06, 
temperature_07, 
temperature_08, 
temperature_09, 
temperature_10, 
temperature_11, 
temperature_12, 
temperature_13, 
temperature_14, 
temperature_15, 
temperature_16, 
temperature_17, 
temperature_18, 
temperature_19, 
temperature_20, 
temperature_21, 
temperature_22, 
temperature_23, 
temperature_24, 
temperature_25, 
temperature_26, 
temperature_27, 
temperature_28, 
temperature_29, 
temperature_30, 
temperature_31, 
temperature_32, 
temperature_33, 
temperature_34, 
temperature_35, 
temperature_36, 
temperature_37, 
temperature_38, 
temperature_39, 
temperature_40, 
temperature_41, 
temperature_42, 
temperature_43, 
temperature_44, 
temperature_45, 
temperature_46, 
temperature_47, 
temperature_48, 
temperature_49, 
temperature_50,  
temperature_51,  
temperature_52,  
temperature_53,  
temperature_54,  
temperature_55,  
temperature_56,  
temperature_57,  
temperature_58,  
temperature_59,  
temperature_60,  
temperature_61,  
temperature_62,  
temperature_63, 
humidity_00, 
humidity_01, 
humidity_02, 
humidity_03, 
humidity_04, 
humidity_05, 
humidity_06, 
humidity_07, 
energy_meter_00, 
energy_meter_01, 
energy_meter_02, 
energy_meter_03, 
energy_meter_04, 
energy_meter_05, 
energy_meter_06, 
energy_meter_07, 
water_meter_00,
fuel_level_00, 
heater_state, 
smoke_level_00, 
smoke_level_01, 
smoke_level_02, 
smoke_level_03, 
pressure_level_00, 
pressure_level_01, 
pressure_level_02, 
pressure_level_03, 
external_inputs_00, 
external_inputs_01, 
external_inputs_02, 
external_inputs_03, 
sensors_active_00, 
last_movement_00, 
last_movement_01, 
last_movement_02, 
last_movement_03, 
last_movement_04, 
last_movement_05, 
last_movement_06, 
last_movement_07, 
last_movement_08, 
last_movement_09, 
last_movement_10, 
last_movement_11, 
last_movement_12, 
last_movement_13, 
last_movement_14, 
last_movement_15, 
last_movement_16, 
last_movement_17, 
last_movement_18, 
last_movement_19, 
last_movement_20, 
last_movement_21, 
last_movement_22, 
last_movement_23, 
last_movement_24, 
last_movement_25, 
overcurrent_protection_00, 
overcurrent_protection_01, 
overcurrent_protection_02, 
leds_00, 
leds_01, 
leds_02, 
leds_03, 
leds_04, 
leds_05, 
leds_06, 
leds_07, 
leds_08, 
leds_09, 
leds_10, 
leds_11, 
leds_12, 
leds_13, 
leds_14, 
leds_15);

END$$

DROP PROCEDURE IF EXISTS `clear_seconds_data`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clear_seconds_data` ()   BEGIN
	DELETE FROM
		`state`
	WHERE
		NOT `minute_tick` AND NOT `hour_tick` AND SUBDATE(NOW(), INTERVAL 2 DAY) > `date`;
END$$

DROP PROCEDURE IF EXISTS `clear_stats_data`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clear_stats_data` ()   BEGIN
	DELETE FROM
		`state`
	WHERE
		NOT `hour_tick` AND SUBDATE(NOW(), INTERVAL 1 WEEK) > `date`;
END$$

DROP PROCEDURE IF EXISTS `get_current_state`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_current_state` ()   BEGIN
	SELECT
		1
	FROM
		`state`
	ORDER BY `date` DESC
    LIMIT 1;
END$$

DROP PROCEDURE IF EXISTS `get_mobile_widget_data`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_mobile_widget_data` ()   BEGIN
	SELECT
		1
	FROM
		`state`
	ORDER BY 1 DESC
    LIMIT 1;
END$$

DROP PROCEDURE IF EXISTS `new_procedure`$$
CREATE DEFINER=`root`@`%` PROCEDURE `new_procedure` (`cos` INT)   BEGIN
DECLARE first_min BOOL ;
SET @first_min = (SELECT DATE_FORMAT( MAX( date ) ,  '%Y/%m/%d %H:%i' ) = DATE_FORMAT( NOW( ) ,  '%Y/%m/%d %H:%i' ) FROM state_by_minute );

SELECT @first_min;
END$$

DROP PROCEDURE IF EXISTS `update_conf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_conf` (IN `set_temperature_00` FLOAT(4,1), IN `set_temperature_01` FLOAT(4,1), IN `set_temperature_02` FLOAT(4,1), IN `set_temperature_03` FLOAT(4,1), IN `set_temperature_04` FLOAT(4,1), IN `set_temperature_05` FLOAT(4,1), IN `set_temperature_06` FLOAT(4,1), IN `set_temperature_07` FLOAT(4,1), IN `set_temperature_08` FLOAT(4,1), IN `set_temperature_09` FLOAT(4,1), IN `set_temperature_10` FLOAT(4,1), IN `set_temperature_11` FLOAT(4,1), IN `set_temperature_12` FLOAT(4,1), IN `set_temperature_13` FLOAT(4,1), IN `set_temperature_14` FLOAT(4,1), IN `set_temperature_15` FLOAT(4,1), IN `set_temperature_16` FLOAT(4,1), IN `set_temperature_17` FLOAT(4,1))   BEGIN
UPDATE conf
SET
`datetime` = NOW(),
`set_temperature_00` = set_temperature_00,
`set_temperature_01` = set_temperature_01,
`set_temperature_02` = set_temperature_02,
`set_temperature_03` = set_temperature_03,
`set_temperature_04` = set_temperature_04,
`set_temperature_05` = set_temperature_05,
`set_temperature_06` = set_temperature_06,
`set_temperature_07` = set_temperature_07,
`set_temperature_08` = set_temperature_08,
`set_temperature_09` = set_temperature_09,
`set_temperature_10` = set_temperature_10,
`set_temperature_11` = set_temperature_11,
`set_temperature_12` = set_temperature_12,
`set_temperature_13` = set_temperature_13,
`set_temperature_14` = set_temperature_14,
`set_temperature_15` = set_temperature_15,
`set_temperature_16` = set_temperature_16,
`set_temperature_17` = set_temperature_17;

END$$

DROP PROCEDURE IF EXISTS `update_day_aggregation`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_day_aggregation` ()  NO SQL INSERT INTO day_aggregation (
    `date`,
`heater_state_on`,
    heater_01,
    heater_02,
    heater_03,
    heater_04,
    heater_05,
    heater_06,
    heater_07,
    heater_08,
    heater_15,
    heater_16,
    heater_17,
    heater_18,
    heater_19,
    heater_20,
    heater_21,
    heater_22,
    heater_23,
    heater_24,
	energy_meter_00,
	energy_meter_01,
	energy_meter_02,
	energy_meter_03,
	energy_meter_04,
	energy_meter_05,
	energy_meter_06,
	energy_meter_07
)
    SELECT
    (`date_stamp`),
    AVG(heater_state = 2) * 100,
    AVG(outputs_00 & (1 << 0) != 0) * 100,
    AVG(outputs_00 & (1 << 1) != 0) * 100,
    AVG(outputs_00 & (1 << 2) != 0) * 100,
    AVG(outputs_00 & (1 << 3) != 0) * 100,
    AVG(outputs_00 & (1 << 4) != 0) * 100,
    AVG(outputs_00 & (1 << 5) != 0) * 100,
    AVG(outputs_00 & (1 << 6) != 0) * 100,
    AVG(outputs_00 & (1 << 7) != 0) * 100,
    AVG(outputs_01 & (1 << 1) != 0) * 100,
    AVG(outputs_03 & (1 << 0) != 0) * 100,
    AVG(outputs_03 & (1 << 1) != 0) * 100,
    AVG(outputs_03 & (1 << 2) != 0) * 100,
    AVG(outputs_03 & (1 << 3) != 0) * 100,
    AVG(outputs_03 & (1 << 4) != 0) * 100,
    AVG(outputs_03 & (1 << 5) != 0) * 100,
    AVG(outputs_03 & (1 << 6) != 0) * 100,
    AVG(outputs_03 & (1 << 7) != 0) * 100,
    AVG(outputs_02 & (1 << 0) != 0) * 100,
    MAX(energy_meter_00) - MIN(energy_meter_00),
    MAX(energy_meter_01) - MIN(energy_meter_01),
    MAX(energy_meter_02) - MIN(energy_meter_02),
    MAX(energy_meter_03) - MIN(energy_meter_03),
    MAX(energy_meter_04) - MIN(energy_meter_04),
    MAX(energy_meter_05) - MIN(energy_meter_05),
    MAX(energy_meter_06) - MIN(energy_meter_06),
    MAX(energy_meter_07) - MIN(energy_meter_07)
   FROM `state` WHERE `date_stamp` = SUBDATE(CURDATE(), INTERVAL 1 DAY) AND  minute_tick$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `action_queue`
--

DROP TABLE IF EXISTS `action_queue`;
CREATE TABLE `action_queue` (
  `ID` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `floor` smallint(3) UNSIGNED NOT NULL,
  `room` smallint(3) UNSIGNED DEFAULT NULL,
  `sensor` smallint(5) UNSIGNED NOT NULL,
  `cmd` smallint(3) UNSIGNED NOT NULL,
  `value` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf`
--

DROP TABLE IF EXISTS `conf`;
CREATE TABLE `conf` (
  `ID` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `set_temperature_00` float NOT NULL,
  `set_temperature_01` float NOT NULL,
  `set_temperature_02` float NOT NULL,
  `set_temperature_03` float NOT NULL,
  `set_temperature_04` float NOT NULL,
  `set_temperature_05` float NOT NULL,
  `set_temperature_06` float NOT NULL,
  `set_temperature_07` float NOT NULL,
  `set_temperature_08` float NOT NULL,
  `set_temperature_09` float NOT NULL,
  `set_temperature_10` float NOT NULL,
  `set_temperature_11` float NOT NULL,
  `set_temperature_12` float NOT NULL,
  `set_temperature_13` float NOT NULL,
  `set_temperature_14` float NOT NULL,
  `set_temperature_15` float NOT NULL,
  `set_temperature_16` float NOT NULL,
  `set_temperature_17` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf_blinds`
--

DROP TABLE IF EXISTS `conf_blinds`;
CREATE TABLE `conf_blinds` (
  `index` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `time_up` time NOT NULL,
  `time_down` time NOT NULL,
  `lux_up` int(10) UNSIGNED NOT NULL,
  `lux_down` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf_heating`
--

DROP TABLE IF EXISTS `conf_heating`;
CREATE TABLE `conf_heating` (
  `index` tinyint(3) UNSIGNED NOT NULL,
  `output` tinyint(3) UNSIGNED NOT NULL,
  `temp` tinyint(3) UNSIGNED NOT NULL,
  `time_01` time NOT NULL,
  `time_02` time NOT NULL,
  `time_03` time NOT NULL,
  `time_04` time NOT NULL,
  `time_05` time NOT NULL,
  `time_06` time NOT NULL,
  `time_07` time NOT NULL,
  `time_08` time NOT NULL,
  `val_01` float NOT NULL,
  `val_02` float NOT NULL,
  `val_03` float NOT NULL,
  `val_04` float NOT NULL,
  `val_05` float NOT NULL,
  `val_06` float NOT NULL,
  `val_07` float NOT NULL,
  `val_08` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf_timers_outputs`
--

DROP TABLE IF EXISTS `conf_timers_outputs`;
CREATE TABLE `conf_timers_outputs` (
  `ID` int(10) UNSIGNED NOT NULL,
  `active` bit(1) NOT NULL,
  `weekdays` tinyint(4) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `duration` smallint(5) UNSIGNED NOT NULL,
  `output` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf_watering`
--

DROP TABLE IF EXISTS `conf_watering`;
CREATE TABLE `conf_watering` (
  `index` tinyint(4) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delay` tinyint(4) UNSIGNED NOT NULL,
  `period` tinyint(4) UNSIGNED NOT NULL,
  `schedule` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conf_watering_state`
--

DROP TABLE IF EXISTS `conf_watering_state`;
CREATE TABLE `conf_watering_state` (
  `index` tinyint(4) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `start_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `day_aggregation`
--

DROP TABLE IF EXISTS `day_aggregation`;
CREATE TABLE `day_aggregation` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `heater_state_on` decimal(6,3) UNSIGNED DEFAULT NULL,
  `heater_01` decimal(6,3) DEFAULT NULL,
  `heater_02` decimal(6,3) DEFAULT NULL,
  `heater_03` decimal(6,3) DEFAULT NULL,
  `heater_04` decimal(6,3) DEFAULT NULL,
  `heater_05` decimal(6,3) DEFAULT NULL,
  `heater_06` decimal(6,3) DEFAULT NULL,
  `heater_07` decimal(6,3) DEFAULT NULL,
  `heater_08` decimal(6,3) DEFAULT NULL,
  `heater_15` decimal(6,3) DEFAULT NULL,
  `heater_16` decimal(6,3) DEFAULT NULL,
  `heater_17` decimal(6,3) DEFAULT NULL,
  `heater_18` decimal(6,3) DEFAULT NULL,
  `heater_19` decimal(6,3) DEFAULT NULL,
  `heater_20` decimal(6,3) DEFAULT NULL,
  `heater_21` decimal(6,3) DEFAULT NULL,
  `heater_22` decimal(6,3) DEFAULT NULL,
  `heater_23` decimal(6,3) DEFAULT NULL,
  `heater_24` decimal(6,3) DEFAULT NULL,
  `energy_meter_00` float DEFAULT NULL,
  `energy_meter_01` float DEFAULT NULL,
  `energy_meter_02` float DEFAULT NULL,
  `energy_meter_03` float DEFAULT NULL,
  `energy_meter_04` float DEFAULT NULL,
  `energy_meter_05` float DEFAULT NULL,
  `energy_meter_06` float DEFAULT NULL,
  `energy_meter_07` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `errors`
--

DROP TABLE IF EXISTS `errors`;
CREATE TABLE `errors` (
  `ID` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `module` smallint(6) NOT NULL,
  `address` smallint(6) NOT NULL,
  `cmd` smallint(6) NOT NULL,
  `error` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `iot_devices`
--

DROP TABLE IF EXISTS `iot_devices`;
CREATE TABLE `iot_devices` (
  `id` int(11) NOT NULL,
  `mac` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `iot_sessions`
--

DROP TABLE IF EXISTS `iot_sessions`;
CREATE TABLE `iot_sessions` (
  `session_id` varchar(40) NOT NULL,
  `device_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `ID` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `date_stamp` date DEFAULT NULL,
  `minute_tick` tinyint(1) NOT NULL,
  `hour_tick` tinyint(1) NOT NULL,
  `inputs_00` bit(8) DEFAULT NULL,
  `inputs_01` bit(8) DEFAULT NULL,
  `inputs_02` bit(8) DEFAULT NULL,
  `inputs_03` bit(8) DEFAULT NULL,
  `inputs_04` bit(8) DEFAULT NULL,
  `inputs_05` bit(8) DEFAULT NULL,
  `inputs_06` bit(8) DEFAULT NULL,
  `inputs_07` bit(8) DEFAULT NULL,
  `inputs_08` bit(8) DEFAULT NULL,
  `inputs_09` bit(8) DEFAULT NULL,
  `inputs_10` bit(8) DEFAULT NULL,
  `inputs_11` bit(8) DEFAULT NULL,
  `inputs_12` bit(8) DEFAULT NULL,
  `inputs_13` bit(8) DEFAULT NULL,
  `inputs_14` bit(8) DEFAULT NULL,
  `inputs_15` bit(8) DEFAULT NULL,
  `inputs_16` bit(8) DEFAULT NULL,
  `inputs_17` bit(8) DEFAULT NULL,
  `inputs_18` bit(8) DEFAULT NULL,
  `inputs_19` bit(8) DEFAULT NULL,
  `inputs_20` bit(8) DEFAULT NULL,
  `inputs_21` bit(8) DEFAULT NULL,
  `outputs_00` bit(8) DEFAULT NULL,
  `outputs_01` bit(8) DEFAULT NULL,
  `outputs_02` bit(8) DEFAULT NULL,
  `outputs_03` bit(8) DEFAULT NULL,
  `outputs_04` bit(8) DEFAULT NULL,
  `outputs_05` bit(8) DEFAULT NULL,
  `outputs_06` bit(8) DEFAULT NULL,
  `outputs_07` bit(8) DEFAULT NULL,
  `outputs_08` bit(8) DEFAULT NULL,
  `outputs_09` bit(8) DEFAULT NULL,
  `outputs_10` bit(8) DEFAULT NULL,
  `outputs_11` bit(8) DEFAULT NULL,
  `outputs_12` bit(8) DEFAULT NULL,
  `outputs_13` bit(8) DEFAULT NULL,
  `outputs_14` bit(8) DEFAULT NULL,
  `outputs_15` bit(8) DEFAULT NULL,
  `outputs_16` bit(8) DEFAULT NULL,
  `outputs_17` bit(8) DEFAULT NULL,
  `outputs_18` bit(8) DEFAULT NULL,
  `outputs_19` bit(8) DEFAULT NULL,
  `outputs_20` bit(8) DEFAULT NULL,
  `outputs_21` bit(8) DEFAULT NULL,
  `pressure_00` decimal(5,1) DEFAULT NULL,
  `rain_00` decimal(4,1) DEFAULT NULL,
  `light_level_00` decimal(6,1) DEFAULT NULL,
  `light_level_01` decimal(4,1) DEFAULT NULL,
  `temperature_00` decimal(5,1) DEFAULT NULL,
  `temperature_01` decimal(4,1) DEFAULT NULL,
  `temperature_02` decimal(4,1) DEFAULT NULL,
  `temperature_03` decimal(4,1) DEFAULT NULL,
  `temperature_04` decimal(4,1) DEFAULT NULL,
  `temperature_05` decimal(4,1) DEFAULT NULL,
  `temperature_06` decimal(4,1) DEFAULT NULL,
  `temperature_07` decimal(4,1) DEFAULT NULL,
  `temperature_08` decimal(4,1) DEFAULT NULL,
  `temperature_09` decimal(4,1) DEFAULT NULL,
  `temperature_10` decimal(4,1) DEFAULT NULL,
  `temperature_11` decimal(4,1) DEFAULT NULL,
  `temperature_12` decimal(4,1) DEFAULT NULL,
  `temperature_13` decimal(4,1) DEFAULT NULL,
  `temperature_14` decimal(4,1) DEFAULT NULL,
  `temperature_15` decimal(4,1) DEFAULT NULL,
  `temperature_16` decimal(4,1) DEFAULT NULL,
  `temperature_17` decimal(4,1) DEFAULT NULL,
  `temperature_18` decimal(4,1) DEFAULT NULL,
  `temperature_19` decimal(4,1) DEFAULT NULL,
  `temperature_20` decimal(4,1) DEFAULT NULL,
  `temperature_21` decimal(4,1) DEFAULT NULL,
  `temperature_22` decimal(4,1) DEFAULT NULL,
  `temperature_23` decimal(4,1) DEFAULT NULL,
  `temperature_24` decimal(4,1) DEFAULT NULL,
  `temperature_25` decimal(4,1) DEFAULT NULL,
  `temperature_26` decimal(4,1) DEFAULT NULL,
  `temperature_27` decimal(4,1) DEFAULT NULL,
  `temperature_28` decimal(4,1) DEFAULT NULL,
  `temperature_29` decimal(4,1) DEFAULT NULL,
  `temperature_30` decimal(4,1) DEFAULT NULL,
  `temperature_31` decimal(4,1) DEFAULT NULL,
  `temperature_32` decimal(4,1) DEFAULT NULL,
  `temperature_33` decimal(4,1) DEFAULT NULL,
  `temperature_34` decimal(4,1) DEFAULT NULL,
  `temperature_35` decimal(4,1) DEFAULT NULL,
  `temperature_36` decimal(4,1) DEFAULT NULL,
  `temperature_37` decimal(4,1) DEFAULT NULL,
  `temperature_38` decimal(4,1) DEFAULT NULL,
  `temperature_39` decimal(4,1) DEFAULT NULL,
  `temperature_40` decimal(4,1) DEFAULT NULL,
  `temperature_41` decimal(4,1) DEFAULT NULL,
  `temperature_42` decimal(4,1) DEFAULT NULL,
  `temperature_43` decimal(4,1) DEFAULT NULL,
  `temperature_44` decimal(4,1) DEFAULT NULL,
  `temperature_45` decimal(4,1) DEFAULT NULL,
  `temperature_46` decimal(4,1) DEFAULT NULL,
  `temperature_47` decimal(4,1) DEFAULT NULL,
  `temperature_48` decimal(4,1) DEFAULT NULL,
  `temperature_49` decimal(5,1) DEFAULT NULL,
  `temperature_50` decimal(5,1) DEFAULT NULL,
  `temperature_51` decimal(5,1) DEFAULT NULL,
  `temperature_52` decimal(5,1) DEFAULT NULL,
  `temperature_53` decimal(5,1) DEFAULT NULL,
  `temperature_54` decimal(5,1) DEFAULT NULL,
  `temperature_55` decimal(5,1) DEFAULT NULL,
  `temperature_56` decimal(5,1) DEFAULT NULL,
  `temperature_57` decimal(5,1) DEFAULT NULL,
  `temperature_58` decimal(5,1) DEFAULT NULL,
  `temperature_59` decimal(5,1) DEFAULT NULL,
  `temperature_60` decimal(5,1) DEFAULT NULL,
  `temperature_61` decimal(5,1) DEFAULT NULL,
  `temperature_62` decimal(5,1) DEFAULT NULL,
  `temperature_63` decimal(4,1) DEFAULT NULL,
  `humidity_00` decimal(4,1) DEFAULT NULL,
  `humidity_01` decimal(4,1) DEFAULT NULL,
  `humidity_02` decimal(4,1) DEFAULT NULL,
  `humidity_03` decimal(4,1) DEFAULT NULL,
  `humidity_04` decimal(4,1) DEFAULT NULL,
  `humidity_05` decimal(4,1) DEFAULT NULL,
  `humidity_06` decimal(4,1) DEFAULT NULL,
  `humidity_07` decimal(4,1) DEFAULT NULL,
  `energy_meter_00` float DEFAULT NULL,
  `energy_meter_01` float DEFAULT NULL,
  `energy_meter_02` float DEFAULT NULL,
  `energy_meter_03` float DEFAULT NULL,
  `energy_meter_04` float DEFAULT NULL,
  `energy_meter_05` float DEFAULT NULL,
  `energy_meter_06` float DEFAULT NULL,
  `energy_meter_07` float DEFAULT NULL,
  `water_meter_00` float DEFAULT NULL,
  `smoke_level_00` decimal(4,1) DEFAULT NULL,
  `smoke_level_01` decimal(4,1) DEFAULT NULL,
  `smoke_level_02` decimal(4,1) DEFAULT NULL,
  `smoke_level_03` decimal(4,1) DEFAULT NULL,
  `pressure_level_00` decimal(4,2) DEFAULT NULL,
  `pressure_level_01` decimal(4,2) DEFAULT NULL,
  `pressure_level_02` decimal(4,2) DEFAULT NULL,
  `pressure_level_03` decimal(4,2) DEFAULT NULL,
  `external_inputs_00` bit(8) DEFAULT NULL,
  `external_inputs_01` bit(8) DEFAULT NULL,
  `external_inputs_02` bit(8) DEFAULT NULL,
  `external_inputs_03` bit(8) DEFAULT NULL,
  `sensors_active_00` bit(8) DEFAULT NULL,
  `last_movement_00` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_01` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_02` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_03` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_04` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_05` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_06` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_07` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_08` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_09` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_10` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_11` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_12` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_13` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_14` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_15` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_16` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_17` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_18` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_19` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_20` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_21` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_22` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_23` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_24` smallint(5) UNSIGNED DEFAULT NULL,
  `last_movement_25` smallint(5) UNSIGNED DEFAULT NULL,
  `overcurrent_protection_00` bit(8) DEFAULT NULL,
  `overcurrent_protection_01` bit(8) DEFAULT NULL,
  `overcurrent_protection_02` bit(8) DEFAULT NULL,
  `fuel_level_00` decimal(4,1) DEFAULT NULL,
  `heater_state` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_00` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_01` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_02` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_03` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_04` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_05` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_06` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_07` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_08` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_09` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_10` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_11` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_12` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_13` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_14` tinyint(3) UNSIGNED DEFAULT NULL,
  `leds_15` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state_by_minute`
--

DROP TABLE IF EXISTS `state_by_minute`;
CREATE TABLE `state_by_minute` (
  `ID` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `t01` float DEFAULT NULL,
  `t02` float DEFAULT NULL,
  `t03` float DEFAULT NULL,
  `t04` float DEFAULT NULL,
  `t05` float DEFAULT NULL,
  `t06` float DEFAULT NULL,
  `t07` float DEFAULT NULL,
  `t08` float DEFAULT NULL,
  `t09` float DEFAULT NULL,
  `t10` float DEFAULT NULL,
  `t11` float DEFAULT NULL,
  `t12` float DEFAULT NULL,
  `t13` float DEFAULT NULL,
  `t14` float DEFAULT NULL,
  `t15` float DEFAULT NULL,
  `t16` float DEFAULT NULL,
  `t17` float DEFAULT NULL,
  `t18` float DEFAULT NULL,
  `t19` float DEFAULT NULL,
  `t20` float DEFAULT NULL,
  `t21` float DEFAULT NULL,
  `t22` float DEFAULT NULL,
  `t23` float DEFAULT NULL,
  `t24` float DEFAULT NULL,
  `t25` float DEFAULT NULL,
  `t26` float DEFAULT NULL,
  `t27` float DEFAULT NULL,
  `t28` float DEFAULT NULL,
  `temperature_onboard` float DEFAULT NULL,
  `humidity_1` float DEFAULT NULL,
  `temperature_1` float DEFAULT NULL,
  `light_1` float DEFAULT NULL,
  `rain_1` float DEFAULT NULL,
  `humidity_2` float DEFAULT NULL,
  `temperature_2` float DEFAULT NULL,
  `light_2` float DEFAULT NULL,
  `rain_2` float DEFAULT NULL,
  `refinery` float DEFAULT NULL,
  `water` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela przechowująca stan zmiennych';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state_hourly`
--

DROP TABLE IF EXISTS `state_hourly`;
CREATE TABLE `state_hourly` (
  `ID` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `energy` int(10) UNSIGNED DEFAULT NULL,
  `pressure` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state_old`
--

DROP TABLE IF EXISTS `state_old`;
CREATE TABLE `state_old` (
  `ID` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `t01` float DEFAULT NULL,
  `t02` float DEFAULT NULL,
  `t03` float DEFAULT NULL,
  `t04` float DEFAULT NULL,
  `t05` float DEFAULT NULL,
  `t06` float DEFAULT NULL,
  `t07` float DEFAULT NULL,
  `t08` float DEFAULT NULL,
  `t09` float DEFAULT NULL,
  `t10` float DEFAULT NULL,
  `t11` float DEFAULT NULL,
  `t12` float DEFAULT NULL,
  `t13` float DEFAULT NULL,
  `t14` float DEFAULT NULL,
  `t15` float DEFAULT NULL,
  `t16` float DEFAULT NULL,
  `t17` float DEFAULT NULL,
  `t18` float DEFAULT NULL,
  `t19` float DEFAULT NULL,
  `t20` float DEFAULT NULL,
  `t21` float DEFAULT NULL,
  `t22` float DEFAULT NULL,
  `t23` float DEFAULT NULL,
  `t24` float DEFAULT NULL,
  `t25` float DEFAULT NULL,
  `t26` float DEFAULT NULL,
  `t27` float DEFAULT NULL,
  `t28` float DEFAULT NULL,
  `temperature_onboard` double NOT NULL,
  `pressure` float DEFAULT NULL,
  `pressure_temperature` float DEFAULT NULL,
  `humidity_1` float DEFAULT NULL,
  `humidity_temperature_1` float DEFAULT NULL,
  `temperature_1` float DEFAULT NULL,
  `light_1` float DEFAULT NULL,
  `rain_1` double NOT NULL,
  `humidity_2` double NOT NULL,
  `humidity_temperature_2` double NOT NULL,
  `temperature_2` double NOT NULL,
  `light_2` double NOT NULL,
  `rain_2` double NOT NULL,
  `refinery` float DEFAULT NULL,
  `in_00` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_01` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_02` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_03` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_04` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_05` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_06` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_07` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_08` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_09` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_10` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_11` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_12` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_13` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_14` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_15` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_16` tinyint(3) UNSIGNED DEFAULT NULL,
  `in_17` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_00` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_01` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_02` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_03` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_04` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_05` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_06` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_07` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_08` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_09` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_10` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_11` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_12` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_13` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_14` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_15` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_16` tinyint(3) UNSIGNED DEFAULT NULL,
  `out_17` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='Tabela przechowująca stan zmiennych';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `mode` tinyint(3) UNSIGNED NOT NULL,
  `device` tinyint(3) UNSIGNED NOT NULL,
  `error` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `action_queue`
--
ALTER TABLE `action_queue`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `conf`
--
ALTER TABLE `conf`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `conf_blinds`
--
ALTER TABLE `conf_blinds`
  ADD PRIMARY KEY (`index`);

--
-- Indeksy dla tabeli `conf_heating`
--
ALTER TABLE `conf_heating`
  ADD PRIMARY KEY (`index`);

--
-- Indeksy dla tabeli `conf_timers_outputs`
--
ALTER TABLE `conf_timers_outputs`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `conf_watering`
--
ALTER TABLE `conf_watering`
  ADD PRIMARY KEY (`index`);

--
-- Indeksy dla tabeli `conf_watering_state`
--
ALTER TABLE `conf_watering_state`
  ADD PRIMARY KEY (`index`);

--
-- Indeksy dla tabeli `day_aggregation`
--
ALTER TABLE `day_aggregation`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `errors`
--
ALTER TABLE `errors`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `iot_devices`
--
ALTER TABLE `iot_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `iot_sessions`
--
ALTER TABLE `iot_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indeksy dla tabeli `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `date` (`date`),
  ADD KEY `stats` (`date`,`minute_tick`,`hour_tick`),
  ADD KEY `date_hour` (`date_stamp`,`hour_tick`) USING BTREE,
  ADD KEY `date_minute` (`date_stamp`,`minute_tick`),
  ADD KEY `ix_date_minute_iddesc` (`date_stamp`,`minute_tick`,`ID`),
  ADD KEY `ix_date_hour_iddesc` (`date_stamp`,`hour_tick`,`ID`);

--
-- Indeksy dla tabeli `state_by_minute`
--
ALTER TABLE `state_by_minute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `dateindex` (`date`) USING BTREE;

--
-- Indeksy dla tabeli `state_hourly`
--
ALTER TABLE `state_hourly`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `state_old`
--
ALTER TABLE `state_old`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indeksy dla tabeli `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `action_queue`
--
ALTER TABLE `action_queue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `conf_blinds`
--
ALTER TABLE `conf_blinds`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `conf_timers_outputs`
--
ALTER TABLE `conf_timers_outputs`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `day_aggregation`
--
ALTER TABLE `day_aggregation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `errors`
--
ALTER TABLE `errors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `iot_devices`
--
ALTER TABLE `iot_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `state`
--
ALTER TABLE `state`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `state_by_minute`
--
ALTER TABLE `state_by_minute`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `state_hourly`
--
ALTER TABLE `state_hourly`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `state_old`
--
ALTER TABLE `state_old`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Zdarzenia
--
DROP EVENT IF EXISTS `clearer`$$
CREATE DEFINER=`root`@`localhost` EVENT `clearer` ON SCHEDULE EVERY 1 DAY STARTS '2022-11-26 01:00:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM `state`
WHERE (date < SUBDATE(NOW(), INTERVAL 1 YEAR) AND NOT hour_tick ) OR(date < SUBDATE(NOW(), INTERVAL 1 MONTH) AND NOT hour_tick AND  minute_tick % 15 != 0) OR (date < SUBDATE(NOW(), INTERVAL 7 DAY) AND NOT hour_tick AND NOT minute_tick )$$

DROP EVENT IF EXISTS `update_day_aggregation`$$
CREATE DEFINER=`root`@`localhost` EVENT `update_day_aggregation` ON SCHEDULE EVERY 1 DAY STARTS '2022-12-14 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL update_day_aggregation$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
