-- ============================================================
-- CS241 Project: Deliverable 2 — Data Population
-- Real Estate Office Database (Multi-City)
-- 30 Properties: 10 Guwahati, 5 Mumbai, 5 Delhi, 5 Bangalore, 5 Kolkata
-- ============================================================

USE real_estate;

-- ============================================================
-- Agents (15 agents)
-- ============================================================
INSERT INTO Agent (Agent_ID, Name, Phone, Email) VALUES
(1,  'Rajiv Sharma',       '9854012301', 'rajiv.sharma@realty.in'),
(2,  'Priya Bora',         '9854012302', 'priya.bora@realty.in'),
(3,  'Pradip Das',         '9854012303', 'pradip.das@realty.in'),
(4,  'Meenakshi Kalita',   '9854012304', 'meenakshi.k@realty.in'),
(5,  'Rohit Choudhury',    '9854012305', 'rohit.ch@realty.in'),
(6,  'Deepika Hazarika',   '9854012306', 'deepika.h@realty.in'),
(7,  'Suresh Nath',        '9854012307', 'suresh.nath@realty.in'),
(8,  'Kavita Devi',        '9854012308', 'kavita.devi@realty.in'),
(9,  'Hari Patra',         '9854012309', 'hari.patra@realty.in'),
(10, 'Neha Goswami',       '9854012310', 'neha.goswami@realty.in'),
(11, 'Sarat Choudhary',    '9854012311', 'sarat.choudhary@realty.in'),
(12, 'Ritu Phukan',        '9854012312', 'ritu.phukan@realty.in'),
(13, 'Manish Gogoi',       '9854012313', 'manish.gogoi@realty.in'),
(14, 'Sunita Baruah',      '9854012314', 'sunita.baruah@realty.in'),
(15, 'Dhanjit Barua',      '9854012315', 'dhanjeet.barua@realty.in');

-- ============================================================
-- Customers (25 customers)
-- ============================================================
INSERT INTO Customer (Cust_ID, Name, Phone, Email) VALUES
(1,  'Aman Deka',          '7002100001', 'aman.deka@gmail.com'),
(2,  'Bipul Saikia',       '7002100002', 'bipul.saikia@gmail.com'),
(3,  'Chayanika Borah',    '7002100003', 'chayanika.b@gmail.com'),
(4,  'Debajit Pathak',     '7002100004', 'debajit.p@gmail.com'),
(5,  'Eeshan Mahanta',     '7002100005', 'eeshan.m@gmail.com'),
(6,  'Farhan Ahmed',       '7002100006', 'farhan.ahmed@gmail.com'),
(7,  'Gitanjali Roy',      '7002100007', 'gitanjali.r@gmail.com'),
(8,  'Hemanta Talukdar',   '7002100008', 'hemanta.t@gmail.com'),
(9,  'Ishita Chetia',      '7002100009', 'ishita.c@gmail.com'),
(10, 'Jayanta Bhuyan',     '7002100010', 'jayanta.b@gmail.com'),
(11, 'Kakoli Dutta',       '7002100011', 'kakoli.d@gmail.com'),
(12, 'Lakshya Rajkhowa',   '7002100012', 'lakshya.r@gmail.com'),
(13, 'Manab Jyoti Deka',   '7002100013', 'manab.jd@gmail.com'),
(14, 'Nibedita Sarma',     '7002100014', 'nibedita.s@gmail.com'),
(15, 'Om Prakash Gupta',   '7002100015', 'om.gupta@gmail.com'),
(16, 'Pallavi Konwar',     '7002100016', 'pallavi.k@gmail.com'),
(17, 'Radhika Islam',      '7002100017', 'radhika.i@gmail.com'),
(18, 'Rituraj Hazarika',   '7002100018', 'rituraj.h@gmail.com'),
(19, 'Sanjay Narzary',     '7002100019', 'sanjay.n@gmail.com'),
(20, 'Tanushree Barman',   '7002100020', 'tanushree.b@gmail.com'),
(21, 'Udayan Kashyap',     '7002100021', 'udayan.k@gmail.com'),
(22, 'Varsha Medhi',       '7002100022', 'varsha.m@gmail.com'),
(23, 'Wasim Hussain',      '7002100023', 'wasim.h@gmail.com'),
(24, 'Xena Boro',          '7002100024', 'xena.boro@gmail.com'),
(25, 'Yogesh Tamuli',      '7002100025', 'yogesh.t@gmail.com');

-- ============================================================
-- Properties (30 properties)
-- 10 Guwahati | 5 Mumbai | 5 Delhi | 5 Bangalore | 5 Kolkata
-- ============================================================
INSERT INTO Property (Property_ID, Address, City, Locality, Type, Size_Sqft, Bedrooms, Year_Built, Base_Price, Listing_Date, Purpose, Cust_ID) VALUES

