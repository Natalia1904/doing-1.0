DROP SCHEMA IF EXISTS `event_db`;

CREATE SCHEMA IF NOT EXISTS `event_db`
CHARACTER SET `utf8`;

USE `event_db`;

CREATE TABLE `cities` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `streets` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`city_id` int(11) NOT NULL,
	
	PRIMARY KEY (`id`),
	  
	CONSTRAINT `fk_to_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `address` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`city_id` int(11) NOT NULL,
	`street_id` int(11) NOT NULL,
	`house` varchar(255) NOT NULL,
	`flat` varchar(255) NOT NULL,
	`corps` varchar(255) NOT NULL,

	PRIMARY KEY (`id`),

	KEY `fk_address_to_city` (`city_id`),
	KEY `fk_address_to_street` (`street_id`),

	CONSTRAINT `fk_address_to_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
	CONSTRAINT `fk_address_to_street` FOREIGN KEY (`street_id`) REFERENCES `streets` (`id`)
);

CREATE TABLE `events` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`start_date` date NOT NULL,
	-- `start_time` time DEFAULT NULL,
	`description` text,
	
	PRIMARY KEY (`id`)
);

CREATE TABLE `address_to_event` (
	`event_id` int(11) NOT NULL,
	`address_id` int(11) NOT NULL,
	
	KEY `fk_address_to_event` (`event_id`),
	KEY `fk_event_to_address` (`address_id`),
	
	CONSTRAINT `fk_address_to_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_event_to_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
);

CREATE TABLE `roles` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`role_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`enabled` boolean DEFAULT true,
	`role_id` int(11) NOT NULL,

	PRIMARY KEY (`id`),

	KEY `fk_user_to_role` (`role_id`),
	
	CONSTRAINT `fk_user_to_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
);

CREATE TABLE `permissions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`permission_name` varchar(255) NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `permissions_to_roles` (
	`role_id` int(11) NOT NULL,
	`permission_id` int(11) NOT NULL,

	PRIMARY KEY (`role_id`, `permission_id`),
	
	KEY `fk_to_role` (`role_id`),
	KEY `fk_to_permission` (`permission_id`),
	
	CONSTRAINT `fk_to_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `users_to_event` (
	`event_id` int(11) NOT NULL,
	`user_id` int(11) NOT NULL,

	KEY `fk_to_event` (`event_id`),
	KEY `fk_event_to_user` (`user_id`),
	
	CONSTRAINT `fk_event_to_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	CONSTRAINT `fk_to_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE messages (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `messange_text` text NOT NULL,
    `from_user_id` int(11) NOT NULL,
    `to_user_id` int(11) NOT NULL,
    
    PRIMARY KEY (`id`),
	
	KEY `fk_from_user` (`from_user_id`),
	KEY `fk_to_user` (`to_user_id`),
	
	CONSTRAINT `fk_from_user` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_to_user` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    
);

INSERT INTO `roles` (id, role_name) VALUES (1,'Administrator');
INSERT INTO `roles` (id, role_name) VALUES (2,'Moderator');
INSERT INTO `roles` (id, role_name) VALUES (3,'EventCreator');
INSERT INTO `roles` (id, role_name) VALUES (4,'RegularUser');

INSERT INTO `users` (id, email, password, enabled, role_id) VALUES (1,'123@tut.by','123', 1, 1);
INSERT INTO `users` (id, email, password, enabled, role_id) VALUES (2,'myemail@gmail.com','123', 1, 3);

INSERT INTO `permissions` (`id`, `permission_name`) VALUES (1, 'create_user');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (2, 'update_user');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (3, 'delete_user');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (4, 'enable_user');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (5, 'disable_user');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (6, 'crete_event');
INSERT INTO `permissions` (`id`, `permission_name`) VALUES (7, 'delete_event');

INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 1);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 2);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 3);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 4);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 5);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 6);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (1, 7);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (3, 6);
INSERT INTO `permissions_to_roles` (`role_id`, `permission_id`) VALUES (3, 7);

INSERT INTO `cities`(id, name) VALUES (1,'Minsk');
INSERT INTO `cities`(id, name) VALUES (2,'New York');
INSERT INTO `cities`(id, name) VALUES (3,'London');
INSERT INTO `cities`(id, name) VALUES (4,'Paris');

INSERT into streets(id, name, city_id) values (1, 'Leina', 1);
INSERT into streets(id, name, city_id) values (2, 'Franklina', 2);
INSERT into streets(id, name, city_id) values (3, 'Tetchera', 3);
INSERT into streets(id, name, city_id) values (4, 'Olandana', 4);
