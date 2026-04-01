# CS 241 Project: Deliverable 2

# Design

## 1. Team Details

| Name | Roll No. |
|---|---|
| Meet Mehta | 2401123 |
| Keshav Krishna | 2401104 |
| Yashwardhan Jadhav | 2401095 |
| Sai Bhegde | 2401066 |

## 2. Relational Schema

The relational design is derived directly from the E-R diagram in Deliverable 1. All four entities map to
relations, and all relationships are captured via foreign keys.

## 1. 1 Table: Agent

| Column | Type | Constraints |
|---|---|---|
| Agent_ID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Name | VARCHAR(100) | NOT NULL |
| Phone | VARCHAR(15) | NOT NULL, UNIQUE |
| Email | VARCHAR(100) | NOT NULL, UNIQUE |

## 1. 2 Table: Customer

| Column | Type | Constraints |
|---|---|---|
| Cust_ID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Name | VARCHAR(100) | NOT NULL |
| Phone | VARCHAR(15) | NOT NULL, UNIQUE |
| Email | VARCHAR(100) | NOT NULL, UNIQUE |

### 1. 3 Table: Property

| Column | Type | Constraints |
|---|---|---|
| Property_ID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Address | VARCHAR(255) | NOT NULL |
| City | VARCHAR(50) | NOT NULL, DEFAULT 'Guwahati' |
| Locality | VARCHAR(100) | NOT NULL |
| Type | ENUM('House','Flat') | NOT NULL |
| Size_Sqft | INT | NOT NULL, CHECK > 0 |
| Bedrooms | INT | NOT NULL, CHECK >= 0 |
| Year_Built | INT | NOT NULL, CHECK 1800 - 2100 |
| Base_Price | DECIMAL(15, 2) | NOT NULL, CHECK > 0 |
| Listing_Date | DATE | NULL (off-market) |
| Purpose | ENUM('Sale','Rent') | NULL (off-market) |
| Cust_ID | INT | FOREIGN KEY -> Customer(Cust_ID) |

**Notes:**

- `Cust_ID` represents the current owner/landlord of the property (relationship: Owns/Sells).
- When a property is sold, `Cust_ID` is updated to the new owner.
- When a property is off the market, `Listing_Date` and `Purpose` are set to `NULL`.
### 1. 4 Table: Transaction


| Column | Type | Constraints |
|---|---|---|
| Txn_ID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Txn_Date | DATE | NOT NULL |
| Final_Amount | DECIMAL(15, 2) | NOT NULL, CHECK > 0 |
| Listing_Date | DATE | NOT NULL |
| Purpose | ENUM('Sale','Rent') | NOT NULL |
| Property_ID | INT | FOREIGN KEY -> Property(Property_ID) |
| Agent_ID | INT | FOREIGN KEY -> Agent(Agent_ID) |
| Cust_ID | INT | FOREIGN KEY -> Customer(Cust_ID) |

**Notes:**

- `Cust_ID` here is the buyer/renter (relationship: Buys/Rents).
- `Listing_Date` is a historical snapshot from when the property was listed.
- A `CHECK` constraint ensures `Txn_Date >= Listing_Date`.
- Three foreign keys encode three 1:N relationships from the E-R diagram:
  - Facilitates -> `Agent_ID`
  - Involves -> `Property_ID`
  - Buys/Rents -> `Cust_ID`

## 3. Indices


| Index Name | Table | Column(s) | Rationale |
|---|---|---|---|
| idx_property_locality | Property | Locality | Filter by area (e.g., G.S. Road) |
| idx_property_city | Property | City | Filter by city |
| idx_property_purpose | Property | Purpose | Filter Sale vs Rent |
| idx_property_type | Property | Type | Filter House vs Flat |
| idx_property_year_built | Property | Year_Built | Filter by construction year |
| idx_property_base_price | Property | Base_Price | Range queries on price |
| idx_property_owner | Property | Cust_ID | JOIN with Customer |
| idx_txn_date | Transaction | Txn_Date | Filter by year |
| idx_txn_purpose | Transaction | Purpose | Filter Sale vs Rent |
| idx_txn_agent | Transaction | Agent_ID | JOIN with Agent |
| idx_txn_property | Transaction | Property_ID | JOIN with Property |
| idx_txn_customer | Transaction | Cust_ID | JOIN with Customer |

## 4. Data Summary

| Table | Row Count | Notes |
|---|---|---|
| Agent | 15 | Real estate agents |
| Customer | 25 | Owners, buyers, and renters |
| Property | 30 | Mix of House/Flat |
| Transaction | 30 | Spanning 2017 - 2025 (Sale and Rent) |

### Cities Covered

Guwahati, Mumbai, Delhi, Kolkata, Bangalore

### Property Status Distribution

- For Sale: 12 properties
- For Rent: 12 properties
- Off Market: 6 properties

## 5. Team Contributions

| Member | Contribution |
|---|---|
| Meet Mehta | Schema design |
| Keshav Krishna | Data generation, transaction records |
| Yashwardhan Jadhav | Index design |
| Sai Bhegde | Data validation, constraint definitions |

All members reviewed the final deliverable collectively.

## 6. AI Usage

AI was used for:
1. **Generating realistic test data** : property addresses, agent/customer names
Key prompt used:

```
[Attached SQL Schema]
populate with realistic real estate data (30 properties (10 from guwahati, 5 each
from mumbai, delhi, banglore, kolkatta),
15 agents, 25 customers,
30 transactions spanning 2017-2025).
```