-- ========== GUWAHATI (10) ==========
-- Rent
(1,  '56, Hill Side',              'Guwahati',  'G.S. Road',      'Flat',  1100, 2, 2020, 12000.00,     '2024-09-01', 'Rent', 1),
(2,  '71, Rukmini Gaon Path',      'Guwahati',  'G.S. Road',      'Flat',  1000, 2, 2018, 13500.00,     '2025-02-10', 'Rent', 2),
(3,  '16, Smart City Enclave',     'Guwahati',  'Beltola',        'Flat',  1500, 3, 2024, 14000.00,     '2025-01-05', 'Rent', 3),
(4,  '72, New Horizon Apt',        'Guwahati',  'Dispur',         'Flat',  900,  2, 2025, 11000.00,     '2025-02-15', 'Rent', 4),
-- Sale
(5,  '22, Rajgarh Road',           'Guwahati',  'Ganeshguri',     'House', 3000, 5, 2010, 4500000.00,   '2024-05-20', 'Sale', 5),
(6,  '9, Lamb Road',               'Guwahati',  'Panbazar',       'Flat',  800,  1, 2024, 3500000.00,   '2024-11-01', 'Sale', 6),
(7,  '33, Survey Lane',            'Guwahati',  'Zoo Road',       'House', 1800, 3, 2017, 5500000.00,   '2025-01-10', 'Sale', 7),
(8,  '45, Byelane 3',              'Guwahati',  'Chandmari',      'House', 2200, 4, 2015, 7500000.00,   '2024-07-01', 'Sale', 8),
-- Off market
(9,  '7, Silpukhuri Lane',         'Guwahati',  'Six Mile',       'House', 2800, 4, 2008, 9000000.00,   NULL,         NULL,   9),
(10, '91, Maligaon Chariali',      'Guwahati',  'Maligaon',       'House', 1900, 3, 2016, 4800000.00,   NULL,         NULL,   10),

-- ========== MUMBAI (5) ==========
(11, '24, Andheri West',           'Mumbai',    'Andheri',        'Flat',  1050, 2, 2020, 8500000.00,   '2024-06-01', 'Sale', 11),
(12, '8, Hill Road',               'Mumbai',    'Bandra',         'House', 2500, 4, 2018, 25000000.00,  '2024-08-15', 'Sale', 12),
(13, '15, Hiranandani Gardens',    'Mumbai',    'Powai',          'Flat',  1300, 3, 2022, 45000.00,     '2024-10-01', 'Rent', 13),
(14, '42, Worli Sea Face',         'Mumbai',    'Worli',          'Flat',  1400, 2, 2019, 12000000.00,  NULL,         NULL,   14),
(15, '63, Marve Road',             'Mumbai',    'Malad',          'House', 1600, 3, 2021, 35000.00,     '2024-11-20', 'Rent', 15),

-- ========== DELHI (5) ==========
(16, '31, Sector 12',              'Delhi',     'Dwarka',         'Flat',  1200, 3, 2019, 6500000.00,   '2024-09-10', 'Sale', 1),
(17, '55, Sector 9',               'Delhi',     'Rohini',         'House', 2000, 4, 2016, 11000000.00,  '2024-07-20', 'Sale', 2),
(18, '14, Press Enclave',          'Delhi',     'Saket',          'Flat',  950,  2, 2023, 28000.00,     '2024-12-01', 'Rent', 3),
(19, '88, Nelson Mandela Marg',    'Delhi',     'Vasant Kunj',    'House', 2400, 3, 2014, 8500000.00,   NULL,         NULL,   4),
(20, '27, Amar Colony',            'Delhi',     'Lajpat Nagar',   'Flat',  850,  2, 2020, 22000.00,     '2025-01-10', 'Rent', 5),

-- ========== BANGALORE (5) ==========
(21, '18, 5th Cross',              'Bangalore', 'Koramangala',    'Flat',  1150, 2, 2021, 7200000.00,   '2025-01-01', 'Sale', 6),
(22, '39, ITPL Main Road',         'Bangalore', 'Whitefield',     'House', 2200, 4, 2019, 13000000.00,  '2024-10-15', 'Sale', 7),
(23, '5, 12th Main',               'Bangalore', 'Indiranagar',    'Flat',  1250, 3, 2022, 40000.00,     '2024-11-01', 'Rent', 8),
(24, '48, 27th Main',              'Bangalore', 'HSR Layout',     'Flat',  1100, 2, 2020, 5500000.00,   NULL,         NULL,   9),
(25, '12, Hosur Road',             'Bangalore', 'Electronic City','House', 1700, 3, 2018, 32000.00,     '2025-02-01', 'Rent', 10),

