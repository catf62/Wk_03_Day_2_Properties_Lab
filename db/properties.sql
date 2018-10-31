DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  price INT,
  number_of_bedrooms INT,
  year_of_build INT,
  buy_let VARCHAR(255),
  square_footage INT,
  build_type VARCHAR(255)
);
