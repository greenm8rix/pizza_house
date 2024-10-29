

-- Database Normalization Examples from 1NF to 5NF

-- First Normal Form (1NF)


-- Drop table if it exists (for repeatability)
DROP TABLE IF EXISTS PlayerInventory;

-- Create the PlayerInventory table in 1NF
CREATE TABLE PlayerInventory (
    Player_ID VARCHAR(50),
    Item_Type VARCHAR(50),
    Item_Quantity INT,
    PRIMARY KEY (Player_ID, Item_Type)
);

-- Insert data into PlayerInventory
INSERT INTO PlayerInventory (Player_ID, Item_Type, Item_Quantity)
VALUES ('trev73', 'shields', 3),
       ('trev73', 'arrows', 5),
       ('jdog21', 'arrows', 2);


-- Second Normal Form (2NF)-- 

-- Drop existing tables if they exist
DROP TABLE IF EXISTS PlayerInventory;
DROP TABLE IF EXISTS Player;

-- Create the Player table
CREATE TABLE Player (
    Player_ID VARCHAR(50) PRIMARY KEY,
    Player_Rating VARCHAR(50)
);

-- Create the PlayerInventory table without Player_Rating
CREATE TABLE PlayerInventory (
    Player_ID VARCHAR(50),
    Item_Type VARCHAR(50),
    Item_Quantity INT,
    PRIMARY KEY (Player_ID, Item_Type),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID)
);

-- Insert data into Player
INSERT INTO Player (Player_ID, Player_Rating)
VALUES ('trev73', 'Advanced'),
       ('jdog21', 'Intermediate');

-- Insert data into PlayerInventory
INSERT INTO PlayerInventory (Player_ID, Item_Type, Item_Quantity)
VALUES ('trev73', 'shields', 3),
       ('trev73', 'arrows', 5);


-- Third Normal Form (3NF)


-- Drop existing tables if they exist
DROP TABLE IF EXISTS PlayerInventory;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS SkillToRating;

-- Create the updated Player table
CREATE TABLE Player (
    Player_ID VARCHAR(50) PRIMARY KEY,
    Player_Skill_Level INT
);

-- Create the SkillToRating table
CREATE TABLE SkillToRating (
    Skill_Level INT PRIMARY KEY,
    Player_Rating VARCHAR(50)
);

-- Recreate the PlayerInventory table
CREATE TABLE PlayerInventory (
    Player_ID VARCHAR(50),
    Item_Type VARCHAR(50),
    Item_Quantity INT,
    PRIMARY KEY (Player_ID, Item_Type),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID)
);

-- Insert data into Player
INSERT INTO Player (Player_ID, Player_Skill_Level)
VALUES ('trev73', 8), ('jdog21', 5);

-- Insert data into SkillToRating
INSERT INTO SkillToRating (Skill_Level, Player_Rating)
VALUES (1, 'Beginner'), (2, 'Beginner'), (3, 'Beginner'),
       (4, 'Intermediate'), (5, 'Intermediate'), (6, 'Intermediate'),
       (7, 'Advanced'), (8, 'Advanced'), (9, 'Advanced');


-- Fourth Normal Form (4NF)


-- Drop existing tables if they exist
DROP TABLE IF EXISTS PlayerInventory;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS SkillToRating;

-- Create the Model table
CREATE TABLE Model (
    Model_ID VARCHAR(50) PRIMARY KEY
);

-- Create the ModelColors table
CREATE TABLE ModelColors (
    Model_ID VARCHAR(50),
    Color VARCHAR(50),
    PRIMARY KEY (Model_ID, Color),
    FOREIGN KEY (Model_ID) REFERENCES Model(Model_ID)
);

-- Create the ModelStyles table
CREATE TABLE ModelStyles (
    Model_ID VARCHAR(50),
    Style VARCHAR(50),
    PRIMARY KEY (Model_ID, Style),
    FOREIGN KEY (Model_ID) REFERENCES Model(Model_ID)
);

