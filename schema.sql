


CREATE TABLE product (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  slogan VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  category VARCHAR(50) NOT NULL,
  default_price INTEGER NOT NULL CHECK (default_price > -1),
  PRIMARY KEY (id)
);

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  feature VARCHAR(50) NOT NULL,
  value VARCHAR(50) NOT NULL,
  products_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  style_name VARCHAR(50) NOT NULL,
  original_price INTEGER NOT NULL,
  sale_price VARCHAR(20),
  isdefault BOOLEAN NOT NULL,
  products_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);
-- ---
-- Table 'skus'
--
-- ---
DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  styleId INTEGER,
  quantity INTEGER NOT NULL,
  size VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
--
-- ---

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  thumbnail TEXT NOT NULL,
  url VARCHAR(1000) NOT NULL,
  styles_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);


-- ---
-- Table 'related_products'
--
-- ---

DROP TABLE IF EXISTS related;

CREATE TABLE related (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  products_id INTEGER NOT NULL,
  related_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE features ADD FOREIGN KEY (products_id) REFERENCES product (id);
ALTER TABLE styles ADD FOREIGN KEY (products_id) REFERENCES product (id);
ALTER TABLE photos ADD FOREIGN KEY (styles_id) REFERENCES styles (id);
ALTER TABLE style_skus ADD FOREIGN KEY (styles_id) REFERENCES styles (id);
ALTER TABLE style_skus ADD FOREIGN KEY (skus_id) REFERENCES skus (id);
ALTER TABLE related ADD FOREIGN KEY (products_id) REFERENCES product (id);
ALTER TABLE related ADD FOREIGN KEY (related_id) REFERENCES product (id);


-- Table loading commands

CREATE INDEX idx_styles_product ON styles(products_id);
CREATE INDEX idx_photos_styles ON photos(styles_id);
CREATE INDEX idx_skus_styles ON skus(styleId);