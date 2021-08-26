CREATE DATABASE store_management COLLATE 'utf8_general_ci';

CREATE TABLE products(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    code INTEGER(12) NOT NULL  ,
    description TEXT ,
    price FLOAT UNSIGNED NOT NULL,
    suppliar_id INTEGER UNSIGNED NOT NULL,
    created_at  DATETIME  NOT NUll DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(suppliar_id) REFERENCES suppliar(id)

);

CREATE TABLE suppliar(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    phone INTEGER(11) UNSIGNED NOT NULL ,
    email VARCHAR(255) NOT NULL UNIQUE,
    brif_data TEXT, 
    created_at  DATETIME  NOT NUll DEFAULT NOW(),
    PRIMARY KEY(id)
);

CREATE TABLE stores(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    address VARCHAR(255) NOT NULL, 
    created_at  DATETIME  NOT NUll DEFAULT NOW(),
    PRIMARY KEY(id)
);

CREATE TABLE store_product(
   product_id INTEGER UNSIGNED NOT NULL ,
   store_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(store_id) REFERENCES stores(id)
);

CREATE TABLE governates(
     id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
     name VARCHAR(255) NOT NULL, 
     PRIMARY KEY(id)
);

CREATE TABLE governate_store(
     governate_id INTEGER UNSIGNED NOT NULL ,
     store_id INTEGER UNSIGNED NOT NULL,
     FOREIGN KEY(governate_id) REFERENCES governates(id),
    FOREIGN KEY(store_id) REFERENCES stores(id)
);

INSERT INTO suppliar(name, phone, email)
VALUES('Esraa Said', 01095578613, 'esraa@gmail.com'),
('Ahmed Adly', 01090694466, 'Ahmed@gmail.com'),
('Amin Mahmoud ', 01063795563, 'Amin@gmail.com'),
('Aliaa Ali', 01096999843 , 'Aliaa@gmail.com');


INSERT INTO products(name, code, price, suppliar_id)
VALUES('oil', 275493483916, '20.00',1),
('milk', 265293453219, '10.00',2),
('makarona', 205469433954, '15.00',3),
('sugar', 376483483014, '8.00',4);


INSERT INTO stores(name, address)
VALUES('store1', 'AL-jlaa Streat - zagazig ' ),
('store2', 'Abd Aatti Streat - shubra' ),
('store3', 'Abas AL-AKAD - Masr Al Gedida'),
('store4', 'KAlead Ebn AL-Walead - Belbis' ),

INSERT INTO governates(name)
VALUES('Cairo' ),
('Sharqia' ),
('Mansora' ),
('Monofia' );