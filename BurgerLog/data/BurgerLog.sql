DROP TABLE IF EXISTS Burger;
DROP TABLE IF EXISTS Restaurant;

-- Crear la tabla "Restaurant"
CREATE TABLE Restaurant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website VARCHAR(255) NOT NULL
);

-- Agregar restricciones a la tabla "Restaurant"
ALTER TABLE Restaurant
ADD CONSTRAINT uq_name UNIQUE restaurant(name);

-- Crear la tabla "Burger"
CREATE TABLE Burger (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(5) NOT NULL,
    price DECIMAL(4, 2) NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    restaurant VARCHAR(100) NOT NULL,
    ingredients TEXT NOT NULL,
    image VARCHAR(255) NOT NULL,
    dateAdded DATE NOT NULL
);

-- Agregar restricciones a la tabla "Burger"
ALTER TABLE Burger
ADD CONSTRAINT chk_burger_type CHECK (type IN ('PATTY', 'SMASH')),
ADD CONSTRAINT fk_burger_restaurant FOREIGN KEY(restaurant) REFERENCES Restaurant(name);


-- INSERTS --

-- Insertar datos en la tabla "Restaurant"
INSERT INTO Restaurant (name, website) VALUES
    ('Antonia''s Burger', 'https://www.instagram.com/antoniasburger/'),
    ('Monty''s Bar', 'https://montys-bar-premia.negocio.site/'),
    ('Hideout', 'https://hideout-burger.com/');

-- Insertar datos en la tabla "Burger"
INSERT INTO Burger (name, type, price, rating, restaurant, ingredients, image, dateAdded) VALUES
    ('Cheeseburger', 'SMASH', 9, 2, 'Antonia''s Burger', '200g beef, brioche bread, cheese slice, pickled gherkin, grilled onion, mustard, ketchup.', 'images/CheeseBrgAntonias.jpg', '2023-12-30'),
    ('Choriburguer', 'PATTY', 9, 2, 'Monty''s Bar', '180g beef, tomato sauce, lettuce, tomato, double cheese and fried egg (a touch of spicy).', 'images/ChoriBrg.jpg', '2024-01-02'),
    ('Hideout Burger', 'SMASH', 11.9, 2.5, 'Hideout', 'Brioche bread, double 100% beef smashburger with American cheese, crispy bacon slices, homemade pickled gherkins and our slightly spicy HIDEOUT sauce.', 'images/HideoutBurger.jpg', '2024-01-13');

