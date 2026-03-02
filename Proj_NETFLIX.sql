/*Project NETFLIX*/
DROP DATABASE NETFLIX;
/*create a database NETFLIX*/
CREATE DATABASE NETFLIX;

/*set NETFLIX as the working database*/
USE NETFLIX;

/*create a customer table*/
CREATE TABLE customer_T (
customer_id int(11) not null AUTO_INCREMENT, 
custF_name varchar (50),
custL_name varchar (50),
custphone_numb varchar (10),
cust_email varchar (50),
cust_country varchar (50), 
custdate_of_birth DATE,
CONSTRAINT customer_pk PRIMARY KEY (customer_id));

/*create a provider table*/
CREATE TABLE provider_T (
provider_id int(11) not null AUTO_INCREMENT,
provider_name varchar (50), 
CONSTRAINT provider_pk PRIMARY KEY (provider_id));


/*create a device table*/
CREATE TABLE device_T (
device_id int (11) not null AUTO_INCREMENT,
IP_address varchar (20),
acct_activity varchar(50),
device_profile varchar (50),
device_time TIME,
customer_id int (11) not null, 
CONSTRAINT device_pk PRIMARY KEY (device_id),
CONSTRAINT device_fk FOREIGN KEY (customer_id) REFERENCES customer_T (customer_id) ON UPDATE CASCADE);


/*create a product table*/
CREATE TABLE product_T (
product_id int (11) not null AUTO_INCREMENT,
tv_series varchar (50),
films varchar (50),
games varchar (50),
leisure_activities varchar (50),
chrome_extensions varchar (50),
provider_id int(11) not null,
device_id int(11) not null,
CONSTRAINT product_pk PRIMARY KEY (product_id),
CONSTRAINT product_fk1 FOREIGN KEY (device_id) REFERENCES device_T (device_id),
CONSTRAINT product_fk2 FOREIGN KEY (provider_id) REFERENCES provider_T (provider_id));


/*Create customer_product table*/
CREATE TABLE customer_product_T (
customer_id int(11) not null,
product_id int(11) not null,
CONSTRAINT cust_product_pk PRIMARY KEY (customer_id, product_id),
CONSTRAINT cust_product_fk1 FOREIGN KEY (customer_id) REFERENCES customer_T (customer_id) ON UPDATE CASCADE,
CONSTRAINT cust_product_fk2 FOREIGN KEY (product_id) REFERENCES product_T (product_id) ON UPDATE CASCADE
);

/*create an account table*/
CREATE TABLE account_T (
account_id int (11) not null AUTO_INCREMENT,
acct_password varchar (50),
pmt_method varchar(50),
membership_preference varchar (50),
acct_profiles varchar (50),
acct_devices varchar (50),
customer_id int (11) not null,
CONSTRAINT account_pk PRIMARY KEY (account_id),
CONSTRAINT account_fk FOREIGN KEY (customer_id) REFERENCES customer_T (customer_id) ON UPDATE CASCADE
);

/*create a subscription table*/
CREATE TABLE subscription_T (
subscription_id int (11) not null AUTO_INCREMENT,
join_date DATE,
last_pmtdate DATE,
account_status varchar (50),
subscription_type varchar (50),
account_id int (11) not null,
product_id int (11) not null,
CONSTRAINT sub_pk PRIMARY KEY (subscription_id),
CONSTRAINT sub_fk1 FOREIGN KEY (account_id) REFERENCES account_T (account_id),
CONSTRAINT sub_fk2 FOREIGN KEY (product_id) REFERENCES product_T (product_id)
);


/*create basic sub table*/
CREATE TABLE basic_subscription_T (
subscription_id int (11) not null,
basic_feature varchar(50),
CONSTRAINT basic_sub_pk PRIMARY KEY (subscription_id),
CONSTRAINT basic_sub_fk FOREIGN KEY (subscription_id) REFERENCES subscription_T (subscription_id) 
);

/*create standard sub table*/
CREATE TABLE standard_subscription_T (
subscription_id int (11) not null,
stndrd_feature_one varchar(50),
stndrd_feature_two varchar(50),
CONSTRAINT stndrd_sub_pk PRIMARY KEY (subscription_id),
CONSTRAINT stndrd_sub_fk FOREIGN KEY (subscription_id) REFERENCES subscription_T (subscription_id)
);

