-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `fog`;

-- -----------------------------------------------------
-- Table `fog`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`material`
(
    `id_material` INT(11)     NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) NOT NULL,
    `cost`        FLOAT       NOT NULL,
    `price`       FLOAT       NOT NULL,
    `length`      INT(11)     NULL DEFAULT NULL,
    `height`      INT(11)     NULL DEFAULT NULL,
    `width`       INT(11)     NULL DEFAULT NULL,
    `unit`        VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id_material`),
    UNIQUE INDEX `id_material_UNIQUE` (`id_material` ASC) VISIBLE
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 98
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fog`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`city`
(
    `zip_code`          VARCHAR(4)  NOT NULL,
    `city`              VARCHAR(45) NOT NULL,
    `region_name`       VARCHAR(45) NOT NULL,
    `municipality_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`zip_code`),
    UNIQUE INDEX `zipcode_UNIQUE` (`zip_code` ASC) VISIBLE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fog`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`users`
(
    `id_user`    INT(11)     NOT NULL AUTO_INCREMENT,
    `email`      VARCHAR(45) NOT NULL,
    `password`   VARCHAR(45) NOT NULL,
    `role`       VARCHAR(45) NOT NULL,
    `firstname`  VARCHAR(45) NOT NULL,
    `lastname`   VARCHAR(45) NOT NULL,
    `streetname` VARCHAR(45) NOT NULL,
    `housenr`    VARCHAR(10) NOT NULL,
    `zipcode`    VARCHAR(4)  NOT NULL,
    `phonenr`    VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id_user`),
    UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE,
    INDEX `fk_users_city_idx` (`zipcode` ASC) VISIBLE,
    CONSTRAINT `fk_users_city`
        FOREIGN KEY (`zipcode`)
            REFERENCES `fog`.`city` (`zip_code`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fog`.`user_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`user_orders`
(
    `id_order`       INT(11)     NOT NULL AUTO_INCREMENT,
    `user_id`        INT(11)     NOT NULL,
    `totalprice`     INT(11)     NOT NULL,
    `totalcost`      INT(11)     NOT NULL,
    `orderdate`      TIMESTAMP   NULL     DEFAULT NULL,
    `status`         VARCHAR(45) NOT NULL DEFAULT 'request',
    `carport_length` INT(11)     NOT NULL,
    `carport_width`  INT(11)     NOT NULL,
    `roof_type`      VARCHAR(45) NOT NULL,
    `roof_angle`     VARCHAR(45) NOT NULL,
    `shed_length`    INT(11)     NULL     DEFAULT NULL,
    `shed_width`     INT(11)     NULL     DEFAULT NULL,
    PRIMARY KEY (`id_order`),
    UNIQUE INDEX `id_order_UNIQUE` (`id_order` ASC) VISIBLE,
    INDEX `fk_user_orders_users1_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `fk_user_orders_users1`
        FOREIGN KEY (`user_id`)
            REFERENCES `fog`.`users` (`id_user`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 61
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fog`.`bom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`bom`
(
    `id_bom`      INT(11)     NOT NULL AUTO_INCREMENT,
    `order_id`    INT(11)     NOT NULL,
    `material_id` INT(11)     NOT NULL,
    `quantity`    INT(11)     NOT NULL,
    `type`        VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id_bom`),
    UNIQUE INDEX `id_stykliste_UNIQUE` (`id_bom` ASC) VISIBLE,
    INDEX `fk_bom_user_orders1_idx` (`order_id` ASC) VISIBLE,
    INDEX `fk_bom_material1_idx` (`material_id` ASC) VISIBLE,
    CONSTRAINT `fk_bom_material1`
        FOREIGN KEY (`material_id`)
            REFERENCES `fog`.`material` (`id_material`),
    CONSTRAINT `fk_bom_user_orders1`
        FOREIGN KEY (`order_id`)
            REFERENCES `fog`.`user_orders` (`id_order`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1322
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

USE `fog`;

-- -----------------------------------------------------
-- Placeholder table for view `fog`.`billofmaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`billofmaterial`
(
    `id_bom`      INT,
    `order_id`    INT,
    `quantity`    INT,
    `type`        INT,
    `description` INT,
    `id_material` INT,
    `name`        INT,
    `cost`        INT,
    `price`       INT,
    `length`      INT,
    `height`      INT,
    `width`       INT,
    `unit`        INT
);

-- -----------------------------------------------------
-- Placeholder table for view `fog`.`userinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fog`.`userinfo`
(
    `id_user`     INT,
    `email`       INT,
    `password`    INT,
    `role`        INT,
    `firstname`   INT,
    `lastname`    INT,
    `streetname`  INT,
    `housenr`     INT,
    `zipcode`     INT,
    `phonenr`     INT,
    `city`        INT,
    `region_name` INT
);

-- -----------------------------------------------------
-- View `fog`.`billofmaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fog`.`billofmaterial`;
USE `fog`;
CREATE OR REPLACE ALGORITHM = UNDEFINED DEFINER =`root`@`localhost` SQL SECURITY DEFINER VIEW `fog`.`billofmaterial` AS
select `fog`.`bom`.`id_bom`      AS `id_bom`,
       `fog`.`bom`.`order_id`    AS `order_id`,
       `fog`.`bom`.`quantity`    AS `quantity`,
       `fog`.`bom`.`type`        AS `type`,
       `fog`.`bom`.`description` AS `description`,
       `m`.`id_material`         AS `id_material`,
       `m`.`name`                AS `name`,
       `m`.`cost`                AS `cost`,
       `m`.`price`               AS `price`,
       `m`.`length`              AS `length`,
       `m`.`height`              AS `height`,
       `m`.`width`               AS `width`,
       `m`.`unit`                AS `unit`
from (`fog`.`bom`
         join `fog`.`material` `m` on ((`m`.`id_material` = `fog`.`bom`.`material_id`)));

-- -----------------------------------------------------
-- View `fog`.`userinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fog`.`userinfo`;
USE `fog`;
CREATE OR REPLACE ALGORITHM = UNDEFINED DEFINER =`root`@`localhost` SQL SECURITY DEFINER VIEW `fog`.`userinfo` AS
select `u`.`id_user`     AS `id_user`,
       `u`.`email`       AS `email`,
       `u`.`password`    AS `password`,
       `u`.`role`        AS `role`,
       `u`.`firstname`   AS `firstname`,
       `u`.`lastname`    AS `lastname`,
       `u`.`streetname`  AS `streetname`,
       `u`.`housenr`     AS `housenr`,
       `u`.`zipcode`     AS `zipcode`,
       `u`.`phonenr`     AS `phonenr`,
       `c`.`city`        AS `city`,
       `c`.`region_name` AS `region_name`
from (`fog`.`users` `u`
         join `fog`.`city` `c` on ((`u`.`zipcode` = `c`.`zip_code`)));

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
