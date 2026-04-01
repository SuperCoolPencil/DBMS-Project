USE real_estate;

-- Query (a): Houses in Guwahati built later than 2023, available for rent
SELECT Property_ID, Address, Locality, Type, Size_Sqft, Bedrooms,
       Year_Built, Base_Price AS Monthly_Rent, Listing_Date
FROM Property
WHERE City = 'Guwahati'
  AND Year_Built > 2023
  AND Purpose = 'Rent';

-- Query (b): Addresses of houses costing between Rs.20,00,000 and Rs.60,00,000
SELECT Property_ID, Address, Locality, City, Type, Base_Price
FROM Property
WHERE City = 'Guwahati'
  AND Purpose = 'Sale'
  AND Base_Price BETWEEN 2000000 AND 6000000;

-- Query (c): Houses for rent on G.S. Road with >= 2 bedrooms
--            and rent < Rs.15,000/month
SELECT Property_ID, Address, Locality, Type, Bedrooms,
       Base_Price AS Monthly_Rent
FROM Property
WHERE Locality = 'G.S. Road'
  AND Purpose = 'Rent'
  AND Bedrooms >= 2
  AND Base_Price < 15000;

-- Query (d): Agent who sold the most property in 2023
--            by total amount in rupees
SELECT a.Agent_ID, a.Name, SUM(t.Final_Amount) AS Total_Sales_Amount
FROM Transaction t
JOIN Agent a ON t.Agent_ID = a.Agent_ID
WHERE t.Purpose = 'Sale'
  AND YEAR(t.Txn_Date) = 2023
GROUP BY a.Agent_ID, a.Name
ORDER BY Total_Sales_Amount DESC
LIMIT 1;

-- Query (e): For each agent, average selling price of properties
--            sold in 2018 and average time on market
SELECT a.Agent_ID, a.Name,
       AVG(t.Final_Amount) AS Avg_Selling_Price,
       AVG(DATEDIFF(t.Txn_Date, t.Listing_Date)) AS Avg_Days_On_Market
FROM Transaction t
JOIN Agent a ON t.Agent_ID = a.Agent_ID
WHERE t.Purpose = 'Sale'
  AND YEAR(t.Txn_Date) = 2018
GROUP BY a.Agent_ID, a.Name;

-- Query (f): Most expensive house for sale and highest rent

-- Most expensive property for sale
SELECT Property_ID, Address, Locality, City, Type, Size_Sqft,
       Bedrooms, Year_Built, Base_Price
FROM Property
WHERE Purpose = 'Sale'
ORDER BY Base_Price DESC
LIMIT 1;

-- Property with the highest rent
SELECT Property_ID, Address, Locality, City, Type, Size_Sqft,
       Bedrooms, Year_Built, Base_Price AS Monthly_Rent
FROM Property
WHERE Purpose = 'Rent'
ORDER BY Base_Price DESC
LIMIT 1;
