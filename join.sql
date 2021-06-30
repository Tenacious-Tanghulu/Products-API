 SELECT * from styles inner join photos ON styles.id = photos.styles_id where styles.products_id = 1;



 SELECT (cols) from styles inner join photos ON styles.id = photos.styles_id inner join skus ON styles.id = skus.styleId where styles.products_id = 1;


--GET/products:

SELECT * FROM product
LIMIT  (x)
OFFSET (x)
ORDER BY id
-- limit # of rows returned
-- Offest starts at certain # down (page# x results/page)


--GET /products/:product_id

SELECT * FROM product WHERE id = product_id
--add features
SELECT * FROM features WHERE product_id = product_id

SELECT product.id, product.name, product.slogan, product.description, product.category, product.default_price, features.feature, features.value from product INNER JOIN features ON product.id = features.products_id WHERE product.id = 4;

--GET /products/:product_Id/stlyes

SELECT style_name, original_price, sale_price, isdefault FROM styles WHERE products_id = 34;
SELECT thumbnail, url FROM photos WHERE styles_id = ???;
SELECT size, quantity FROM skus WHERE styleId = ???;