/*create premium sub table*/
CREATE TABLE premium_subscription_T (
subscription_id int (11) not null,
prem_feature_one varchar(50),
prem_feature_two varchar(50),
CONSTRAINT prem_sub_pk PRIMARY KEY (subscription_id),
CONSTRAINT prem_sub_fk FOREIGN KEY (subscription_id) REFERENCES subscription_T (subscription_id)
);

/*insert data in customer_T*/
INSERT INTO customer_T (customer_id, custF_name, custL_name, custphone_numb, cust_email, cust_country, custdate_of_birth) VALUES 
(1, 'John', 'Doe', '1234567890', 'john.doe@email.com', 'USA', '1985-06-15'),
(2, 'Jane', 'Smith', '2345678901', 'jane.smith@email.com', 'Canada', '1990-02-25'),
(3, 'Alice', 'Brown', '3456789012', 'alice.brown@email.com', 'UK', '1988-09-10'),
(4, 'Bob', 'Johnson', '4567890123', 'bob.johnson@email.com', 'USA', '1982-04-05'),
(5, 'Charlie', 'Williams', '5678901234', 'charlie.williams@email.com', 'Australia', '1993-11-20'),
(6, 'David', 'Jones', '6789012345', 'david.jones@email.com', 'Canada', '1987-03-30'),
(7, 'Eva', 'Martinez', '7890123456', 'eva.martinez@email.com', 'Spain', '1995-07-19'),
(8, 'Fay', 'Garcia', '8901234567', 'fay.garcia@email.com', 'Mexico', '1989-12-05'),
(9, 'George', 'Rodriguez', '9012345678', 'george.rodriguez@email.com', 'Colombia', '1991-01-14'),
(10, 'Hannah', 'Lee', '1234509876', 'hannah.lee@email.com', 'South Korea', '1986-06-22'),
(11, 'Irene', 'Gonzalez', '2345610987', 'irene.gonzalez@email.com', 'Argentina', '1994-05-30'),
(12, 'Jack', 'Perez', '3456721098', 'jack.perez@email.com', 'Chile', '1992-02-11'),
(13, 'Karen', 'Wilson', '4567832109', 'karen.wilson@email.com', 'USA', '1980-08-15'),
(14, 'Leo', 'Miller', '5678943210', 'leo.miller@email.com', 'Canada', '1996-09-28'),
(15, 'Mia', 'Taylor', '6789054321', 'mia.taylor@email.com', 'Australia', '1989-11-09'),
(16, 'Nina', 'Anderson', '7890165432', 'nina.anderson@email.com', 'USA', '1993-05-03'),
(17, 'Oscar', 'Thomas', '8901276543', 'oscar.thomas@email.com', 'UK', '1990-12-21'),
(18, 'Paul', 'Jackson', '9012387654', 'paul.jackson@email.com', 'Germany', '1984-10-17'),
(19, 'Quinn', 'White', '1234098765', 'quinn.white@email.com', 'South Africa', '1992-03-28'),
(20, 'Rachel', 'Harris', '2345109876', 'rachel.harris@email.com', 'USA', '1987-08-02');

SELECT * FROM customer_T;

/*insert data in provider_T*/
INSERT INTO provider_T (provider_id, provider_name) 
VALUES 
(1, 'Netflix'),
(2, 'Hulu'),
(3, 'Amazon Prime Video'),
(4, 'Disney+'),
(5, 'HBO Max'),
(6, 'Apple TV+'),
(7, 'Peacock'),
(8, 'Paramount+'),
(9, 'Discovery+'),
(10, 'YouTube TV'),
(11, 'Vudu'),
(12, 'Crackle'),
(13, 'Tubi'),
(14, 'Pluto TV'),
(15, 'Shudder'),
(16, 'FuboTV'),
(17, 'Sling TV'),
(18, 'Starz'),
(19, 'BBC iPlayer'),
(20, 'Roku');

SELECT * FROM provider_T;

