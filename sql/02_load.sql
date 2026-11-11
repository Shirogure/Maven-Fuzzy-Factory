USE toy_store;

TRUNCATE TABLE products;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products                      
FIELDS TERMINATED BY ','                 
OPTIONALLY ENCLOSED BY '"'               
LINES TERMINATED BY '\r\n'               
IGNORE 1 LINES;                         

-- ---------------------------------------------------------------------
-- 2) orders
-- ---------------------------------------------------------------------
TRUNCATE TABLE orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- ---------------------------------------------------------------------
-- 3) order_items
-- ---------------------------------------------------------------------
TRUNCATE TABLE order_items;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- ---------------------------------------------------------------------
-- 4) order_item_refunds
-- ---------------------------------------------------------------------
TRUNCATE TABLE order_item_refunds;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_item_refunds.csv'
INTO TABLE order_item_refunds
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- ---------------------------------------------------------------------
-- 5) website_sessions
-- ---------------------------------------------------------------------
TRUNCATE TABLE website_sessions;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/website_sessions.csv'
INTO TABLE website_sessions
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(website_session_id, created_at, user_id, is_repeat_session,
 @utm_source, @utm_campaign, @utm_content, device_type, @http_referer)
SET utm_source   = NULLIF(@utm_source,   'NULL'),
    utm_campaign = NULLIF(@utm_campaign, 'NULL'),
    utm_content  = NULLIF(@utm_content,  'NULL'),
    http_referer = NULLIF(@http_referer, 'NULL');


-- ---------------------------------------------------------------------
-- 6) website_pageviews
-- ---------------------------------------------------------------------
TRUNCATE TABLE website_pageviews;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/website_pageviews.csv'
INTO TABLE website_pageviews
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
