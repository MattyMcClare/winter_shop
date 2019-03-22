DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE manufacturers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  contact VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE products(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  stock_quantity INT4,
  buying_cost INT4,
  selling_price INT4,
  manufacturer_id INT4,
  category_id INT4
);