/*insert vals in device_T*/
INSERT INTO device_T (device_id, IP_address, acct_activity, device_profile, device_time, customer_id) 
VALUES 
(1, '192.168.1.1', 'Login', 'Main Profile', '18:30:00', 1),
(2, '192.168.1.2', 'Streaming', 'Kids Profile', '19:15:00', 2),
(3, '192.168.1.3', 'Logout', 'Guest Profile', '20:00:00', 3),
(4, '192.168.1.4', 'Streaming', 'Main Profile', '21:30:00', 4),
(5, '192.168.1.5', 'Download', 'Travel Profile', '22:00:00', 5),
(6, '192.168.1.6', 'Login', 'Main Profile', '18:45:00', 6),
(7, '192.168.1.7', 'Browsing', 'Kids Profile', '19:00:00', 7),
(8, '192.168.1.8', 'Streaming', 'Guest Profile', '19:45:00', 8),
(9, '192.168.1.9', 'Logout', 'Main Profile', '20:15:00', 9),
(10, '192.168.2.0', 'Streaming', 'Main Profile', '21:00:00', 10),
(11, '192.168.2.1', 'Streaming', 'Travel Profile', '22:30:00', 11),
(12, '192.168.2.2', 'Login', 'Guest Profile', '23:00:00', 12),
(13, '192.168.2.3', 'Browsing', 'Main Profile', '18:15:00', 13),
(14, '192.168.2.4', 'Download', 'Kids Profile', '18:30:00', 14),
(15, '192.168.2.5', 'Logout', 'Main Profile', '19:00:00', 15),
(16, '192.168.2.6', 'Streaming', 'Guest Profile', '19:30:00', 16),
(17, '192.168.2.7', 'Browsing', 'Main Profile', '20:00:00', 17),
(18, '192.168.2.8', 'Download', 'Travel Profile', '20:30:00', 18),
(19, '192.168.2.9', 'Login', 'Main Profile', '21:00:00', 19),
(20, '192.168.3.0', 'Streaming', 'Kids Profile', '21:30:00', 20);

SELECT * FROM device_T;

/*insert vals in product table*/
INSERT INTO product_T (product_id, tv_series, films, games, leisure_activities, chrome_extensions, provider_id, device_id) 
VALUES 
(1, 'Breaking Bad', 'The Godfather', 'FIFA 21', 'Watching Movies', 'Netflix Party', 1, 1),
(2, 'Stranger Things', 'Titanic', 'NBA 2K21', 'Watching TV', 'AdBlocker', 2, 1),
(3, 'The Mandalorian', 'Inception', 'Minecraft', 'Gaming', 'Honey', 3, 4),
(4, 'The Crown', 'The Matrix', 'Fortnite', 'Traveling', 'Grammarly', 4, 4),
(5, 'The Boys', 'Avengers: Endgame', 'Call of Duty', 'Reading', 'Google Translate', 5, 3),
(6, 'Game of Thrones', 'Jurassic Park', 'Overwatch', 'Exercise', 'VidIQ', 6, 5),
(7, 'Narcos', 'The Dark Knight', 'Apex Legends', 'Cooking', 'LastPass', 7, 2),
(8, 'The Witcher', 'The Lion King', 'Valorant', 'Hiking', 'Evernote', 8, 2),
(9, 'Friends', 'Pulp Fiction', 'League of Legends', 'Shopping', 'Loom', 9, 1),
(10, 'The Office', 'Gladiator', 'Rocket League', 'Photography', 'Trello', 10, 3),
(11, 'Black Mirror', 'Fight Club', 'Super Smash Bros', 'Fishing', 'Zoom', 11, 4),
(12, 'The Umbrella Academy', 'The Matrix', 'Minecraft Dungeons', 'Camping', 'Slack', 12, 5),
(13, 'Peaky Blinders', 'Interstellar', 'The Sims 4', 'Traveling', 'Spotify', 13, 1),
(14, 'Ozark', 'Forrest Gump', 'FIFA 22', 'Biking', 'Grammarly', 14, 2),
(15, 'The Office', 'The Shawshank Redemption', 'Madden NFL 21', 'Reading', 'Asana', 15, 3),
(16, 'Stranger Things', 'The Godfather Part II', 'GTA V', 'Jogging', 'Google Keep', 16, 4),
(17, 'Narcos', 'The Departed', 'Rocket League', 'Music', 'Hootsuite', 17, 1),
(18, 'Breaking Bad', 'The Prestige', 'Fortnite', 'Watching Sports', 'Bitly', 18, 5),
(19, 'Mindhunter', 'Interstellar', 'PUBG', 'Running', 'Zoom', 19, 2),
(20, 'The Crown', 'The Dark Knight Rises', 'Rainbow Six Siege', 'Crafting', 'Notion', 20, 6);

