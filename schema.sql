
DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR,
  `slogan` VARCHAR,
  `description` VARCHAR,
  `category` VARCHAR,
  `default_price` VARCHAR,
  `id_Features` INTEGER,
  `id_styles` INTEGER,
  `new field` INTEGER,
  `related` VARCHAR,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Features'
--
-- ---

DROP TABLE IF EXISTS `Features`;

CREATE TABLE `Features` (
  `id` INTEGER AUTO_INCREMENT,
  `feature` VARCHAR,
  `value` VARCHAR,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS `styles`;

CREATE TABLE `styles` (
  `id` INTEGER AUTO_INCREMENT ,
  `name` VARCHAR,
  `original_price` VARCHAR,
  `sale_price` VARCHAR,
  `default` VARCHAR,
  `photos` VARCHAR,
  `id_skus` INTEGER,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'skus'
--
-- ---

DROP TABLE IF EXISTS `skus`;

CREATE TABLE `skus` (
  `id` INTEGER AUTO_INCREMENT ,
  `sku_number` INTEGER,
  `quantity` INT,
  `size` VARCHAR,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Product` ADD FOREIGN KEY (id_Features) REFERENCES `Features` (`id`);
ALTER TABLE `Product` ADD FOREIGN KEY (id_styles) REFERENCES `styles` (`id`);
ALTER TABLE `styles` ADD FOREIGN KEY (id_skus) REFERENCES `skus` (`id`);

-- ---
-- Test Data
-- ---

-- INSERT INTO `Product` (`id`,`name`,`slogan`,`description`,`category`,`default_price`,`id_Features`,`id_styles`,`new field`,`related`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `Features` (`id`,`feature`,`value`) VALUES
-- ('','','');
-- INSERT INTO `styles` (`id`,`name`,`original_price`,`sale_price`,`default`,`photos`,`id_skus`) VALUES
-- ('','','','','','','');
-- INSERT INTO `skus` (`id`,`sku_number`,`quantity`,`size`) VALUES
-- ('','','','');