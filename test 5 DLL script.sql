CREATE TABLE `tb_match_type` (
  `match_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `increased_price` decimal(10,2) NOT NULL,
  `increased_percent` int(3) NOT NULL,
  `updated_by` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`match_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_ticket_type` (
  `ticket_type` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `special_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ticket_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `tb_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_type_id` int(11) NOT NULL,
  `team_away` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kick_off_date` datetime NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `tb_match_fk_match_type` (`match_type_id`),
  CONSTRAINT `tb_match_fk_match_type` FOREIGN KEY (`match_type_id`) REFERENCES `tb_match_type` (`match_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `seat_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `tb_seat_fk_zone_id` (`zone_id`),
  CONSTRAINT `tb_seat_fk_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `tb_zone` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_ticket_type` (
  `ticket_type` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `special_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ticket_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tb_ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `net_price` decimal(10,2) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `tb_ticket_fk_match_id` (`match_id`),
  KEY `tb_ticket_fk_seat_id` (`seat_id`),
  KEY `tb_ticket_fk_ticket_type_id` (`ticket_type`),
  KEY `tb_ticket_fk_customer_id` (`customer_id`),
  CONSTRAINT `tb_ticket_fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`),
  CONSTRAINT `tb_ticket_fk_match_id` FOREIGN KEY (`match_id`) REFERENCES `tb_match` (`match_id`),
  CONSTRAINT `tb_ticket_fk_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `tb_seat` (`seat_id`),
  CONSTRAINT `tb_ticket_fk_ticket_type_id` FOREIGN KEY (`ticket_type`) REFERENCES `tb_ticket_type` (`ticket_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

