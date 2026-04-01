-- ============================================================
-- CS241 Project: Deliverable 2 — Relational Schema
-- Real Estate Office Database
-- ============================================================

DROP DATABASE IF EXISTS real_estate;
CREATE DATABASE real_estate;
USE real_estate;

-- ============================================================
-- Table: Agent
-- ============================================================
CREATE TABLE Agent (
    Agent_ID            INT             PRIMARY KEY AUTO_INCREMENT,
    Name                VARCHAR(100)    NOT NULL,
    Phone               VARCHAR(15)     NOT NULL UNIQUE,
    Email               VARCHAR(100)    NOT NULL UNIQUE
);

-- ============================================================
-- Table: Customer
-- Buyers, sellers, renters, and landlords are unified here.
-- ============================================================
CREATE TABLE Customer (
    Cust_ID             INT             PRIMARY KEY AUTO_INCREMENT,
    Name                VARCHAR(100)    NOT NULL,
    Phone               VARCHAR(15)     NOT NULL UNIQUE,
    Email               VARCHAR(100)    NOT NULL UNIQUE
);

-- ============================================================
-- Table: Property
-- Cust_ID is the current owner / landlord (FK → Customer).
-- Purpose is NULL when the property is off the market.
-- Listing_Date is NULL when the property is off the market.
-- ============================================================
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

-- ============================================================
-- Table: Transaction
-- Records every sale or rental that has occurred.
-- Agent_ID  → the agent who facilitated
-- Property_ID → the property involved
-- Cust_ID  → the buyer / renter
-- Listing_Date here is the historical listing date (snapshot).
-- ============================================================
CREATE TABLE Transaction (
    Txn_ID              INT             PRIMARY KEY AUTO_INCREMENT,
    Txn_Date            DATE            NOT NULL,
    Final_Amount        DECIMAL(15, 2)  NOT NULL CHECK (Final_Amount > 0),
    Listing_Date        DATE            NOT NULL,
    Purpose             ENUM('Sale', 'Rent') NOT NULL,
    Property_ID         INT             NOT NULL,
    Agent_ID            INT             NOT NULL,
    Cust_ID             INT             NOT NULL,
    CONSTRAINT fk_txn_property FOREIGN KEY (Property_ID)
        REFERENCES Property(Property_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_txn_agent FOREIGN KEY (Agent_ID)
        REFERENCES Agent(Agent_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_txn_customer FOREIGN KEY (Cust_ID)
        REFERENCES Customer(Cust_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_txn_dates CHECK (Txn_Date >= Listing_Date)
);

-- ============================================================
-- Indices
-- ============================================================

-- Speed up filtering properties by locality, city, purpose
CREATE INDEX idx_property_locality ON Property(Locality);
CREATE INDEX idx_property_city ON Property(City);
CREATE INDEX idx_property_purpose ON Property(Purpose);
CREATE INDEX idx_property_type ON Property(Type);
CREATE INDEX idx_property_year_built ON Property(Year_Built);
CREATE INDEX idx_property_base_price ON Property(Base_Price);

-- Speed up transaction lookups by date, purpose, agent
CREATE INDEX idx_txn_date ON Transaction(Txn_Date);
CREATE INDEX idx_txn_purpose ON Transaction(Purpose);
CREATE INDEX idx_txn_agent ON Transaction(Agent_ID);
CREATE INDEX idx_txn_property ON Transaction(Property_ID);
CREATE INDEX idx_txn_customer ON Transaction(Cust_ID);

-- Speed up joins on Property owner
CREATE INDEX idx_property_owner ON Property(Cust_ID);