SELECT * FROM product_T;

/*Insert vals in cust_product_T*/
INSERT INTO customer_product_T (customer_id, product_id) VALUES
(1, 10), 
(11, 2), 
(12, 3), 
(4, 13), 
(20, 5),
(6, 16), 
(19, 7), 
(8, 15), 
(18, 9), 
(10, 17), 
(14, 11), 
(12, 9), 
(8, 13), 
(7, 14), 
(15, 6), 
(5, 16), 
(17, 4), 
(3, 18), 
(19, 2), 
(1, 20);

SELECT * FROM customer_product_T;  

/*insert vals in account_T*/
INSERT INTO account_T (account_id, acct_password, pmt_method, membership_preference, acct_profiles, acct_devices, customer_id) 
VALUES 
(1, 'password123', 'Visa', 'Standard', 'John\'s Profile', 'iPhone, MacBook', 1),
(2, 'password456', 'PayPal', 'Premium', 'Jane\'s Profile', 'MacBook', 2),
(3, 'password789', 'Mastercard', 'Basic', 'Alice\'s Profile', 'Laptop', 3),
(4, 'password101', 'Apple Pay', 'Standard', 'Bob\'s Profile', 'Tablet', 4),
(5, 'password102', 'American Express', 'Premium', 'Charlie\'s Profile', 'Desktop', 5),
(6, 'password103', 'Google Pay', 'Standard', 'David\'s Profile', 'TV', 6),
(7, 'password104', 'Discover', 'Basic', 'Eva\'s Profile', 'Phone', 7),
(8, 'password105', 'PayPal', 'Standard', 'Fay\'s Profile', 'Smartwatch', 8),
(9, 'password106', 'Visa', 'Premium', 'George\'s Profile', 'Computer', 9),
(10, 'password107', 'Apple Pay', 'Standard', 'Hannah\'s Profile', 'Laptop', 10),
(11, 'password108', 'Mastercard', 'Basic', 'Irene\'s Profile', 'iPad', 11),
(12, 'password109', 'Google Pay', 'Standard', 'Jack\'s Profile', 'Phone', 12),
(13, 'password110', 'American Express', 'Premium', 'Karen\'s Profile', 'Tablet', 13),
(14, 'password111', 'PayPal', 'Basic', 'Leo\'s Profile', 'PC', 14),
(15, 'password112', 'Visa', 'Standard', 'Mia\'s Profile', 'TV', 15),
(16, 'password113', 'Apple Pay', 'Premium', 'Nina\'s Profile', 'Phone', 16),
(17, 'password114', 'Mastercard', 'Standard', 'Oscar\'s Profile', 'Laptop', 17),
(18, 'password115', 'Google Pay', 'Basic', 'Paul\'s Profile', 'Smartwatch', 18),
(19, 'password116', 'Visa', 'Standard', 'Quinn\'s Profile', 'Desktop', 19),
(20, 'password117', 'Visa', 'Premium', 'Rachel\'s Profile', 'Phone', 20);

SELECT * FROM account_T;

