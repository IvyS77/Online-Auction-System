DROP DATABASE IF EXISTS OnlineAuction;
CREATE DATABASE OnlineAuction;
USE OnlineAuction;

-- USERS table
CREATE TABLE USERS (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(80) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- CATEGORY table
CREATE TABLE CATEGORY (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description TEXT
);

-- CONDITION
CREATE TABLE `CONDITION` (
    ConditionID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Detail TEXT
);

-- ITEMS table
CREATE TABLE ITEMS (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description TEXT,
    CategoryID INT NOT NULL,
    ConditionID INT NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID),
    FOREIGN KEY (ConditionID) REFERENCES `CONDITION`(ConditionID),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);

-- AUCTION table
CREATE TABLE AUCTION (
    AuctionID INT AUTO_INCREMENT PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Bid DECIMAL(10,2) NOT NULL,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID)
);

-- PAYMENT table
CREATE TABLE PAYMENT (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    Method ENUM('Credit Card','ApplePay','Paypal') NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    AuctionID INT NOT NULL UNIQUE,
    FOREIGN KEY (AuctionID) REFERENCES AUCTION(AuctionID)
);

-- SHIPPING table
CREATE TABLE SHIPPING (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    Address TEXT NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    PaymentID INT NOT NULL,
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

-- USERS data
INSERT INTO USERS (Username, Email) VALUES
('Eleven Hopper', 'eleven@example.com'),
('Mike Wheeler', 'mike@example.com'),
('Will Byers', 'will@example.com'),
('Lucas Sinclair', 'lucas@example.com'),
('Dustin Henderson', 'dustin@example.com'),
('Max Mayfield', 'max@example.com'),
('Jim Hopper', 'hopper@example.com'),
('Joyce Byers', 'joyce@example.com'),
('Nancy Wheeler', 'nancy@example.com'),
('Steve Harrington', 'steve@example.com');

-- CATEGORY data
INSERT INTO CATEGORY (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Fashion', 'Clothing and fashion goods'),
('Collectibles', 'Trading cards, figures, limited items'),
('Home', 'Household appliances and tools'),
('Sporting Goods', 'Sports equipment and outdoor gear'),
('Toys', 'Model kits, toys, hobby items'),
('Motors', 'Automotive parts and accessories'),
('Books & Magazines', 'Books, manuals, magazines'),
('Music', 'Audio devices and instruments'),
('Health & Beauty', 'Beauty and personal care products');

-- CONDITION data
INSERT INTO `CONDITION` (Type, Detail) VALUES
('New', 'Brand new, factory sealed'),
('New (Other)', 'New but opened or repackaged'),
('Manufacturer Refurbished', 'Refurbished by manufacturer'),
('Seller Refurbished', 'Refurbished by independent seller'),
('Used – Like New', 'Minimal wear, excellent condition'),
('Used – Very Good', 'Light wear, works perfectly'),
('Used – Good', 'Moderate wear, fully functional'),
('Used – Acceptable', 'Noticeable wear, still usable'),
('For Parts or Not Working', 'Does not function properly'),
('Open Box', 'Open box, unused item');

-- ITEMS data
INSERT INTO ITEMS (ItemName, Price, Description, CategoryID, ConditionID, UserID) VALUES
('Apple iPhone 15 Pro 256GB – Titanium Blue', 1199.99, 'Latest generation iPhone 15 Pro', 1, 1, 1),
('Lululemon Everywhere Belt Bag 1L – Black', 38.00, 'Popular everyday essentials bag', 2, 1, 2),
('Pokémon Scarlet & Violet Booster Box', 129.99, 'Factory sealed booster box', 3, 1, 3),
('Dyson Supersonic Hair Dryer', 429.99, 'High-end Dyson hair dryer', 4, 1, 4),
('Wilson NBA Official Game Basketball', 39.99, 'Official NBA basketball', 5, 1, 5),
('Gundam MG 1/100 RX-78-2 Ver. 3.0', 58.99, 'Master Grade Gunpla model kit', 6, 1, 6),
('Bosch Icon Windshield Wiper Blade', 24.99, 'Automotive wiper blade', 7, 1, 7),
('Zelda: TOTK Official Guidebook', 29.99, 'Collector’s edition guidebook', 8, 1, 8),
('Bose QuietComfort Ultra Headphones', 429.00, 'Noise-cancelling flagship headphones', 9, 1, 9),
('CeraVe Hydrating Facial Cleanser 16 oz', 14.99, 'Hydrating dermatologist cleanser', 10, 1, 10);

-- AUCTION data
INSERT INTO AUCTION (StartDate, EndDate, Bid, UserID, ItemID) VALUES
('2025-01-03','2025-01-10', 500.00, 1, 1),
('2025-02-14','2025-02-21', 25.00, 2, 2),
('2025-03-22','2025-03-29', 80.00, 3, 3),
('2025-04-09','2025-04-16', 120.00, 4, 4),
('2025-05-20','2025-05-27', 20.00, 5, 5),
('2025-06-30','2025-07-07', 30.00, 6, 6),
('2025-07-21','2025-07-28', 15.00, 7, 7),
('2025-08-18','2025-08-25', 18.00, 8, 8),
('2025-09-02','2025-09-09', 200.00, 9, 9),
('2025-10-28','2025-11-04', 5.00, 10, 10);

-- PAYMENT data
INSERT INTO PAYMENT (Method, TotalAmount, AuctionID) VALUES
('Credit Card', 520.00, 1),
('Paypal', 45.00, 2),
('ApplePay', 140.00, 3),
('Credit Card', 450.00, 4),
('ApplePay', 48.00, 5),
('Paypal', 45.00, 6),
('Credit Card', 35.00, 7),
('Paypal', 47.00, 8),
('ApplePay', 470.00, 9),
('Credit Card', 25.00, 10);

-- SHIPPING data
INSERT INTO SHIPPING (Address, Cost, PaymentID) VALUES
('90-15 Queens Blvd, Elmhurst, NY 11373', 15.00, 1),
('100 W 33rd St, New York, NY 10001', 18.00, 2),
('10 Columbus Cir, New York, NY 10019', 10.00, 3),
('230 Vesey St, New York, NY 10281', 14.00, 4),
('185 Greenwich St, New York, NY 10007', 8.00, 5),
('5100 Kings Plaza, Brooklyn, NY 11234', 12.50, 6),
('2655 Richmond Ave, Staten Island, NY 10314', 20.00, 7),
('40-24 College Point Blvd, Flushing, NY 11354', 11.00, 8),
('139 Flatbush Ave, Brooklyn, NY 11217', 11.00, 9),
('630 Old Country Rd, Garden City, NY 11530', 9.50, 10);

-- BASIC JOIN
SELECT 
    a.AuctionID,
    i.ItemName,
    u.Username AS Seller,
    a.StartDate,
    a.EndDate,
    a.Bid
FROM AUCTION a
JOIN ITEMS i ON a.ItemID = i.ItemID
JOIN USERS u ON a.UserID = u.UserID;

-- FULL JOIN
SELECT 
    a.AuctionID,
    i.ItemName,
    u.Username AS Seller,
    p.Method AS PaymentMethod,
    p.TotalAmount,
    s.Address,
    s.Cost AS ShippingCost
FROM AUCTION a
JOIN ITEMS i ON a.ItemID = i.ItemID
JOIN USERS u ON a.UserID = u.UserID
JOIN PAYMENT p ON p.AuctionID = a.AuctionID
JOIN SHIPPING s ON s.PaymentID = p.PaymentID;

-- TRANSACTION DEMO
START TRANSACTION;

UPDATE AUCTION
SET Bid = Bid + 50
WHERE AuctionID = 1;

SELECT * FROM AUCTION WHERE AuctionID = 1;

COMMIT;
