-- First Normal Form (1NF)
-- Entity: PlayerInventory
-- Attributes:

-- Player_ID (PK, VARCHAR(50))
-- Item_Type (PK, VARCHAR(50))
-- Item_Quantity (INT)
-- Primary Key: Composite key (Player_ID, Item_Type)

-- Relationships:

-- At this level, there are no relationships with other tables.
-- Second Normal Form (2NF)
-- Entity: Player
-- Attributes:

-- Player_ID (PK, VARCHAR(50))
-- Player_Rating (VARCHAR(50))
-- Primary Key: Player_ID

-- Entity: PlayerInventory
-- Attributes:

-- Player_ID (PK, FK, VARCHAR(50))
-- Item_Type (PK, VARCHAR(50))
-- Item_Quantity (INT)
-- Primary Key: Composite key (Player_ID, Item_Type)

-- Foreign Key:

-- Player_ID references Player(Player_ID)
-- Relationships:

-- Player (1) —— (M) PlayerInventory
-- One player can have many inventory items.
-- Each inventory item belongs to one player.
-- Third Normal Form (3NF)
-- Entity: Player
-- Attributes:

-- Player_ID (PK, VARCHAR(50))
-- Player_Skill_Level (INT)
-- Primary Key: Player_ID

-- Entity: SkillToRating
-- Attributes:

-- Skill_Level (PK, INT)
-- Player_Rating (VARCHAR(50))
-- Primary Key: Skill_Level

-- Entity: PlayerInventory
-- Attributes:

-- Player_ID (PK, FK, VARCHAR(50))
-- Item_Type (PK, VARCHAR(50))
-- Item_Quantity (INT)
-- Primary Key: Composite key (Player_ID, Item_Type)

-- Foreign Key:

-- Player_ID references Player(Player_ID)
-- Relationships:

-- Player (1) —— (M) PlayerInventory
-- Player (M) —— (1) SkillToRating
-- Through Player_Skill_Level in Player and Skill_Level in SkillToRating.
-- Fourth Normal Form (4NF)
-- Entity: Model
-- Attributes:

-- Model_ID (PK, VARCHAR(50))
-- Primary Key: Model_ID

-- Entity: ModelColors
-- Attributes:

-- Model_ID (PK, FK, VARCHAR(50))
-- Color (PK, VARCHAR(50))
-- Primary Key: Composite key (Model_ID, Color)

-- Foreign Key:

-- Model_ID references Model(Model_ID)
-- Entity: ModelStyles
-- Attributes:

-- Model_ID (PK, FK, VARCHAR(50))
-- Style (PK, VARCHAR(50))
-- Primary Key: Composite key (Model_ID, Style)

-- Foreign Key:

-- Model_ID references Model(Model_ID)
-- Relationships:

-- Model (1) —— (M) ModelColors
-- Model (1) —— (M) ModelStyles
-- Fifth Normal Form (5NF)
-- Entity: People
-- Attributes:

-- Person_ID (PK, VARCHAR(50))
-- Primary Key: Person_ID

-- Entity: Brands
-- Attributes:

-- Brand_ID (PK, VARCHAR(50))
-- Primary Key: Brand_ID

-- Entity: Flavors
-- Attributes:

-- Flavor_ID (PK, VARCHAR(50))
-- Primary Key: Flavor_ID

-- Associative Entity: PeopleBrands
-- Attributes:

-- Person_ID (PK, FK, VARCHAR(50))
-- Brand_ID (PK, FK, VARCHAR(50))
-- Primary Key: Composite key (Person_ID, Brand_ID)

-- Foreign Keys:

-- Person_ID references People(Person_ID)
-- Brand_ID references Brands(Brand_ID)
-- Relationships:

-- People (M) —— (M) Brands (through PeopleBrands)
-- Associative Entity: PeopleFlavors
-- Attributes:

-- Person_ID (PK, FK, VARCHAR(50))
-- Flavor_ID (PK, FK, VARCHAR(50))
-- Primary Key: Composite key (Person_ID, Flavor_ID)

-- Foreign Keys:

-- Person_ID references People(Person_ID)
-- Flavor_ID references Flavors(Flavor_ID)
-- Relationships:

-- People (M) —— (M) Flavors (through PeopleFlavors)
-- Associative Entity: BrandFlavors
-- Attributes:

-- Brand_ID (PK, FK, VARCHAR(50))
-- Flavor_ID (PK, FK, VARCHAR(50))
-- Primary Key: Composite key (Brand_ID, Flavor_ID)

-- Foreign Keys:

-- Brand_ID references Brands(Brand_ID)
-- Flavor_ID references Flavors(Flavor_ID)
-- Relationships:

-- Brands (M) —— (M) Flavors (through BrandFlavors)


-- ======================================================
-- Database Normalization Examples from 1NF to 5NF
-- ======================================================

-- ======================================================
-- First Normal Form (1NF)
-- ======================================================

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

-- Delete data example in PlayerInventory
-- Delete jdog21's arrows
DELETE FROM PlayerInventory
WHERE Player_ID = 'jdog21' AND Item_Type = 'arrows';

-- ======================================================
-- Second Normal Form (2NF)
-- ======================================================

-- To transition to 2NF, we need to modify the schema
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

-- Delete data example in Player
-- Delete player 'jdog21'
DELETE FROM Player WHERE Player_ID = 'jdog21';

-- ======================================================
-- Third Normal Form (3NF)
-- ======================================================

-- Modify the schema to remove transitive dependencies
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

-- Insert data into PlayerInventory
INSERT INTO PlayerInventory (Player_ID, Item_Type, Item_Quantity)
VALUES ('trev73', 'shields', 3),
       ('trev73', 'arrows', 5);

-- Delete data example in SkillToRating
-- Delete skill level 9
DELETE FROM SkillToRating WHERE Skill_Level = 9;

-- ======================================================
-- Fourth Normal Form (4NF)
-- ======================================================

-- Transition to a new example for 4NF
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

-- Delete data example in ModelColors
-- Delete color 'beige' for model 'Prairie'
DELETE FROM ModelColors WHERE Model_ID = 'Prairie' AND Color = 'beige';

-- ======================================================
-- Fifth Normal Form (5NF)
-- ======================================================

-- Transition to a new example for 5NF
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
VALUES ('vanilla'), 'chocolate', 'strawberry', 'mint_chocolate_chip', 'rum_raisin';

-- Insert data into PeopleBrands
-- Jason likes Frosty and Alpine
INSERT INTO PeopleBrands (Person_ID, Brand_ID)
VALUES ('Jason', 'Frosty'),
       ('Jason', 'Alpine');

-- Suzy likes Alpine and IceQueen
INSERT INTO PeopleBrands (Person_ID, Brand_ID)
VALUES ('Suzy', 'Alpine'),
       ('Suzy', 'IceQueen');

-- Insert data into PeopleFlavors
-- Jason likes vanilla and chocolate
INSERT INTO PeopleFlavors (Person_ID, Flavor_ID)
VALUES ('Jason', 'vanilla'),
       ('Jason', 'chocolate');

-- Suzy likes rum raisin, mint chocolate chip, and strawberry
INSERT INTO PeopleFlavors (Person_ID, Flavor_ID)
VALUES ('Suzy', 'rum_raisin'),
       ('Suzy', 'mint_chocolate_chip'),
       ('Suzy', 'strawberry');

-- Insert data into BrandFlavors
-- Frosty offers vanilla, chocolate, strawberry, mint chocolate chip
INSERT INTO BrandFlavors (Brand_ID, Flavor_ID)
VALUES ('Frosty', 'vanilla'),
       ('Frosty', 'chocolate'),
       ('Frosty', 'strawberry'),
       ('Frosty', 'mint_chocolate_chip');

-- Alpine offers vanilla and rum raisin
INSERT INTO BrandFlavors (Brand_ID, Flavor_ID)
VALUES ('Alpine', 'vanilla'),
       ('Alpine', 'rum_raisin');

-- IceQueen offers vanilla, strawberry, and mint chocolate chip
INSERT INTO BrandFlavors (Brand_ID, Flavor_ID)
VALUES ('IceQueen', 'vanilla'),
       ('IceQueen', 'strawberry'),
       ('IceQueen', 'mint_chocolate_chip');

-- Update example: Suzy now likes Frosty
INSERT INTO PeopleBrands (Person_ID, Brand_ID)
VALUES ('Suzy', 'Frosty');

-- Delete data example in PeopleBrands
-- Suzy no longer likes IceQueen
DELETE FROM PeopleBrands WHERE Person_ID = 'Suzy' AND Brand_ID = 'IceQueen';
