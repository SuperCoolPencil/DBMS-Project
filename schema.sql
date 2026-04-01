DROP DATABASE IF EXISTS real_estate;
CREATE DATABASE real_estate;
USE real_estate;

CREATE TABLE Agent (
    Agent_ID            INT             PRIMARY KEY AUTO_INCREMENT,
    Name                VARCHAR(100)    NOT NULL,
    Phone               VARCHAR(15)     NOT NULL UNIQUE,
    Email               VARCHAR(100)    NOT NULL UNIQUE
);

CREATE TABLE Customer (
    Cust_ID             INT             PRIMARY KEY AUTO_INCREMENT,
    Name                VARCHAR(100)    NOT NULL,
    Phone               VARCHAR(15)     NOT NULL UNIQUE,
    Email               VARCHAR(100)    NOT NULL UNIQUE
);

CREATE TABLE Property (
    Property_ID         INT             PRIMARY KEY AUTO_INCREMENT,
    Address             VARCHAR(255)    NOT NULL,
    City                VARCHAR(50)     NOT NULL DEFAULT 'Guwahati',
    Locality            VARCHAR(100)    NOT NULL,
    Type                ENUM('House', 'Flat') NOT NULL,
    Size_Sqft           INT             NOT NULL CHECK (Size_Sqft > 0),
    Bedrooms            INT             NOT NULL CHECK (Bedrooms >= 0),
    Year_Built          INT             NOT NULL CHECK (Year_Built >= 1800 AND Year_Built <= 2100),
    Base_Price          DECIMAL(15, 2)  NOT NULL CHECK (Base_Price > 0),
    Listing_Date        DATE            DEFAULT NULL,
    Purpose             ENUM('Sale', 'Rent') DEFAULT NULL,
    Cust_ID             INT             NOT NULL,
    CONSTRAINT fk_property_owner FOREIGN KEY (Cust_ID)
        REFERENCES Customer(Cust_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Transaction (
    Txn_ID              INT             PRIMARY KEY AUTO_INCREMENT,
    Txn_Date            DATE            NOT NULL,
    Final_Amount        DECIMAL(15, 2)  NOT NULL CHECK (Final_Amount > 0),
    Listing_Date        DATE            NOT NULL,
    Purpose             ENUM('Sale', 'Rent') NOT NULL,
    Property_ID         INT             NOT NULL,
    Agent_ID            INT             NOT NULL,
    Buyer_ID            INT             NOT NULL,
    Seller_ID           INT             NOT NULL,
    CONSTRAINT fk_txn_property FOREIGN KEY (Property_ID)
        REFERENCES Property(Property_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_txn_agent FOREIGN KEY (Agent_ID)
        REFERENCES Agent(Agent_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_txn_buyer FOREIGN KEY (Buyer_ID)
        REFERENCES Customer(Cust_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_txn_seller FOREIGN KEY (Seller_ID)
        REFERENCES Customer(Cust_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_txn_dates CHECK (Txn_Date >= Listing_Date)
);

CREATE INDEX idx_property_locality ON Property(Locality);
CREATE INDEX idx_property_city ON Property(City);
CREATE INDEX idx_property_purpose ON Property(Purpose);
CREATE INDEX idx_property_type ON Property(Type);
CREATE INDEX idx_property_year_built ON Property(Year_Built);
CREATE INDEX idx_property_base_price ON Property(Base_Price);

CREATE INDEX idx_txn_date ON Transaction(Txn_Date);
CREATE INDEX idx_txn_purpose ON Transaction(Purpose);
CREATE INDEX idx_txn_agent ON Transaction(Agent_ID);
CREATE INDEX idx_txn_property ON Transaction(Property_ID);
CREATE INDEX idx_txn_buyer ON Transaction(Buyer_ID);
CREATE INDEX idx_txn_seller ON Transaction(Seller_ID);

CREATE INDEX idx_property_owner ON Property(Cust_ID);
