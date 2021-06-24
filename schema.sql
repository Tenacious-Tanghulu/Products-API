
DROP TABLE IF EXISTS `Product`;

--add not null
--price is positive
--character limits
--foriegn key constraints

--Generated always as identity (autoincrement)


CREATE TABLE Product (
  id INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  slogan VARCHAR(1000),
  description VARCHAR(1000),
  category VARCHAR(30) NOT NULL,
  default_price INT NOT NULL CHECK (default_price > 0),
  id_Features INTEGER,
  related INT,
  PRIMARY KEY (id)
);

-- ---
-- Table 'Features'
--
-- ---

DROP TABLE IF EXISTS Features;

CREATE TABLE Features (
  id INTEGER NOT NULL AUTO_INCREMENT,
  feature VARCHAR(30) NOT NULL,
  value VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  original_price INT NOT NULL CHECK (original_price > 0),
  sale_price INT CHECK (sale_price > 0),
  default BOOLEAN NOT NULL,
  photos VARCHAR,
  id_Product INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'skus'
--
-- ---

DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id INTEGER NOT NULL AUTO_INCREMENT,
  sku_number INTEGER NOT NULL,
  quantity INT NOT NULL,
  size VARCHAR NOT NULL,
  id_styles INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE Product ADD FOREIGN KEY (id_Features) REFERENCES Features (id);
ALTER TABLE Product ADD FOREIGN KEY (related) REFERENCES Product (id);
ALTER TABLE styles ADD FOREIGN KEY (id_Product) REFERENCES Product (id);
ALTER TABLE skus ADD FOREIGN KEY (id_styles) REFERENCES styles (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Product` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Product` (`id`,`name`,`slogan`,`description`,`category`,`default_price`,`id_Features`,`new field`,`related`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `Features` (`id`,`feature`,`value`) VALUES
-- ('','','');
-- INSERT INTO `styles` (`id`,`name`,`original_price`,`sale_price`,`default`,`photos`,`id_Product`) VALUES
-- ('','','','','','','');
-- INSERT INTO `skus` (`id`,`sku_number`,`quantity`,`size`,`id_styles`) VALUES
-- ('','','','','');