/*insert vals into subscriptioin_T*/
INSERT INTO subscription_T (subscription_id, join_date, last_pmtdate, account_status, subscription_type, account_id, product_id) 
VALUES 
(1, '2024-01-15', '2024-02-15', 'Active', 'Basic', 1, 1),
(2, '2024-02-20', '2024-03-20', 'Active', 'Standard', 2, 2),
(3, '2024-03-10', '2024-04-10', 'Inactive', 'Premium', 3, 3),
(4, '2024-01-05', '2024-02-05', 'Active', 'Premium', 4, 4),
(5, '2024-05-15', '2024-06-15', 'Active', 'Basic', 5, 5),
(6, '2024-06-01', '2024-07-01', 'Active', 'Standard', 6, 6),
(7, '2024-07-20', '2024-08-20', 'Inactive', 'Basic', 7, 7),
(8, '2024-08-12', '2024-09-12', 'Active', 'Standard', 8, 8),
(9, '2024-09-15', '2024-10-15', 'Active', 'Premium', 9, 9),
(10, '2024-10-10', '2024-11-10', 'Active', 'Premium', 10, 10),
(11, '2024-11-01', '2024-12-01', 'Inactive', 'Basic', 11, 11),
(12, '2024-12-01', '2025-01-01', 'Active', 'Standard', 12, 12),
(13, '2024-03-15', '2024-04-15', 'Active', 'Basic', 13, 13),
(14, '2024-04-25', '2024-05-25', 'Inactive', 'Standard', 14, 14),
(15, '2024-05-10', '2024-06-10', 'Active', 'Premium', 15, 15),
(16, '2024-06-15', '2024-07-15', 'Active', 'Standard', 16, 16),
(17, '2024-07-01', '2024-08-01', 'Inactive', 'Basic', 17, 17),
(18, '2024-08-25', '2024-09-25', 'Active', 'Premium', 18, 18),
(19, '2024-09-10', '2024-10-10', 'Active', 'Standard', 19, 19),
(20, '2024-10-05', '2024-11-05', 'Inactive', 'Basic', 20, 20);

SELECT * FROM subscription_T;

/*insert vals to basic_sub_T*/
INSERT INTO basic_subscription_T (subscription_id, basic_feature) VALUES
(1, 'Ad Supported'),
(5, 'Ad Supported'),
(7, 'Ad Supported'),
(11, 'Ad Supported'),
(13, 'Ad Supported'),
(17, 'Ad Supported'),
(20, 'Ad Supported');

SELECT * FROM basic_subscription_T;

/*insert vals to standard_subscription_T*/
INSERT INTO standard_subscription_T (subscription_id, stndrd_feature_one, stndrd_feature_two) VALUES
(2, 'HD Streaming', '2 Screens at once'),
(6, 'HD Streaming', '2 Screens at once'),
(8, 'HD Streaming', '2 Screens at once'),
(12, 'HD Streaming', '2 Screens at once'),
(16, 'HD Streaming', '2 Screens at once'),
(19, 'HD Streaming', '2 Screens at once');

SELECT * FROM standard_subscription_T;

/*insert vals to premium_subscription_T*/
INSERT INTO premium_subscription_T (subscription_id, prem_feature_one, prem_feature_two) VALUES
(3, '4K Streaming', '4 Screens at once'),
(4, '4K Streaming', '4 Screens at once'),
(9, '4K Streaming', '4 Screens at once'),
(10, '4K Streaming', '4 Screens at once'),
(15, '4K Streaming', '4 Screens at once'),
(18, '4K Streaming', '4 Screens at once');

SELECT * FROM premium_subscription_T;

/*create active customers view*/
CREATE VIEW v_active_customers AS
SELECT customer_T.customer_id, custF_name, custL_name, cust_country, subscription_T.account_status
FROM customer_T NATURAL JOIN account_T NATURAL JOIN subscription_T ;

	SELECT * FROM v_active_customers;

	SELECT * FROM v_active_customers
	WHERE account_status = 'Active';

	SELECT account_status, count(account_status) FROM v_active_customers
	GROUP BY account_status;

	SELECT cust_country AS 'Customer Location', count(cust_country) FROM v_active_customers
	GROUP BY cust_country;

	#DROP VIEW v_active_customers;

/*Create subscriptioin_type_overview*/
CREATE VIEW v_subscription_type_overview AS
SELECT customer_T.customer_id, custF_name, custL_name, subscription_T.subscription_type, account_status
FROM customer_T INNER JOIN account_T ON
customer_T.customer_id = account_T.customer_id INNER JOIN subscription_T
ON account_T.account_id = subscription_T.account_id;

	SELECT * FROM v_subscription_type_overview;

	SELECT subscription_type, count(subscription_type) 
	FROM v_subscription_type_overview
	GROUP BY subscription_type;

	#DROP VIEW v_subscription_type_overview;

/*Implement relations in the relational data model developed in item 4 by using DDL and DML in MySQL. Populate sample data into these tables (20 pts): 
(1). Tables, columns, keys, etc. with at least 20 rows of data per table. (10 pts); 
(2). 5 SQL Queries inclusive of at least 3 JOINs; (5 pts); 
(3). 2 Views (5 pts) */