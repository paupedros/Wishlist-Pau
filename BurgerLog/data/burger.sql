DROP TABLE IF EXISTS Burger;
DROP TABLE IF EXISTS Restaurant;

-- Crear la tabla "Burger"
CREATE TABLE Burger (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(5) NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    restaurant VARCHAR(100) NOT NULL,
    ingredients TEXT NOT NULL,
    image VARCHAR(255) NOT NULL,
    dateAdded DATE NOT NULL
);

-- Agregar restricciones a la tabla "Burger"
ALTER TABLE Burger
ADD PRIMARY KEY (id),
ADD CONSTRAINT chk_burger_type CHECK (type IN ('PATTY', 'SMASH')),
ADD CONSTRAINT fk_burger_restaurant FOREIGN KEY (restaurant) REFERENCES Restaurant(name),
ADD CONSTRAINT chk_valid_date CHECK (STR_TO_DATE(dateAdded, '%d/%m/%Y') IS NOT NULL);

-- Crear la tabla "Restaurant"
CREATE TABLE Restaurant (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    website VARCHAR(255) NOT NULL
);

-- Agregar restricciones a la tabla "Restaurant"
ALTER TABLE Restaurant
ADD PRIMARY KEY (id),
ADD CONSTRAINT uq_name UNIQUE (name);
