
-- Database Normalization Examples (1NF to 5NF)
-- Each example demonstrates the applicable CREATE, INSERT, and DELETE operations

-- Example 1: First Normal Form (1NF)
CREATE TABLE Beatle_Height (
    Beatle VARCHAR(50) PRIMARY KEY,
    Height_In_Cm INT
);

-- Inserting records
INSERT INTO Beatle_Height (Beatle, Height_In_Cm) VALUES
('John', 178),
('Paul', 180),
('George', 175),
('Ringo', 170);

-- Deleting a record
DELETE FROM Beatle_Height WHERE Beatle = 'Ringo';

-- Example 2: Second Normal Form (2NF)
-- Player table with Player ID and Rating
CREATE TABLE Player (
    Player_ID VARCHAR(50) PRIMARY KEY,
    Player_Rating VARCHAR(50)
);

-- Player Inventory table for items associated with a player
CREATE TABLE Player_Inventory (
    Player_ID VARCHAR(50),
    Item_Type VARCHAR(50),
    Item_Quantity INT,
    PRIMARY KEY (Player_ID, Item_Type),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID)
);

-- Inserting records
INSERT INTO Player (Player_ID, Player_Rating) VALUES
('jdog21', 'Intermediate'),
('trev73', 'Advanced');

INSERT INTO Player_Inventory (Player_ID, Item_Type, Item_Quantity) VALUES
('jdog21', 'arrows', 5),
('jdog21', 'shields', 2),
('trev73', 'amulets', 3);

-- Deleting a record
DELETE FROM Player_Inventory WHERE Player_ID = 'jdog21' AND Item_Type = 'arrows';

-- Example 3: Third Normal Form (3NF) with Boyce-Codd Normal Form (BCNF)
-- Separate Player_Skill_Level table from Player table
CREATE TABLE Player_Skill_Level (
    Skill_Level INT PRIMARY KEY,
    Player_Rating VARCHAR(50)
);

CREATE TABLE Player_Details (
    Player_ID VARCHAR(50) PRIMARY KEY,
    Skill_Level INT,
    FOREIGN KEY (Skill_Level) REFERENCES Player_Skill_Level(Skill_Level)
);

-- Inserting records
INSERT INTO Player_Skill_Level (Skill_Level, Player_Rating) VALUES
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Advanced');

INSERT INTO Player_Details (Player_ID, Skill_Level) VALUES
('gila19', 1),
('jdog21', 2);

-- Deleting a record
DELETE FROM Player_Details WHERE Player_ID = 'gila19';

-- Example 4: Fourth Normal Form (4NF)
-- Separate tables for Model Colors and Model Styles to avoid multivalued dependency
CREATE TABLE Model_Colors_Available (
    Model VARCHAR(50),
    Color VARCHAR(50),
    PRIMARY KEY (Model, Color)
);

CREATE TABLE Model_Styles_Available (
    Model VARCHAR(50),
    Style VARCHAR(50),
    PRIMARY KEY (Model, Style)
);

-- Inserting records
INSERT INTO Model_Colors_Available (Model, Color) VALUES
('Prairie', 'brown'),
('Prairie', 'beige');

INSERT INTO Model_Styles_Available (Model, Style) VALUES
('Prairie', 'bungalow'),
('Prairie', 'schoolhouse');

-- Deleting a record
DELETE FROM Model_Colors_Available WHERE Model = 'Prairie' AND Color = 'brown';

-- Example 5: Fifth Normal Form (5NF)
-- Creating three separate tables for Brands, Flavors, and Person Preferences
CREATE TABLE Brand_Flavors (
    Brand VARCHAR(50),
    Flavor VARCHAR(50),
    PRIMARY KEY (Brand, Flavor)
);

CREATE TABLE Person_Brands (
    Person VARCHAR(50),
    Brand VARCHAR(50),
    PRIMARY KEY (Person, Brand)
);

CREATE TABLE Person_Flavors (
    Person VARCHAR(50),
    Flavor VARCHAR(50),
    PRIMARY KEY (Person, Flavor)
);

-- Inserting records
INSERT INTO Brand_Flavors (Brand, Flavor) VALUES
('Frosty', 'vanilla'),
('Frosty', 'chocolate');

INSERT INTO Person_Brands (Person, Brand) VALUES
('Jason', 'Frosty'),
('Jason', 'Alpine');

INSERT INTO Person_Flavors (Person, Flavor) VALUES
('Jason', 'vanilla'),
('Jason', 'chocolate');

-- Deleting a record
DELETE FROM Person_Brands WHERE Person = 'Jason' AND Brand = 'Frosty';