-- ========== KOLKATA (5) ==========
(26, '78, CK Block',               'Kolkata',   'Salt Lake',      'Flat',  1300, 3, 2020, 4800000.00,   '2024-08-01', 'Sale', 11),
(27, '15, Action Area 1',          'Kolkata',   'New Town',       'House', 2100, 4, 2022, 7500000.00,   '2024-09-15', 'Sale', 12),
(28, '33, Russell Street',         'Kolkata',   'Park Street',    'Flat',  950,  2, 2019, 25000.00,     '2024-12-10', 'Rent', 13),
(29, '9, Belvedere Road',          'Kolkata',   'Alipore',        'House', 2600, 3, 2015, 9500000.00,   NULL,         NULL,   14),
(30, '21, Rashbehari Avenue',      'Kolkata',   'Gariahat',       'Flat',  900,  2, 2021, 18000.00,     '2025-01-15', 'Rent', 15);

-- ============================================================
-- Transactions (30 transactions)
-- Spanning 2017–2025 across all cities.
-- Buyer_ID  = the buyer / renter
-- Seller_ID = the seller / landlord (property owner at time of txn)
-- ============================================================
INSERT INTO Transaction (Txn_ID, Txn_Date, Final_Amount, Listing_Date, Purpose, Property_ID, Agent_ID, Buyer_ID, Seller_ID) VALUES

-- 2017
(1,  '2017-04-10', 4200000.00,   '2016-11-15', 'Sale', 10, 1,  10, 13),

-- 2018 (query e: avg selling price in 2018)
(2,  '2018-03-25', 8500000.00,   '2017-09-01', 'Sale', 9,  2,  9,  20),
(3,  '2018-06-15', 11000000.00,  '2018-01-10', 'Sale', 14, 3,  14, 21),
(4,  '2018-08-20', 8000000.00,   '2018-04-01', 'Sale', 19, 4,  4,  22),

-- 2019
(5,  '2019-02-10', 5200000.00,   '2018-10-01', 'Sale', 24, 5,  9,  23),
(6,  '2019-05-18', 9000000.00,   '2019-01-05', 'Sale', 29, 6,  14, 24),
(7,  '2019-06-15', 10000.00,     '2019-03-01', 'Rent', 1,  7,  16, 1),

-- 2020
(8,  '2020-01-20', 42000.00,     '2019-09-01', 'Rent', 13, 8,  17, 13),
(9,  '2020-04-15', 23000.00,     '2019-11-01', 'Rent', 28, 9,  18, 13),

-- 2021
(10, '2021-01-15', 7000000.00,   '2020-06-01', 'Sale', 8,  10, 8,  25),
(11, '2021-03-14', 20000.00,     '2020-10-01', 'Rent', 20, 11, 19, 5),
(12, '2021-08-20', 30000.00,     '2021-04-01', 'Rent', 25, 12, 20, 10),

-- 2022
(13, '2022-02-18', 4300000.00,   '2021-07-01', 'Sale', 5,  13, 5,  15),
(14, '2022-05-30', 8000000.00,   '2021-09-01', 'Sale', 11, 14, 11, 16),
(15, '2022-09-14', 10500000.00,  '2022-01-01', 'Sale', 17, 15, 2,  17),
(16, '2022-06-15', 33000.00,     '2022-03-01', 'Rent', 15, 1,  21, 15),

-- 2023 (query d: agent with most sales in 2023)
(17, '2023-01-20', 5300000.00,   '2022-06-15', 'Sale', 7,  2,  7,  18),
(18, '2023-04-12', 12500000.00,  '2022-10-01', 'Sale', 22, 3,  7,  19),
(19, '2023-06-30', 4600000.00,   '2023-01-15', 'Sale', 26, 4,  11, 20),
(20, '2023-09-15', 38000.00,     '2023-04-01', 'Rent', 23, 5,  22, 8),
(21, '2023-08-22', 17000.00,     '2023-05-01', 'Rent', 30, 6,  23, 15),
(22, '2023-12-10', 24000000.00,  '2023-06-01', 'Sale', 12, 2,  12, 21),

-- 2024
(23, '2024-02-15', 3400000.00,   '2023-08-01', 'Sale', 6,  7,  6,  22),
(24, '2024-05-20', 6200000.00,   '2023-10-01', 'Sale', 16, 8,  1,  23),
(25, '2024-07-18', 7000000.00,   '2024-01-01', 'Sale', 21, 9,  6,  24),
(26, '2024-08-05', 7200000.00,   '2024-02-01', 'Sale', 27, 10, 12, 25),
(27, '2024-09-05', 12500.00,     '2024-04-01', 'Rent', 2,  11, 24, 2),
(28, '2024-11-12', 26000.00,     '2024-06-01', 'Rent', 18, 12, 25, 3),

-- 2025
(29, '2025-01-25', 10500.00,     '2024-08-01', 'Rent', 4,  13, 16, 4),
(30, '2025-03-15', 13500.00,     '2024-12-01', 'Rent', 3,  14, 17, 3);