-- Insert data into Model
INSERT INTO Model (Model_ID) VALUES ('Prairie');

-- Insert data into ModelColors
INSERT INTO ModelColors (Model_ID, Color)
VALUES ('Prairie', 'brown'),
       ('Prairie', 'beige');

-- Insert data into ModelStyles
INSERT INTO ModelStyles (Model_ID, Style)
VALUES ('Prairie', 'bungalow'),
       ('Prairie', 'schoolhouse');


-- Fifth Normal Form (5NF)


-- Drop existing tables if they exist
DROP TABLE IF EXISTS ModelStyles;
DROP TABLE IF EXISTS ModelColors;
DROP TABLE IF EXISTS Model;

-- Create the People table
CREATE TABLE People (
    Person_ID VARCHAR(50) PRIMARY KEY
);

-- Create the Brands table
CREATE TABLE Brands (
    Brand_ID VARCHAR(50) PRIMARY KEY
);

-- Create the Flavors table
CREATE TABLE Flavors (
    Flavor_ID VARCHAR(50) PRIMARY KEY
);

-- Create the PeopleBrands table
CREATE TABLE PeopleBrands (
    Person_ID VARCHAR(50),
    Brand_ID VARCHAR(50),
    PRIMARY KEY (Person_ID, Brand_ID),
    FOREIGN KEY (Person_ID) REFERENCES People(Person_ID),
    FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID)
);

-- Create the PeopleFlavors table
CREATE TABLE PeopleFlavors (
    Person_ID VARCHAR(50),
    Flavor_ID VARCHAR(50),
    PRIMARY KEY (Person_ID, Flavor_ID),
    FOREIGN KEY (Person_ID) REFERENCES People(Person_ID),
    FOREIGN KEY (Flavor_ID) REFERENCES Flavors(Flavor_ID)
);

-- Create the BrandFlavors table
CREATE TABLE BrandFlavors (
    Brand_ID VARCHAR(50),
    Flavor_ID VARCHAR(50),
    PRIMARY KEY (Brand_ID, Flavor_ID),
    FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID),
    FOREIGN KEY (Flavor_ID) REFERENCES Flavors(Flavor_ID)
);

-- Insert data into People
INSERT INTO People (Person_ID) VALUES ('Jason'), ('Suzy');

-- Insert data into Brands
INSERT INTO Brands (Brand_ID) VALUES ('Frosty'), ('Alpine'), ('IceQueen');

-- Insert data into Flavors
INSERT INTO Flavors (Flavor_ID)
VALUES ('vanilla'),
       ('chocolate'),
       ('strawberry'),
       ('mint_chocolate_chip'),
       ('rum_raisin');

-- Insert data into PeopleBrands
INSERT INTO PeopleBrands (Person_ID, Brand_ID)
VALUES ('Jason', 'Frosty'),
       ('Jason', 'Alpine'),
       ('Suzy', 'Alpine'),
       ('Suzy', 'IceQueen');

-- Insert data into PeopleFlavors
INSERT INTO PeopleFlavors (Person_ID, Flavor_ID)
VALUES ('Jason', 'vanilla'),
       ('Jason', 'chocolate'),
       ('Suzy', 'rum_raisin'),
       ('Suzy', 'mint_chocolate_chip'),
       ('Suzy', 'strawberry');

-- Insert data into BrandFlavors
INSERT INTO BrandFlavors (Brand_ID, Flavor_ID)
VALUES ('Frosty', 'vanilla'),
       ('Frosty', 'chocolate'),
       ('Frosty', 'strawberry'),
       ('Frosty', 'mint_chocolate_chip'),
       ('Alpine', 'vanilla'),
       ('Alpine', 'rum_raisin'),
       ('IceQueen', 'vanilla'),
       ('IceQueen', 'strawberry'),
       ('IceQueen', 'mint_chocolate_chip');
