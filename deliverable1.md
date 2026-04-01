# CS 241 Project: Deliverable 1

## 0. Team Details

Meet Mehta - 2401123
Keshav Krishna - 2401104
Yashwardhan Jadhav - 2401095
Sai Bhegde - 2401066

## 1. Assumptions

```
Buyers, sellers, renters, and landlords are grouped into a single Customer entity.
To calculate the "average time the property was on the market," a Listing_Date and Txn_Date are
required.
Market time is computed as Txn_Date − Listing_Date.
When a property is re-listed for sale or rent after a previous transaction has concluded, a new
Transaction record is created with a new Listing_Date.
To handle an agent selling or renting multiple properties over time, a Transaction entity is used.
A property is strictly categorized as being for either 'Sale' or 'Rent'.
When a property is sold the Cust_ID associated with it is changed.
The Base_Price attribute represents the total asking price for sales or the monthly asking rent for
rental listings.
Each Customer and Agent provides exactly one phone number and one email address.
The Year_Built attribute is stored as a four-digit integer.
The Address attribute is decomposed into Locality and City. We assume "Guwahati" as the
default city unless otherwise specified.
Transaction table contains the historical Listing_Date and Purpose which are unrelated to
Property's current state.
After a Property is sold/rented (ie. once it is off the market) the Listing_Date and Purpose will be
NULL
Rent amount is always monthly for both Base_Price and Final_Price
```
## 2. Entities and Attributes

```
Agent
Agent_ID (PK)
Name
Phone
```

```
Email
Property
Property_ID (PK)
Address
City (e.g., Guwahati)
Locality (e.g., G.S. Road)
Type (House/Flat)
Size_Sqft
Bedrooms
Year_Built
Base_Price (Expected selling price or rent amount)
Listing_Date
Purpose (Sale/Rent/NULL)
Customer
Cust_ID (PK)
Name
Phone
Email
Transaction
Txn_ID (PK)
Txn_Date
Final_Amount (Actual sold price or final rent amount)
Listing_Date
Purpose (Sale/Rent)
```
## 3. Relationships & Cardinalities


```
Relationship
Name
```
```
Entity 1 Entity 2 Cardinality Description
```
```
Owns / Sells Customer Property 1 : N One customer (Owner/Seller) can list
multiple properties for rent/sale, but a
property is listed by exactly one customer.
Facilitates Agent Transaction 1 : N One agent can do many transactions, but a
single transaction is done by exactly one
agent.
Involves Property Transaction 1 : N A property can be sold/rented multiple
times over its lifetime.
Buys / Rents Customer Transaction 1 : N A customer (Buyer/Renter) can participate in
multiple transactions, but a single
transaction involves exactly one customer.
```
## 4. E-R Diagram

**Cardinality Legend:**

```
---> indicates 1 .. 1 (Exactly One)
--- indicates 0 ..* (Zero to Many)
```
```
CUSTOMER
Cust_ID
Name
Phone
Email
```
```
TRANSACTION
Txn_ID
Txn_Date
Final_Amount
Listing_Date
Purpose
PROPERTY
Property_ID
Address
City
Locality
Type
Size_Sqft
Bedrooms
Year_Built
Base_Price
Listing_Date
Purpose
```
```
AGENT
Agent_ID
Name
Phone
Email
Rents
```
```
Facilitates
```
```
Involves Owns / Sells
```
```
Buys
```

## 5. Team Contributions

All team members collaborated equally on the conceptual design of this database. The establishment of
assumptions, entity definitions, and the creation of the relationship/cardinality tables was done
collectively as a group.

## 6. AI Usage

AI was used only for creating the diagram in mermaid from hand drawn.
Prompt used:

```
[Attached photo of hand drawn diagram]
Can i get this diagram exactly in mermaid.
IT HAS TO BE EXACT. INCLUDING THE DIAMOND SHAPE FOR RELATIONSHIPS AND RECTANGLE
TABLES
```

