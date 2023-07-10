-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bucketlistdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bucketlistdb` ;

-- -----------------------------------------------------
-- Schema bucketlistdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bucketlistdb` DEFAULT CHARACTER SET utf8 ;
USE `bucketlistdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `image` VARCHAR(4000) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  `enabled` TINYINT(4) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `completed` VARCHAR(45) NULL,
  `description` VARCHAR(300) NULL,
  `image` VARCHAR(4000) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_item_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_item_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS bucket;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'bucket' IDENTIFIED BY 'bucket';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'bucket';
GRANT ALL ON * TO 'bucket';
GRANT SELECT ON TABLE * TO 'bucket';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'bucket';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bucketlistdb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `phone_number`, `image`, `created_at`, `updated_at`, `enabled`) VALUES (1, 'TiaWright', 'password', 'tiawright@gmail.com', 'admin', '123-000-9999', NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `phone_number`, `image`, `created_at`, `updated_at`, `enabled`) VALUES (2, 'KristenT', 'password', 'kristent@gmail.com', 'user', '000-111-2222', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `bucketlistdb`;
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (1, 'visit niagra falls', '1', 'i\'ve always wanted to see this amazing waterfall', '', NULL, NULL, 1);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (2, 'sky diving', '0', 'want to find out if im an adrenaline junkie', '', NULL, NULL, 2);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (3, 'meet beyonce', '0', '', '', NULL, NULL, 1);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (4, 'learn a new language', '0', NULL, '', NULL, NULL, 2);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (5, 'running a marathon', '1', NULL, '', NULL, NULL, 1);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (6, 'write a book', '0', NULL, '', NULL, NULL, 2);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (7, 'travel to dubai', '1', NULL, '', NULL, NULL, 1);
INSERT INTO `item` (`id`, `name`, `completed`, `description`, `image`, `created_at`, `updated_at`, `user_id`) VALUES (DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, 2);

COMMIT;

