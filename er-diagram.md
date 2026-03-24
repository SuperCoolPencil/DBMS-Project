# CS241 Project: Deliverable 1 - Conceptual E-R Design

## 1. Assumptions

* Buyers, sellers, renters, and landlords are grouped into a single `Customer` entity with a `Role` attribute. 
* To calculate the "average time the property was on the market," a `Listing_Date` is required for properties, and a `Txn_Date` is required for sales/rentals. 
* To handle an agent selling or renting multiple properties over time, a `Transaction` entity is used.
* A property is strictly categorized as being for either 'Sale' or 'Rent'. 
* The `Base_Price` attribute represents the total asking price for sales or the monthly asking rent for rental listings.
* If a person wants to both own/sell property and rent/buy property, they must register twice.
* Each Customer and Agent provides exactly one phone number and one email address.
* The `Year_Built` attribute is stored as a four-digit integer.
* The `Address` attribute is decomposed into `Locality` and `City`. We assume "Guwahati" as the default city unless otherwise specified.

## 2. Entities and Attributes

* **Agent**
    * `Agent_ID` **(PK)**
    * `Name`
    * `Phone`
    * `Email`
* **Property**
    * `Property_ID` **(PK)**
    * `Address`
    * `City` (e.g., Guwahati)
    * `Locality` (e.g., G.S. Road)
    * `Type` (House/Apartment)
    * `Size_Sqft`
    * `Bedrooms`
    * `Year_Built`
    * `Purpose` (Sale/Rent)
    * `Base_Price` (Expected selling price or rent amount)
* **Customer**
    * `Cust_ID` **(PK)**
    * `Name`
    * `Phone`
    * `Email`
    * `Role` (Buyer/Seller/Renter/Owner)
* **Transaction**
    * `Txn_ID` **(PK)**
    * `Txn_Type` (Sale/Rent)
    * `Txn_Date`
    * `Final_Amount` (Actual sold price or final rent amount)

*(Note: `Listing_Date` is captured as an attribute of the `Owns / Sells` relationship to preserve historical data across multiple transactions).*

## 3. Relationships & Cardinalities

**Cardinality Legend:**
* `--->` indicates **1..1** (Exactly One)
* `---` indicates **0..\*** (Zero to Many)
* `===` indicates **1..\*** (One to Many)

| Relationship Name | Entity 1 | Entity 2 | Cardinality | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Owns / Sells** | Customer | Property | 1 : N | One customer (Owner/Seller) can list multiple properties for rent/sale, but a property is listed by exactly one customer. |
| **Facilitates** | Agent | Transaction | 1 : N | One agent can do many transactions, but a single transaction is done by exactly one agent. |
| **Involves** | Property | Transaction | 1 : N | A property can be sold/rented multiple times over its lifetime. |
| **Buys / Rents** | Customer | Transaction | 1 : N | A customer (Buyer/Renter) can participate in multiple transactions, but a single transaction involves exactly one customer. |

## 4. E-R Diagram

```mermaid
graph TD
    %% Tables (Rectangles with Attributes)
    C["<b>CUSTOMER</b><hr><u>Cust_ID</u><br>Name<br>Phone<br>Email<br>Role"]
    T["<b>TRANSACTION</b><hr><u>Txn_ID</u><br>Txn_Type<br>Txn_Date<br>Final_Amount"]
    P["<b>PROPERTY</b><hr><u>Property_ID</u><br>Address<br>City<br>Locality<br>Type<br>Size_Sqft<br>Bedrooms<br>Year_Built<br>Purpose<br>Base_Price"]
    A["<b>AGENT</b><hr><u>Agent_ID</u><br>Name<br>Phone<br>Email"]
    
    %% Relationship Attribute (Oval Shape)
    LD(["Listing_Date"])

    %% Relationships (Diamonds)
    Rel_RentBuy{"Buys / Rents"}
    Rel_Facilitates{"Facilitates"}
    Rel_ListSellsProp{"Owns / Sells"}
    Rel_Involves{"Involves"}

    %% Connect Relationship Attribute
    Rel_ListSellsProp -.- LD

    %% --- CUSTOM NOTATION CARDINALITIES ---
    
    %% TRANSACTION (1..1) to CUSTOMER (0..*)
    T ---> Rel_RentBuy
    Rel_RentBuy --- C

    %% TRANSACTION (1..1) to AGENT (0..*)
    T ---> Rel_Facilitates
    Rel_Facilitates --- A

    %% PROPERTY (1..1) to CUSTOMER (1..*)
    P ---> Rel_ListSellsProp
    Rel_ListSellsProp === C

    %% TRANSACTION (1..1) to PROPERTY (0..*)
    T ---> Rel_Involves
    Rel_Involves --- P